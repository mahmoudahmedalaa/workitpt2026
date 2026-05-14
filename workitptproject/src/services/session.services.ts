import { Request } from 'express'
import Session, { ISession } from '@models/session.models'
import Booking, { IBooking } from '@models/booking.model'
import {
  SESSION_STATUS_ACTIVE,
  SESSION_STATUS_INACTIVE,
  successSession
} from '@constants/session.contant'
import { IReturnResponse } from '@interfaces/response'
import {
  parseTime,
  checkForSessionOverlap,
  checkForBookingOverlap
} from '@helpers/sessions'
import { v4 as uuidv4 } from 'uuid'
import { FilterQuery } from 'mongoose'
import bookingService from './booking.services'
import { Types } from 'mongoose'
import { PAID } from '@constants/paid.constant'
import { buildSearchByMultipleFields } from '@utils/search'
import { calculateCharge } from '@helpers/calculateprice'

const sessionService = {
  list: async (
    page: number,
    limit: number,
    req: Request
  ): Promise<IReturnResponse> => {
    let groupedSessions
    let totalPage
    let total
    const currentPage = page >= 1 ? page - 1 : page
    const skip = currentPage * limit
    const filter = await sessionService.createSessionFilter(req)
    if (req.user.role === 'TRAINER') {
      const sessions = await Session.find({
        trainer: req.user._id,
        status: SESSION_STATUS_ACTIVE,
        ...filter
      })
        .select('-createdAt -updatedAt -status -date_to -__v')
        .skip(skip)
        .limit(limit)
        .sort({ _id: -1 })
      groupedSessions = await Promise.all(
        sessions.map(async session => {
          return {
            id: session._id,
            session_title: session.session_title,
            time_from: session.time_from,
            time_to: session.time_to,
            session: session.session,
            session_type: session.session_type,
            day_of_week: session.day_of_week,
            select_type: session.select_type,
            images: session.images,
            day: session.day_of_week,
            price: session.price,
            location_on_map: session.location_on_map,
            referenceId: session.referenceId,
            isBooking: false,
            date: new Date(session.date_from).toISOString().split('T')[0],
            difficulty_level: session.difficulty_level,
            booked: await bookingService.isSessionBooked(session._id),
            trainer: {
              id: req.user._id,
              firstName: req.user.firstName,
              lastName: req.user.lastName,
              avatar: req.user.avatar
            },
            coordicates: session.coordicates
          }
        })
      )
      total = await Session.countDocuments({
        trainer: req.user._id,
        status: SESSION_STATUS_ACTIVE,
        ...filter
      })
      totalPage = Math.ceil(total / limit)
    } else if (req.user.role === 'USER') {
      const paidSessionReferenceIds =
        await bookingService.getPaidSessionReferenceIds(req.user._id)
      groupedSessions = await Session.aggregate([
        {
          $match: {
            ...filter,
            status: SESSION_STATUS_ACTIVE,
            date_from: { $gt: new Date() }
          }
        },
        { $match: { referenceId: { $nin: paidSessionReferenceIds } } },
        {
          $group: {
            _id: '$referenceId',
            id: { $first: '$_id' },
            session_title: { $first: '$session_title' },
            time_from: { $first: '$time_from' },
            time_to: { $first: '$time_to' },
            session: { $first: '$session' },
            session_type: { $first: '$session_type' },
            select_type: { $first: '$select_type' },
            images: { $first: '$images' },
            day: { $first: '$day_of_week' },
            trainer: { $first: '$trainer' },
            date_from: { $first: '$date_from' },
            price: { $first: '$price' },
            location_on_map: { $first: '$location_on_map' },
            referenceId: { $first: '$referenceId' },
            difficulty_level: { $first: '$difficulty_level' },
            location: { $first: '$location' },
            online_url: { $first: '$online_url' },
            ratings: { $first: '$ratings' }
          }
        },
        {
          $project: {
            _id: 0,
            id: 1,
            session_title: 1,
            time_from: 1,
            time_to: 1,
            session: 1,
            session_type: 1,
            day_of_week: 1,
            select_type: 1,
            images: 1,
            day: 1,
            price: 1,
            location_on_map: 1,
            referenceId: 1,
            date: {
              $dateToString: {
                format: '%Y-%m-%d', // Date format (YYYY-MM-DD)
                date: '$date_from'
              }
            },
            trainer: 1,
            difficulty_level: 1,
            location: 1,
            online_url: 1,
            ratings: 1
          }
        },
        {
          $lookup: {
            from: 'users',
            localField: 'trainer',
            foreignField: '_id',
            as: 'trainer'
          }
        },
        { $unwind: '$trainer' },
        {
          $project: {
            id: 1,
            session_title: 1,
            time_from: 1,
            time_to: 1,
            session: 1,
            session_type: 1,
            day_of_week: 1,
            select_type: 1,
            images: 1,
            day: 1,
            date: 1,
            price: 1,
            location_on_map: 1,
            referenceId: 1,
            trainer: {
              id: '$trainer._id',
              firstName: '$trainer.firstName',
              lastName: '$trainer.lastName',
              avatar: '$trainer.avatar'
            },
            difficulty_level: 1,
            location: 1,
            online_url: 1,
            ratings: 1
          }
        },
        { $skip: skip },
        { $limit: limit },
        { $sort: { _id: -1 } }
      ])
      groupedSessions = await Promise.all(
        groupedSessions.map(async session => ({
          ...session,
          booked: await bookingService.isSessionBooked(session.id)
        }))
      )
      total = await Session.countDocuments({
        ...filter,
        status: SESSION_STATUS_ACTIVE,
        referenceId: { $nin: paidSessionReferenceIds }
      })
      totalPage = Math.ceil(total / limit)
    }
    return {
      ok: true,
      status: successSession.listSession.status,
      message: successSession.listSession.msg,
      data: groupedSessions ? groupedSessions : [],
      currentPage: page,
      totalPage: totalPage,
      limit: limit,
      total: total
    }
  },

  create: async (
    sessionInfo: ISession,
    trainer: string
  ): Promise<IReturnResponse> => {
    delete sessionInfo.status
    if (sessionInfo.location_range && sessionInfo.location_range > 15) {
      return {
        ok: false,
        data: {},
        status: successSession.locationRangeSession.status,
        message: successSession.locationRangeSession.msg
      }
    }
    const timeFrom = await parseTime(sessionInfo.time_from)
    const timeTo = await parseTime(sessionInfo.time_to)
    const refreanceId = uuidv4()
    const sessions = []
    for (const dayOfWeekInfo of sessionInfo.dayOfWeek) {
      const dayOfWeek = dayOfWeekInfo.day
      const dateFrom = new Date(dayOfWeekInfo.date_from)
      const dateTo = new Date(dayOfWeekInfo.date_from)
      // Create start and end Date objects considering both date and time
      const sessionStartDateTime = new Date(dateFrom)
      sessionStartDateTime.setUTCHours(timeFrom.hours, timeFrom.minutes)
      const sessionEndDateTime = new Date(dateTo)
      sessionEndDateTime.setUTCHours(timeTo.hours, timeTo.minutes)
      const overlappingSessions = await checkForSessionOverlap(
        sessionStartDateTime,
        sessionEndDateTime,
        Session,
        trainer,
        sessionInfo.session,
        sessionInfo.time_from,
        sessionInfo.time_to
      )
      if (overlappingSessions.length > 0) {
        return {
          ok: false,
          data: {},
          status: successSession.overLapSession.status,
          message: successSession.overLapSession.msg
        }
      }
      const newSession = await Session.create({
        ...sessionInfo,
        day_of_week: dayOfWeek,
        date_from: sessionStartDateTime,
        date_to: sessionEndDateTime,
        referenceId: refreanceId,
        trainer: trainer
      })
      sessions.push(newSession)
    }
    const data = sessions.map(session => {
      return {
        id: session._id,
        session_title: session.session_title,
        time_from: session.time_from,
        time_to: session.time_to,
        session: session.session,
        session_type: session.session_type,
        day_of_week: session.day_of_week,
        select_type: session.select_type,
        images: session.images,
        day: session.day_of_week,
        price: parseFloat(session.price.toFixed(2)),
        location_on_map: session.location_on_map
          ? session.location_on_map
          : null,
        referenceId: session.referenceId,
        isBooking: false,
        date: new Date(session.date_from).toISOString().split('T')[0],
        what_to_expect: session.what_to_expect,
        benefits: session.benefits,
        flexible_location: session.flexible_location,
        location: session.location,
        what_to_bring: session.what_to_bring,
        location_range: session.location_range,
        no_of_attendees: session.no_of_attendees,
        cordinates: session.coordicates
      }
    })

    return {
      ok: true,
      status: successSession.addSession.status,
      message: successSession.addSession.msg,
      data: data
    }
  },

  update: async (
    referenceId: string,
    sessionInfo: ISession,
    trainer: string
  ): Promise<IReturnResponse> => {
    delete sessionInfo.status
    const sessionToUpdate = await Session.find({
      referenceId: referenceId,
      status: SESSION_STATUS_ACTIVE
    })
    if (!sessionToUpdate || sessionToUpdate.length === 0) {
      return {
        ok: false,
        status: successSession.checkSession.status,
        data: {},
        message: successSession.checkSession.msg
      }
    }
    const updatedSessions = await Promise.all(
      sessionToUpdate.map(async session => {
        const updatedSession = await Session.findByIdAndUpdate(
          session._id,
          {
            ...sessionInfo,
            location_range: sessionInfo.flexible_location
              ? sessionInfo.location_range
              : null,
            trainer: trainer
          },
          { new: true }
        )
        return updatedSession
      })
    )
    const updatedata = updatedSessions.map(session => {
      return {
        id: session._id,
        session_title: session.session_title,
        time_from: session.time_from,
        time_to: session.time_to,
        session: session.session,
        session_type: session.session_type,
        day_of_week: session.day_of_week,
        select_type: session.select_type,
        images: session.images,
        day: session.day_of_week,
        price: session.price,
        location_on_map: session.location_on_map
          ? session.location_on_map
          : null,
        referenceId: session.referenceId,
        isBooking: false,
        date: new Date(session.date_from).toISOString().split('T')[0],
        what_to_expect: session.what_to_expect,
        benefits: session.benefits,
        flexible_location: session.flexible_location,
        location: session.location,
        what_to_bring: session.what_to_bring,
        location_range: session.location_range,
        no_of_attendees: session.no_of_attendees
      }
    })
    return {
      ok: true,
      status: successSession.updateSession.status,
      message: successSession.updateSession.msg,
      data: updatedata ? updatedata : []
    }
  },

  deleteSession: async (sessionId: string): Promise<IReturnResponse> => {
    const session = await Session.findOne({
      _id: sessionId,
      status: SESSION_STATUS_ACTIVE
    })
    if (!session) {
      return {
        ok: false,
        status: successSession.checkSession.status,
        data: {},
        message: successSession.checkSession.msg
      }
    }
    session.status = SESSION_STATUS_INACTIVE
    await session.save()
    return {
      ok: true,
      status: successSession.deleteSession.status,
      data: {},
      message: successSession.deleteSession.msg
    }
  },

  viewSession: async (
    sessionId: string,
    userId: string
  ): Promise<IReturnResponse> => {
    const session = await Session.findOne({
      _id: sessionId,
      status: SESSION_STATUS_ACTIVE
    })
      .populate({
        path: 'trainer',
        select: 'firstName lastName avatar',
        transform: document => ({
          id: document._id,
          firstName: document.firstName,
          lastName: document.lastName,
          avatar: document.avatar
        })
      })
      .select('-createdAt -updatedAt -__v')
    if (!session) {
      return {
        ok: false,
        status: successSession.checkSession.status,
        data: {},
        message: successSession.checkSession.msg
      }
    }

    const booking = await bookingService.findOne({
      session: sessionId,
      user: userId,
      date_from: { $gte: new Date() },
      date_to: { $gte: new Date() }
    })

    const sessionsByReference = await Session.find({
      referenceId: session.referenceId,
      date_from: { $gt: new Date() }
    })
    const prefrenceDataTime = await Promise.all(
      sessionsByReference.map(async session => {
        const timeFrom = await parseTime(session.time_from)
        const timeTo = await parseTime(session.time_to)
        const date = new Date(session.date_from)
        // Create start and end Date objects considering both date and time
        const sessionStartDateTime = new Date(date)
        sessionStartDateTime.setUTCHours(timeFrom.hours, timeFrom.minutes)
        const sessionEndDateTime = new Date(date)
        sessionEndDateTime.setUTCHours(timeTo.hours, timeTo.minutes)
        const checkOverLabBooking = await checkForBookingOverlap(
          sessionStartDateTime,
          sessionEndDateTime,
          userId
        )
        return {
          time_from: session.time_from,
          time_to: session.time_to,
          date: session.date_from,
          day: session.day_of_week,
          session: {
            price: session.price
          },
          session_id: session._id,
          isBooking: checkOverLabBooking ? true : false
        }
      })
    )

    const isSessionBooked = await bookingService.isSessionBooked(sessionId)
    const updatedSession = {
      id: session._id,
      date: new Date(session.date_from).toISOString().split('T')[0],
      prefrenceDataTime,
      isPaid: booking ? booking.isPaid : undefined,
      pendingBookingId:
        booking && (booking.isPaid === 'Pending' || booking.isPaid === 'Unpaid')
          ? booking._id
          : undefined,
      ...session.toObject(),
      booked: isSessionBooked
    }
    const revisedSessionAsBooking: IBooking | any =
      updatedSession.prefrenceDataTime
    const pricingDetails = calculateCharge(revisedSessionAsBooking)
    return {
      ok: true,
      status: successSession.viewSession.status,
      data: {
        ...updatedSession,
        pricing: pricingDetails
      },
      message: successSession.viewSession.msg
    }
  },

  upcommingSession: async (
    page: number,
    limit: number,
    req: any
  ): Promise<IReturnResponse> => {
    let groupedSessions
    let totalPage
    let total
    const currentPage = page >= 1 ? page - 1 : page
    const skip = currentPage * limit
    const filter = await sessionService.createSessionFilter(req)
    const currentDate = new Date()
    const formattedCurrentDate = currentDate.toISOString().split('T')[0]

    const paidSessionReferenceIds =
      await bookingService.getPaidSessionReferenceIds(req.user._id)

    const commonQuery = {
      $expr: {
        $gt: [
          { $dateToString: { format: '%Y-%m-%d', date: '$date_from' } },
          formattedCurrentDate
        ]
      },
      status: SESSION_STATUS_ACTIVE,
      ...filter
    } as FilterQuery<ISession>

    if (req.user.role === 'TRAINER') {
      const trainerQuery = {
        trainer: req.user._id,
        ...commonQuery
      }
      const sessions = await Session.find(trainerQuery)
        .select(
          '-createdAt -updatedAt -status -date_to -__v -coordicates -trainer -ratings'
        )
        .skip(skip)
        .limit(limit)
        .sort({ date_from: 1 })
      groupedSessions = await Promise.all(
        sessions.map(async session => {
          return {
            id: session._id,
            session_title: session.session_title,
            time_from: session.time_from,
            time_to: session.time_to,
            session: session.session,
            session_type: session.session_type,
            day_of_week: session.day_of_week,
            select_type: session.select_type,
            images: session.images,
            day: session.day_of_week,
            price: session.price,
            location_on_map: session.location_on_map,
            referenceId: session.referenceId,
            rating: session.rating ? session.rating : null,
            date: new Date(session.date_from).toISOString().split('T')[0],
            difficulty_level: session.difficulty_level,
            booked: await bookingService.isSessionBooked(session._id),
            location: session.location,
            trainer: {
              id: req.user._id,
              firstName: req.user.firstName,
              lastName: req.user.lastName,
              avatar: req.user.avatar
            }
          }
        })
      )
      total = await Session.countDocuments(trainerQuery)
      totalPage = Math.ceil(total / limit)
    } else if (req.user.role === 'USER') {
      groupedSessions = await Session.aggregate([
        { $match: { ...commonQuery } },
        { $match: { referenceId: { $nin: paidSessionReferenceIds } } },
        {
          $group: {
            _id: '$referenceId',
            id: { $first: '$_id' },
            referenceId: { $first: '$referenceId' },
            session_title: { $first: '$session_title' },
            time_from: { $first: '$time_from' },
            time_to: { $first: '$time_to' },
            session: { $first: '$session' },
            session_type: { $first: '$session_type' },
            select_type: { $first: '$select_type' },
            images: { $first: '$images' },
            day: { $first: '$day_of_week' },
            date_from: { $first: '$date_from' },
            price: { $first: '$price' },
            location_on_map: { $first: '$location_on_map' },
            trainer: { $first: '$trainer' },
            difficulty_level: { $first: '$difficulty_level' },
            location: { $first: '$location' }
          }
        },
        {
          $lookup: {
            from: 'users',
            localField: 'trainer',
            foreignField: '_id',
            as: 'trainerInfo'
          }
        },
        { $unwind: '$trainerInfo' },
        {
          $project: {
            _id: 0,
            id: 1,
            referenceId: 1,
            session_title: 1,
            time_from: 1,
            time_to: 1,
            session: 1,
            session_type: 1,
            day_of_week: 1,
            select_type: 1,
            images: 1,
            day: 1,
            price: 1,
            location_on_map: 1,
            // trainer: 1,
            date: {
              $dateToString: {
                format: '%Y-%m-%d', // Date format (YYYY-MM-DD)
                date: '$date_from'
              }
            },
            trainer: {
              id: '$trainerInfo._id',
              firstName: '$trainerInfo.firstName',
              lastName: '$trainerInfo.lastName',
              avatar: '$trainerInfo.avatar'
            },
            difficulty_level: 1,
            location: 1
          }
        },
        { $skip: skip },
        { $limit: limit },
        { $sort: { date: 1 } }
      ])
      groupedSessions = await Promise.all(
        groupedSessions.map(async session => ({
          ...session,
          booked: await bookingService.isSessionBooked(session.id)
        }))
      )
      total = groupedSessions.length
      totalPage = Math.ceil(total / limit)
    }
    return {
      ok: true,
      status: successSession.listSession.status,
      message: successSession.listSession.msg,
      data: groupedSessions,
      currentPage: page,
      totalPage: totalPage,
      limit: limit,
      total: total
    }
  },
  previousSession: async (
    page: number,
    limit: number,
    req: any
  ): Promise<IReturnResponse> => {
    let groupedSessions
    let totalPage
    let total
    const currentPage = page >= 1 ? page - 1 : page
    const skip = currentPage * limit
    const filter = await sessionService.createSessionFilter(req)
    const currentDate = new Date()
    const formattedCurrentDate = currentDate.toISOString().split('T')[0]
    const commonQuery = {
      $expr: {
        $lt: [
          { $dateToString: { format: '%Y-%m-%d', date: '$date_from' } },
          formattedCurrentDate
        ]
      },
      status: SESSION_STATUS_ACTIVE,
      ...filter
    } as FilterQuery<ISession>
    if (req.user.role === 'TRAINER') {
      const trainerQuery = {
        trainer: req.user._id,
        ...commonQuery
      }
      const sessions = await Session.find(trainerQuery)
        .select(
          '-createdAt -updatedAt -status -date_to -__v -coordicates -ratings'
        )
        .skip(skip)
        .limit(limit)
        .sort({ _id: -1 })
      groupedSessions = await Promise.all(
        sessions.map(async session => {
          return {
            id: session._id,
            session_title: session.session_title,
            time_from: session.time_from,
            time_to: session.time_to,
            session: session.session,
            session_type: session.session_type,
            day_of_week: session.day_of_week,
            select_type: session.select_type,
            images: session.images,
            day: session.day_of_week,
            price: session.price,
            location_on_map: session.location_on_map,
            referenceId: session.referenceId,
            rating: session.rating ? session.rating : null,
            date: new Date(session.date_from).toISOString().split('T')[0],
            difficulty_level: session.difficulty_level,
            booked: await bookingService.isSessionBooked(session._id),
            location: session.location,
            trainer: {
              id: req.user._id,
              firstName: req.user.firstName,
              lastName: req.user.lastName,
              avatar: req.user.avatar
            }
          }
        })
      )
      total = await Session.countDocuments(trainerQuery)
      totalPage = Math.ceil(total / limit)
    } else if (req.user.role === 'USER') {
      groupedSessions = await Session.aggregate([
        { $match: commonQuery },
        {
          $group: {
            _id: '$referenceId',
            id: { $first: '$_id' },
            referenceId: { $first: '$referenceId' },
            session_title: { $first: '$session_title' },
            time_from: { $first: '$time_from' },
            time_to: { $first: '$time_to' },
            session: { $first: '$session' },
            session_type: { $first: '$session_type' },
            select_type: { $first: '$select_type' },
            images: { $first: '$images' },
            day: { $first: '$day_of_week' },
            date_from: { $first: '$date_from' },
            price: { $first: '$price' },
            location_on_map: { $first: '$location_on_map' },
            trainer: { $first: '$trainer' },
            difficulty_level: { $first: '$difficulty_level' },
            location: { $first: '$location' }
          }
        },
        {
          $lookup: {
            from: 'users',
            localField: 'trainer',
            foreignField: '_id',
            as: 'trainerInfo'
          }
        },
        { $unwind: '$trainerInfo' },
        {
          $project: {
            _id: 0,
            id: 1,
            referenceId: 1,
            session_title: 1,
            time_from: 1,
            time_to: 1,
            session: 1,
            session_type: 1,
            day_of_week: 1,
            select_type: 1,
            images: 1,
            day: 1,
            price: 1,
            location_on_map: 1,
            date: {
              $dateToString: {
                format: '%Y-%m-%d',
                date: '$date_from'
              }
            },
            trainer: {
              id: '$trainerInfo._id',
              firstName: '$trainerInfo.firstName',
              lastName: '$trainerInfo.lastName',
              avatar: '$trainerInfo.avatar'
            },
            difficulty_level: 1,
            location: 1
          }
        },
        { $skip: skip },
        { $limit: limit },
        { $sort: { _id: -1 } }
      ])
      groupedSessions = await Promise.all(
        groupedSessions.map(async session => ({
          ...session,
          booked: await bookingService.isSessionBooked(session.id)
        }))
      )
      total = groupedSessions.length
      totalPage = Math.ceil(total / limit)
    }
    return {
      ok: true,
      status: successSession.listSession.status,
      message: successSession.listSession.msg,
      data: groupedSessions,
      currentPage: page,
      totalPage: totalPage,
      limit: limit,
      total: total
    }
  },

  completedSession: async (
    page: number,
    limit: number,
    req: any
  ): Promise<IReturnResponse> => {
    try {
      const currentDate = new Date()
      const formattedCurrentDate = currentDate.toISOString().split('T')[0]
      const formattedCurrentTime = currentDate
        .toISOString()
        .split('T')[1]
        .split('.')[0]

      if (req.user.role === 'USER') {
        const bookings = await Booking.find({
          sessionStatus: 'Ended',
          isPaid: 'Paid',
          user: req.user._id
        })
          .populate({
            path: 'session',
            // select:
            //   'session_title session_type select_type images day_of_week date_from time_from date_to time_to price location_on_map trainer difficulty_level location',
            populate: {
              path: 'trainer',
              select: 'firstName lastName avatar'
            }
          })
          .skip((page - 1) * limit)
          .limit(limit)
          .sort({ _id: -1 })

        console.log('Booking => ', bookings)

        const groupedSessions = await Promise.all(
          bookings.map(async booking => {
            const session = booking.session.toObject()
            return {
              ...session,
              booked: true,
              reviewStatus: session.ratings.some((rating: { user: any }) =>
                new Types.ObjectId(req.user._id).equals(rating.user)
              )
            }
          })
        )

        const total = await Booking.countDocuments({
          sessionStatus: 'Ended',
          isPaid: 'Paid',
          date_to: { $gte: formattedCurrentDate },
          $or: [
            {
              date_to: formattedCurrentDate,
              time_to: { $gte: formattedCurrentTime }
            },
            { date_to: { $gt: formattedCurrentDate } }
          ],
          ...(await sessionService.createSessionFilter(req))
        })

        const totalPage = Math.ceil(total / limit)

        return {
          ok: true,
          status: successSession.listSession.status,
          message: successSession.listSession.msg,
          data: groupedSessions,
          currentPage: page,
          totalPage: totalPage,
          limit: limit,
          total: total
        }
      } else {
        return {
          ok: false,
          status: successSession.listSession.status,
          message: `User is not a Customer`,
          data: {}
        }
      }
    } catch (error) {
      console.error('Error fetching completed sessions:', error)
      return {
        ok: false,
        status: 400,
        message: 'An error occurred while fetching completed sessions.',
        data: {}
      }
    }
  },

  todaySession: async (req: any): Promise<IReturnResponse> => {
    const currentDate = new Date()
    const formattedCurrentDate = currentDate.toISOString().split('T')[0] // Extract the date portion

    const groupedSessions = await Session.aggregate([
      {
        $match: {
          status: SESSION_STATUS_ACTIVE,
          trainer: req.user._id,
          $expr: {
            $eq: [
              { $dateToString: { format: '%Y-%m-%d', date: '$date_from' } }, // Format date_from
              formattedCurrentDate // Compare with the formatted current date
            ]
          }
        }
      },
      {
        $group: {
          _id: '$referenceId',
          id: { $first: '$_id' },
          session_title: { $first: '$session_title' },
          time_from: { $first: '$time_from' },
          time_to: { $first: '$time_to' },
          session: { $first: '$session' },
          session_type: { $first: '$session_type' },
          select_type: { $first: '$select_type' }
        }
      },
      {
        $project: {
          _id: 0,
          id: 1,
          session_title: 1,
          time_from: 1,
          time_to: 1,
          session: 1,
          session_type: 1,
          day_of_week: 1,
          select_type: 1
        }
      }
    ])
    return {
      ok: true,
      status: successSession.listSession.status,
      message: successSession.listSession.msg,
      data: groupedSessions
    }
  },

  sessionByRefrenceId: async (
    page: number,
    limit: number,
    req: any
  ): Promise<IReturnResponse> => {
    let groupedSessions
    let totalPage
    let total
    const currentPage = page >= 1 ? page - 1 : page
    const skip = currentPage * limit
    const filter = await sessionService.createSessionFilter(req)
    groupedSessions = await Session.find({
      referenceId: req.params.referenceId,
      status: SESSION_STATUS_ACTIVE,
      ...filter
    })
      .skip(skip)
      .limit(limit)
      .sort({ _id: -1 })
    total = groupedSessions.length
    totalPage = Math.ceil(total / limit)
    return {
      ok: true,
      status: successSession.listSession.status,
      message: successSession.listSession.msg,
      data: groupedSessions ? groupedSessions : [],
      currentPage: page,
      totalPage: totalPage,
      limit: limit,
      total: total
    }
  },

  rating: async (req: any): Promise<IReturnResponse> => {
    const sessionId = req.params.sessionId
    const { rating } = req.body
    console.log(
      'rating =>',
      rating,
      sessionId,
      typeof rating !== 'number',
      rating < 0,
      rating > 5
    )
    const user = req.user._id
    if (typeof rating !== 'number' || rating < 0 || rating > 5) {
      return {
        ok: false,
        status: successSession.listSession.status,
        message: 'Invalid rating value',
        data: {}
      }
    }
    const session = await Session.findOne({
      _id: sessionId,
      status: SESSION_STATUS_ACTIVE
    })

    if (!session) {
      return {
        ok: false,
        status: successSession.listSession.status,
        message: 'Invalid rating session',
        data: {}
      }
    }
    const existingRatingIndex = session.ratings.findIndex(
      r => String(r.user) === String(user)
    )

    if (existingRatingIndex !== -1) {
      session.ratings[existingRatingIndex].rating = rating
    } else {
      session.ratings.push({ user: user, rating })
    }
    const totalRating = session.ratings.reduce((sum, r) => sum + r.rating, 0)
    session.rating = Number((totalRating / session.ratings.length).toFixed(2))
    await session.save({ validateBeforeSave: false })
    return {
      ok: true,
      status: successSession.listSession.status,
      message: 'Rating Submitted',
      data: {}
    }
  },

  async createSessionFilter(req: Request) {
    const filter = {} as FilterQuery<ISession>
    const search = req.query.search
    const workoutLocation =
      typeof req.query.workoutLocation === 'string'
        ? req.query.workoutLocation.split(',')
        : undefined
    const workoutTypes =
      typeof req.query.workoutType === 'string'
        ? req.query.workoutType.split(',')
        : undefined
    const sessionType = req.query.sessionType
    const difficultyLevel = req.query.difficultyLevel
    const selectType = req.query.selectType
    const booked =
      req.query.booked && typeof req.query.booked === 'string'
        ? JSON.parse(req.query.booked)
        : undefined

    const minPrice =
      req.query.minPrice && typeof req.query.minPrice === 'string'
        ? parseFloat(req.query.minPrice)
        : undefined
    const maxPrice =
      req.query.maxPrice && typeof req.query.maxPrice === 'string'
        ? parseFloat(req.query.maxPrice)
        : undefined
    if (sessionType) filter.session_type = sessionType
    if (difficultyLevel) filter.difficulty_level = difficultyLevel
    if (selectType) filter.select_type = selectType

    if (minPrice) filter.price = { $gte: minPrice }
    if (maxPrice) filter.price = { $lte: maxPrice }
    if (minPrice && maxPrice) filter.price = { $gte: minPrice, $lte: maxPrice }

    if (workoutTypes) filter.session = { $in: workoutTypes }
    if (workoutLocation) filter.location = { $in: workoutLocation }

    if (req.user?.role === 'TRAINER' && booked !== undefined) {
      const trainerSessionIds = await Session.find({
        trainer: req.user._id,
        status: SESSION_STATUS_ACTIVE,
        date_from: { $gte: new Date() }
      }).distinct('_id')
      const bookedSessionIds = await Booking.find({
        isPaid: PAID,
        session: { $in: trainerSessionIds }
      }).distinct('session')
      filter._id = booked
        ? { $in: bookedSessionIds }
        : { $nin: bookedSessionIds }
    }

    if (req.user?.role === 'USER' && booked !== undefined) {
      const bookedSessionIds = await Booking.find({
        isPaid: PAID,
        user: req.user._id,
        date_from: { $gte: new Date() }
      }).distinct('session')
      console.log({ booked, bookedSessionIds })
      filter._id = booked
        ? { $in: bookedSessionIds }
        : { $nin: bookedSessionIds }
    }

    if (search && typeof search === 'string')
      filter.$or = buildSearchByMultipleFields(
        ['session', 'session_title'],
        search
      )

    return filter
  }
}

export default sessionService
