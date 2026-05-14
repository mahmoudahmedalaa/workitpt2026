import Booking, { IBooking } from '@models/booking.model'
import Session, { ISession } from '@models/session.models'
import {
  SESSION_STATUS_ACTIVE,
  successSession
} from '@constants/session.contant'
import { IReturnResponse } from '@interfaces/response'
import { calculateHaversineDistance } from '@helpers/distancerange'
import { parseTime } from '@helpers/sessions'
import { PAID, PENDING, UNPAID } from '@constants/paid.constant'
import { FilterQuery } from 'mongoose'
import { calculateCharge } from '@helpers/calculateprice'
import { NotificationService } from './notification.services'
import User from '@models/user.model'

const bookingService = {
  list: async (
    page: number,
    limit: number,
    req: any
  ): Promise<IReturnResponse> => {
    const isPaid = req.query.isPaid as
      | typeof UNPAID
      | typeof PAID
      | typeof PENDING
    const currentPage = page >= 1 ? page - 1 : page
    const pipeline = [
      {
        $lookup: {
          from: 'sessions',
          localField: 'session',
          foreignField: '_id',
          as: 'sessionDetails'
        }
      },
      {
        $lookup: {
          from: 'users',
          localField: 'sessionDetails.trainer',
          foreignField: '_id',
          as: 'trainerInfo'
        }
      },
      {
        $lookup: {
          from: 'users',
          localField: 'user',
          foreignField: '_id',
          as: 'userInfo'
        }
      },
      {
        $addFields: {
          'sessionDetails.trainer': {
            firstName: { $arrayElemAt: ['$trainerInfo.firstName', 0] },
            lastName: { $arrayElemAt: ['$trainerInfo.lastName', 0] },
            avatar: { $arrayElemAt: ['$trainerInfo.avatar', 0] }
          },
          user: {
            firstName: { $arrayElemAt: ['$userInfo.firstName', 0] },
            lastName: { $arrayElemAt: ['$userInfo.lastName', 0] },
            avatar: { $arrayElemAt: ['$userInfo.avatar', 0] }
          }
        }
      },
      {
        $group: {
          _id: { $first: '$sessionDetails.referenceId' },
          session: {
            $first: { $arrayElemAt: ['$sessionDetails', 0] }
          },
          prices: {
            $push: { $arrayElemAt: ['$sessionDetails.price', 0] }
          },
          user: { $first: '$user' },
          payment_id: { $first: '$payment_id' },
          date_from: { $first: '$date_from' },
          date_to: { $first: '$date_to' },
          time_from: { $first: '$time_from' },
          time_to: { $first: '$time_to' },
          visited: { $first: '$visited' },
          bookingId: { $first: '$_id' },
          isPaid: { $first: '$isPaid' },
          sessionStatus: { $first: '$sessionStatus' }
        }
      },
      { $match: isPaid ? { isPaid } : {} },
      {
        $facet: {
          paginatedResults: [{ $skip: currentPage * limit }, { $limit: limit }],
          totalCount: [
            {
              $count: 'total'
            }
          ]
        }
      }
    ]
    const bookings = await Booking.aggregate(pipeline)
    const total = bookings[0].totalCount[0]?.total || 0
    const totalPage = Math.ceil(total / limit)

    return {
      ok: true,
      status: successSession.listBooking.status,
      message: successSession.listBooking.msg,
      data: bookings.length ? bookings[0]?.paginatedResults : [],
      currentPage: page,
      totalPage: totalPage,
      limit: limit,
      total: total
    }
  },
  create: async (
    bookingInfo: IBooking,
    user: string
  ): Promise<IReturnResponse> => {
    const existingBooking = await Booking.findOne({
      user: user,
      session: bookingInfo.dates[0].session
    }).exec()
    if (existingBooking) {
      return {
        ok: false,
        status: 200,
        message: 'Booking already exists for this user and session.',
        data: []
      }
    }
    let session = await Session.findOne({ _id: bookingInfo.dates[0].session })
    const bookingData = await Promise.all(
      bookingInfo.dates.map(async date => {
        const timeFrom = await parseTime(session.time_from)
        const timeTo = await parseTime(session.time_to)
        const bookingStartDateTime = new Date(date.date)
        bookingStartDateTime.setUTCHours(timeFrom.hours, timeFrom.minutes)
        const bookingEndDateTime = new Date(date.date)
        bookingEndDateTime.setUTCHours(timeTo.hours, timeTo.minutes)
        const createdBooking = await Booking.create({
          user: user,
          time_from: session.time_from,
          time_to: session.time_to,
          date_from: bookingStartDateTime,
          date_to: bookingEndDateTime,
          referanceId: session.referenceId,
          session: date.session
        })
        await createdBooking.populate([
          {
            path: 'session',
            populate: {
              path: 'trainer',
              select: 'firstName lastName avatar'
            },
            transform(doc, id) {
              const sessionJson: ISession = doc.toJSON()
              return {
                ...sessionJson,
                id: sessionJson._id,
                _id: undefined,
                date: sessionJson.date_from
              }
            }
          },
          {
            path: 'user',
            select: 'firstName lastName avatar -_id'
          }
        ])
        return createdBooking
      })
    )
    const notification = new NotificationService()
    const currentTrainer = await User.findOne({ _id: session.trainer })
    const currentUser = await User.findOne({ _id: user }).select(
      'firstName lastName'
    )
    await notification.notify({
      user: currentTrainer,
      title: 'Workitpt - Session purchased',
      body: `session purchased successfully by ${currentUser?.firstName} ${currentUser?.lastName}`,
      isAdmin: false
    })
    return {
      ok: true,
      status: successSession.addBooking.status,
      message: successSession.addBooking.msg,
      data: bookingData
    }
  },
  upcommingMyBooking: async (
    page: number,
    limit: number,
    req: any
  ): Promise<IReturnResponse> => {
    let bookings
    let totalPage
    let total
    const currentPage = page >= 1 ? page - 1 : page
    const skip = currentPage * limit
    const currentDate = new Date()
    const query = {
      date_from: { $gt: currentDate },
      user: req.user._id,
      session: { $exists: true },
      isPaid: PAID
    } satisfies FilterQuery<IBooking>

    bookings = await Booking.find(query)
      .select('-createdAt -updatedAt -user -status -referanceId -__v') // Exclude additional fields
      .skip(skip)
      .limit(limit)
      .sort({ _id: -1 })
      .populate([
        {
          path: 'session',
          populate: {
            path: 'trainer',
            select: 'firstName lastName avatar'
          },
          transform(doc, id) {
            const sessionJson: ISession = doc.toJSON()
            return {
              ...sessionJson,
              id: sessionJson._id,
              _id: undefined,
              date: sessionJson.date_from
            }
          }
        },
        {
          path: 'user',
          select: 'firstName lastName avatar -_id'
        }
      ])
    const modifiedBookings = bookings.map(booking => {
      return {
        _id: booking._id,
        ...booking.toObject(),
        date: new Date(booking.date_from).toLocaleDateString('en-US', {
          month: 'short',
          day: 'numeric'
        })
      }
    })

    total = await Booking.countDocuments({ user: req.user._id })
    totalPage = Math.ceil(total / limit)
    return {
      ok: true,
      status: successSession.upcommingBookingList.status,
      message: successSession.upcommingBookingList.msg,
      data: modifiedBookings,
      currentPage: page,
      totalPage: totalPage,
      limit: limit,
      total: total
    }
  },
  pendingPayments: async (
    page: number,
    limit: number,
    req: any
  ): Promise<IReturnResponse> => {
    let bookings
    let totalPage
    let total
    const currentPage = page >= 1 ? page - 1 : page
    const skip = currentPage * limit
    const query = {
      user: req.user._id,
      isPaid: { $in: [PENDING, UNPAID] },
      date_from: { $gt: new Date() },
      session: { $exists: true }
    } satisfies FilterQuery<IBooking>

    bookings = await Booking.find(query)
      .select('-createdAt -updatedAt -user -status -referanceId -__v') // Exclude additional fields
      .skip(skip)
      .limit(limit)
      .sort({ _id: -1 })
      .populate([
        {
          path: 'session',
          populate: {
            path: 'trainer',
            select: 'firstName lastName avatar'
          },
          transform(doc, id) {
            const sessionJson: ISession = doc.toJSON()
            return {
              ...sessionJson,
              id: sessionJson._id,
              _id: undefined,
              date: sessionJson.date_from
            }
          }
        },
        {
          path: 'user',
          select: 'firstName lastName avatar -_id'
        }
      ])
    const modifiedPendingPayments = bookings.map(booking => {
      return {
        _id: booking._id,
        ...booking.toObject(),
        date: new Date(booking.date_from).toLocaleDateString('en-US', {
          month: 'short',
          day: 'numeric'
        })
      }
    })

    total = await Booking.countDocuments({ user: req.user._id })
    totalPage = Math.ceil(total / limit)
    return {
      ok: true,
      status: successSession.upcommingBookingList.status,
      message: successSession.upcommingBookingList.msg,
      data: modifiedPendingPayments,
      currentPage: page,
      totalPage: totalPage,
      limit: limit,
      total: total
    }
  },
  locationRange: async (req: any): Promise<IReturnResponse> => {
    const { sessionId, location } = req.body
    const session = await Session.findById(sessionId)
    if (!session) {
      return {
        ok: true,
        status: successSession.checkSession.status,
        message: successSession.checkSession.msg,
        data: {}
      }
    }
    const sessionCoordinates = {
      lat: session.coordicates.lat,
      lon: session.coordicates.lng
    }
    const userCoordinates = { lat: location.lat, lon: location.lng }
    const distance = calculateHaversineDistance(
      sessionCoordinates,
      userCoordinates
    )
    const locationRange = session.location_range
    console.log('localRanage => ', locationRange)
    if (distance <= locationRange) {
      return {
        ok: true,
        status: successSession.listSession.status,
        message: `Session is within the ${locationRange} km range`,
        data: {}
      }
    } else {
      return {
        ok: false,
        status: successSession.listSession.status,
        message: `Session is outside the ${locationRange} km range`,
        data: {}
      }
    }
  },
  bookingDetail: async (
    bookingId: string,
    userId: string
  ): Promise<IReturnResponse> => {
    const booking = await bookingService.findOne({
      _id: bookingId,
      user: userId
      // date_from: { $gt: new Date() }
    })
    if (!booking)
      return {
        ok: false,
        status: 404,
        message: 'Booking not found'
      }
    return {
      ok: true,
      status: 200,
      message: 'Booking found',
      data: booking
    }
  },
  bookingDetailMultiple: async (
    bookingIds: string[],
    userId: string
  ): Promise<IReturnResponse> => {
    const bookings = await Promise.all(
      bookingIds.map(bookingId =>
        bookingService.findOne({
          _id: bookingId,
          user: userId,
          date_from: { $gt: new Date() }
        })
      )
    )
    if (!bookings || bookingIds.length === 0)
      return {
        ok: false,
        status: 404,
        message: 'Booking not found'
      }
    const bookingDates = bookings.map(booking => booking.date_from)
    const session = bookings[0].session
    const pricingDetails = calculateCharge(bookings)
    return {
      ok: true,
      status: 200,
      message: 'Booking found',
      data: {
        session,
        bookingDates,
        pricingDetails
      }
    }
  },
  isSessionBooked: async (sessionId: string): Promise<boolean> => {
    const currentDate = new Date()
    const booking = await Booking.findOne({
      date_from: { $gt: currentDate },
      date_to: { $gt: currentDate },
      session: sessionId,
      isPaid: PAID
    })
    return booking ? true : false
  },
  findOne: async (filter: FilterQuery<IBooking>): Promise<IBooking | null> => {
    const booking = await Booking.findOne(filter).populate([
      {
        path: 'session',
        populate: {
          path: 'trainer',
          select: 'firstName lastName avatar'
        },
        transform(doc, id) {
          const sessionJson: ISession = doc.toJSON()
          return {
            ...sessionJson,
            id: sessionJson._id,
            _id: undefined,
            date: sessionJson.date_from
          }
        }
      },
      {
        path: 'user',
        select: 'firstName lastName avatar -_id'
      }
    ])
    return booking
  },
  async getPaidSessionReferenceIds(userId: string): Promise<string[]> {
    const paidBookings = await Booking.find({
      isPaid: PAID
    }).populate([
      {
        path: 'session',
        select: 'referenceId'
      }
    ])
    const paidSessionReferenceIds = [
      ...new Set(paidBookings.map(booking => booking.session.referenceId))
    ]
    return paidSessionReferenceIds
  },

  async getPaidCustomerIds(trainerId: string): Promise<string[]> {
    const sessionIds = await Session.find({
      trainer: trainerId,
      status: SESSION_STATUS_ACTIVE
    }).distinct('_id')
    const paidCustomerIds = await Booking.find({
      isPaid: PAID,
      session: { $in: sessionIds }
    }).distinct('user')
    return paidCustomerIds
  }
}

export default bookingService
