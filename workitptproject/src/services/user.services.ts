import { IReturnResponse } from '@interfaces/response'
import Session from '@models/session.models'
import { FilterQuery, Types } from 'mongoose'
import Booking, { IBooking } from '@models/booking.model'
import User, { IUser } from '@models/user.model'
import { ICustomer } from '@models/customer.model'
import {
  getTrainerAverageSessionPrice,
  getTrainerAverageSessionRating
} from '@utils/session'
import { PAID, PENDING, UNPAID } from '@constants/paid.constant'
import dayjs from 'dayjs'
import { ICutomerAnalytics } from '@storage/customerAnalytics.storage'
import { ITrainerAnalytics } from '@storage/trainerAnalytics.storage'
import { ITrainer } from '@models/trainer.model'
import bookingService from './booking.services'

// import { UNPAID } from '@constants/paid.constant'

const userServices = {
  listTrainer: async (
    page: number,
    limit: number,
    user?: IUser,
    appliedFilters?: {
      specialization?: string
      rating?: string
      location?: string
      price?: { min: string; max: string }
      trainer?: string
      search?: string
    }
  ): Promise<IReturnResponse> => {
    let filter: { [key: string]: any } = {}
    let recommentedTrainers = new Array()
    const currentPage = page >= 1 ? page - 1 : page
    const { specialization, rating, location, price, trainer } = appliedFilters
    if (trainer) filter['_id'] = new Types.ObjectId(trainer)
    if (specialization) {
      const listSpecializations = specialization.split(',')
      switch (true) {
        case listSpecializations.length > 1:
          filter['specialization'] = {
            $in: listSpecializations.map(i => new RegExp(i, 'i'))
          }
          break
        default:
          filter['specialization'] = new RegExp(specialization, 'i')
          break
      }
    }
    if (rating) filter['rating'] = { $lte: rating }
    if (location) filter['location'] = location
    if (
      price &&
      price.min &&
      price.max &&
      parseInt(price.min) < parseInt(price.max)
    )
      filter['price'] = {
        $gt: Number(price.min),
        $lte: Number(price.max)
      }

    if (appliedFilters?.search)
      filter['trainerName'] = {
        $regex: appliedFilters.search,
        $options: 'i'
      }

    const pipeline = [
      {
        $match: {
          trainer: { $exists: true }
        }
      },
      {
        $lookup: {
          from: 'users',
          localField: 'trainer',
          foreignField: '_id',
          as: 'trainerDetails'
        }
      },
      {
        $unwind: '$trainerDetails'
      },
      {
        $group: {
          _id: '$trainer',
          id: { $first: '$trainer' },
          trainerName: {
            $first: {
              $concat: [
                '$trainerDetails.firstName',
                ' ',
                '$trainerDetails.lastName'
              ]
            }
          },
          avatar: { $first: '$trainerDetails.avatar' },
          price: { $sum: '$price' },
          intro: { $first: '$trainerDetails.trainerInfo.introduction' },
          location: { $first: '$location' },
          images: {
            $first: '$trainerDetails.trainerInfo.images'
          },
          specialization: {
            $first: '$trainerDetails.trainerInfo.specialization'
          },
          totalSessions: { $sum: 1 },
          averageRating: { $avg: '$rating' }
        }
      },
      {
        $match: { ...filter }
      },
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
    const list = await Session.aggregate(pipeline)
    const total = list[0].totalCount[0]?.total || 0
    const totalPage = Math.ceil(total / limit)
    let recommendedTrainers: any = []
    if (user && user.customerInfo && user.customerInfo.fitnessInterest) {
      const userPreference = user.customerInfo.fitnessInterest
      recommentedTrainers = await User.find({
        'trainerInfo.specialization': { $in: userPreference }
      })
        .sort({ _id: -1 })
        .limit(5)
      recommendedTrainers = await Promise.all(
        (recommentedTrainers as IUser[]).map(async user => ({
          id: user._id,
          trainerName: user.firstName + ' ' + user.lastName,
          avatar: user.avatar,
          price: await getTrainerAverageSessionPrice(user._id),
          intro: user.trainerInfo.introduction,
          location: user.trainerInfo.location,
          images: user.trainerInfo.images,
          specialization: user.trainerInfo.specialization,
          totalSessions: total,
          averageRating: await getTrainerAverageSessionRating(user._id)
        }))
      )
    }
    return {
      ok: true,
      status: 200,
      data: {
        list: list[0].paginatedResults,
        recommendedTrainers
      },
      currentPage: page,
      totalPage: totalPage,
      limit: limit,
      total: total
    }
  },
  listTrainerDetails: async (
    trainer: IUser['_id'],
    user: IUser['_id']
  ): Promise<IReturnResponse> => {
    if (!trainer)
      return { ok: false, message: 'Trainer not found', status: 404 }
    const currentTrainer = await User.findOne({ _id: trainer }).select(
      '-trainerInfo.attemptCount -trainerInfo.showAgain -trainerInfo.createdAt -trainerInfo.updatedAt'
    )
    if (!currentTrainer)
      return { ok: false, message: 'Trainer not found', status: 404 }
    const trainerInfo = currentTrainer.trainerInfo
    const totalSessions = await Session.countDocuments({
      trainer: currentTrainer._id
    })
    const trainerSessions = await Session.find({ trainer }).distinct('_id')
    //upcoming sessions
    const upcomingBookings = await Booking.find({
      date_from: { $gt: new Date() },
      date_to: { $gt: new Date() },
      user: user,
      // isPaid: PAID,
      session: { $in: trainerSessions }
    })
      .select('-createdAt -updatedAt -__v')
      .populate([
        {
          path: 'session',
          select: '-createdAt -updatedAt -__v',
          populate: {
            path: 'trainer',
            select: 'firstName lastName avatar'
          },
          transform(doc, id) {
            const sessionJson = doc.toJSON()
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
          select: 'firstName lastName'
        }
      ])

    const pendingBookings = await Booking.find({
      date_from: { $lt: new Date() },
      // date_to: { $gt: new Date() },
      user: user,
      isPaid: PAID,
      session: { $in: trainerSessions }
    })
      .select('-createdAt -updatedAt -__v')
      .populate([
        {
          path: 'session',
          select: '-createdAt -updatedAt -__v',
          populate: {
            path: 'trainer',
            select: 'firstName lastName avatar'
          },
          transform(doc, id) {
            const sessionJson = doc.toJSON()
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
          select: 'firstName lastName'
        }
      ])

    const info = {
      id: currentTrainer._id,
      trainerName: currentTrainer.firstName + ' ' + currentTrainer.lastName,
      price: await getTrainerAverageSessionPrice(trainer),
      intro: trainerInfo.introduction,
      experience: trainerInfo.experience,
      location: trainerInfo.location,
      images: trainerInfo.images,
      specialization: trainerInfo.specialization,
      totalSessions,
      averageRating: await getTrainerAverageSessionRating(trainer),
      certification: trainerInfo.certification,
      medicalCondition: trainerInfo.medicalCondition,
      gender: trainerInfo.gender,
      country: trainerInfo.country
    } as Record<PropertyKey, unknown>

    return {
      ok: true,
      data: {
        info,
        upcoming: upcomingBookings,
        booked: pendingBookings
      }
    }
  },
  listCustomer: async (
    trainerId?: string,
    page?: number,
    limit?: number,
    appliedFilters?: {
      sort?: string
      price?: string
      customer?: string
      search?: string
    }
  ): Promise<IReturnResponse> => {
    const filter: { [key: string]: any } = {}
    const filterSort: { [key: string]: any } = {}
    const currentPage = page >= 1 ? page - 1 : page
    if (appliedFilters?.sort == '-1') filterSort['customerName'] = -1
    if (appliedFilters?.sort == '1') filterSort['customerName'] = 1
    if (appliedFilters?.price == '1') filterSort['amountReceived'] = 1
    if (appliedFilters?.price == '-1') filterSort['amountReceived'] = -1
    if (appliedFilters?.customer) {
      filter['_id'] = new Types.ObjectId(appliedFilters.customer)
    }
    if (appliedFilters.search)
      filter['customerName'] = {
        $regex: appliedFilters.search,
        $options: 'i'
      }

    if (Object.keys(filterSort).length === 0) filterSort['_id'] = -1

    const paidCustomerIds = await bookingService.getPaidCustomerIds(trainerId)
    const pipeline = [
      {
        $match: {
          user: { $in: paidCustomerIds },
          isPaid: 'Paid'
        }
      },
      {
        $lookup: {
          from: 'users',
          localField: 'user',
          foreignField: '_id',
          as: 'userDetails'
        }
      },
      {
        $lookup: {
          from: 'sessions',
          localField: 'session',
          foreignField: '_id',
          as: 'sessionDetails'
        }
      },
      {
        $unwind: '$userDetails'
      },
      {
        $unwind: '$sessionDetails'
      },
      {
        $group: {
          _id: '$user',
          customerName: {
            $first: {
              $concat: ['$userDetails.firstName', ' ', '$userDetails.lastName']
            }
          },
          location: { $first: '$userDetails.customerInfo.location' },
          fitnessGoal: { $first: '$userDetails.customerInfo.fitnessGoal' },
          fitnessInterest: {
            $first: '$userDetails.customerInfo.fitnessInterest'
          },
          medicalCondition: {
            $first: '$userDetails.customerInfo.medicalCondition'
          },
          height: { $first: '$userDetails.customerInfo.height' },
          weight: { $first: '$userDetails.customerInfo.weight' },
          avatar: { $first: '$userDetails.avatar' },
          isPaid: { $first: '$isPaid' },
          intro: { $first: '$userDetails.customerInfo.introduction' },
          occupation: { $first: '$userDetails.customerInfo.occupation' },
          amountReceived: { $sum: '$sessionDetails.price' },
          totalSessions: { $sum: 1 }
        }
      },
      {
        $sort: { ...filterSort }
      },
      {
        $match: { ...filter }
      },
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
    const list = await Booking.aggregate(pipeline)
    const total = list[0].totalCount[0]?.total || 0
    const totalPage = Math.ceil(total / limit)
    return {
      ok: true,
      status: 200,
      data: list[0].paginatedResults,
      currentPage: page,
      totalPage: totalPage,
      limit: limit,
      total: total
    }
  },
  listCustomerDetails: async (
    trainer: ITrainer['_id'],
    customer: ICustomer['_id']
  ): Promise<IReturnResponse> => {
    if (!customer)
      return { ok: false, message: 'Customer not found', status: 404 }
    const currentCustomer = await userServices.listCustomer(trainer, 1, 1, {
      customer
    })
    const customerInfo = currentCustomer?.data[0]
    if (!customerInfo) {
      return {
        ok: false,
        message: 'Customer not found',
        status: 404
      }
    }
    const bookedSessions = await Booking.find({ user: customer }).populate([
      {
        path: 'session',
        populate: {
          path: 'trainer',
          select: 'firstName lastName avatar'
        },
        transform(doc, id) {
          const sessionJson = doc.toJSON()
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
        select: 'firstName lastName avatar'
      }
    ])
    return {
      ok: true,
      data: { info: customerInfo, booking: bookedSessions }
    }
  },
  listWeekDayPlan: async (userId: string): Promise<IReturnResponse> => {
    const user = await User.findOne({ _id: userId })
    if (!user)
      return {
        ok: false,
        message: 'User not found',
        status: 404
      }
    const now = dayjs()
    const startOfWeek = now.startOf('week').toDate()
    const endOfWeek = now.endOf('week').toDate()
    const filter: FilterQuery<IBooking> = {
      date_from: { $gte: startOfWeek },
      date_to: { $lte: endOfWeek },
      isPaid: { $in: [PAID, UNPAID] }
    }
    if (user.role === 'USER') filter.user = userId
    if (user.role === 'TRAINER') {
      const trainerSessions = await Session.find({ trainer: userId }).distinct(
        '_id'
      )
      filter.session = { $in: trainerSessions }
    }
    const bookings = await Booking.find(filter).populate([
      {
        path: 'session',
        populate: {
          path: 'trainer',
          select: 'firstName lastName'
        },
        transform(doc, id) {
          const sessionJson = doc.toJSON()
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
        select: 'firstName lastName'
      }
    ])
    return {
      ok: true,
      data: bookings,
      status: 200
    }
  },
  async listActivity(userId: string): Promise<IReturnResponse> {
    const user = await User.findOne({ _id: userId })
    if (!user)
      return {
        ok: false,
        message: 'User not found',
        status: 404
      }

    const now = dayjs()
    const startOfWeek = now.startOf('week')
    const endOfWeek = now.endOf('isoWeek')
    const difference = endOfWeek.diff(startOfWeek, 'day')
    const days = Array.from({ length: difference })
      .map((_, index) => startOfWeek.add(index, 'day'))
      .map(date => dayjs(date).format('ddd'))

    const filter: FilterQuery<IBooking> = {
      date_from: { $gte: startOfWeek.toDate() },
      date_to: { $lte: endOfWeek.toDate() },
      isPaid: PAID
    }

    if (user.role === 'USER') filter.user = userId
    if (user.role === 'TRAINER') {
      const sessions = await Session.find({ trainer: userId }).distinct('_id')
      filter.session = { $in: sessions }
    }

    const bookings = await Booking.find(filter)

    const activity = days.map(day => {
      const total = bookings.filter(
        booking => dayjs(booking.date_from).format('ddd') === day
      ).length
      return { day, total }
    })

    return {
      ok: true,
      data: activity,
      status: 200
    }
  },
  async getUserStreakDates(userId: string): Promise<IReturnResponse> {
    try {
      const user: IUser | null = await User.findById(userId).exec()

      if (user) {
        const currentDate = dayjs()
        const startOfWeek = currentDate.startOf('isoWeek')
        const endOfWeek = currentDate.clone().endOf('week')

        const bookings = await Booking.find({
          user: userId,
          isPaid: PAID,
          $and: [
            { date_from: { $gte: startOfWeek.toDate() } },
            { date_from: { $lte: endOfWeek.toDate() } }
          ]
        })
        const streakDatesForThisWeek = bookings.map(booking => ({
          date: dayjs(booking.date_from).format('YYYY-MM-DD'),
          day: dayjs(booking.date_from).format('dddd')
        }))

        const streak = userServices.calculateStreak(streakDatesForThisWeek)
        return {
          status: 200,
          ok: true,
          data: { streakDatesForThisWeek, streak }
        }
      } else {
        return {
          status: 200,
          ok: false,
          data: {},
          message: 'User not found'
        }
      }
    } catch (error) {
      return {
        ok: false,
        status: 200,
        data: {},
        message: 'Something went wrong'
      }
    }
  },

  calculateStreak(dates: { date: string; day: string }[]): number {
    if (dates.length === 0) return 0
    const streak = dates.reduce((acc, date, index, arr) => {
      if (index === 0) return 1
      const prevDate = dayjs(arr[index - 1].date)
      const currentDate = dayjs(date.date)
      const diff = currentDate.diff(prevDate, 'day')
      return diff === 1 ? acc + 1 : acc
    }, 0)
    return streak
  },

  async getTrainerAnalytics(
    analytics: ITrainerAnalytics
  ): Promise<IReturnResponse> {
    try {
      await analytics.listTrainerTotalCompletedSession()
      await analytics.getTotalIncome()
      await analytics.getTotalCustomers()
      return Promise.resolve({
        ok: true,
        status: 200,
        data: {
          totalSession: await analytics.countTrainerTotalSessions(),
          totalIncome: analytics.totalIncome,
          totalCustomer: analytics.totalCustomer
        }
      })
    } catch (error) {
      return Promise.resolve({
        ok: false,
        status: 200,
        data: {},
        message: 'Something went wrong'
      })
    }
  },

  async getCustomerAnalytics(
    analytics: ICutomerAnalytics
  ): Promise<IReturnResponse> {
    try {
      await analytics.listCustomerTotalCompletedSession()
      await analytics.getTotalAmountSpentAndTrainers()
      return Promise.resolve({
        ok: true,
        status: 200,
        data: {
          totalSession: await analytics.countCustomerTotalSessions(),
          totalAmountSpent: analytics.totalAmountSpent,
          totalTrainers: analytics.totalTrainers
        }
      })
    } catch (error) {
      return Promise.resolve({
        ok: false,
        status: 200,
        data: {},
        message: 'Something went wrong'
      })
    }
  }
}

export default userServices
