import Booking, { IBooking } from '@models/booking.model'
import { PAID } from '@constants/paid.constant'
import { ENDED } from '@constants/booking.constant'
import Session from '@models/session.models'

export interface ITrainerAnalytics {
  userId: string
  completedSessionByTrainer: IBooking[]
  sanitezedSession: IBooking[]
  totalIncome: number
  totalCustomer: number
  listTrainerTotalCompletedSession(): void
  countTrainerTotalSessions(): number
  getTotalIncome(): void
  sanitizeUniqueSessions(): void
  getTotalCustomers(): void
}

export class TrainerAnalytics implements ITrainerAnalytics {
  userId: string
  completedSessionByTrainer: IBooking[]
  sanitezedSession: IBooking[]
  totalIncome: number
  totalCustomer: number
  constructor(userId: string) {
    this.userId = userId
    this.completedSessionByTrainer = []
    this.sanitezedSession = []
    this.totalIncome = 0
    this.totalCustomer = 0
  }

  async listTrainerTotalCompletedSession() {
    // const bookings = await Booking.find({
    //   sessionStatus: ENDED,
    //   isPaid: PAID
    // }).populate({
    //   path: 'session',
    //   match: {
    //     trainer: { $eq: this.userId }
    //   }
    // })
    const trainerSessions = await Session.find({ trainer: this.userId }).distinct(
      '_id'
    )
    const bookings = await Booking.find({
      sessionStatus: ENDED,
      isPaid: PAID,
      session: { $in: trainerSessions }
    }).populate([
      {
        path: 'session',
        populate: {
          path: 'trainer',
          select: 'firstName lastName avatar'
        }
      }
    ])
    console.log(bookings)
    this.completedSessionByTrainer = bookings.filter(
      booking => booking.session !== null
    )
    this.sanitizeUniqueSessions()
  }

  sanitizeUniqueSessions() {
    const uniqueSessionIds = new Set<string>()

    this.sanitezedSession = this.completedSessionByTrainer.filter(booking => {
      const sessionId = booking.session._id
      if (!uniqueSessionIds.has(sessionId)) {
        uniqueSessionIds.add(sessionId)
        return true
      }
      return false
    })
  }

  countTrainerTotalSessions() {
    return this.sanitezedSession.length
  }

  getTotalIncome() {
    for (const booking of this.sanitezedSession) {
      if (booking.session && booking.session.price) {
        this.totalIncome += booking.session.price
      }
    }
  }

  getTotalCustomers() {
    const uniqueUserIds = new Set<string>()
    this.completedSessionByTrainer.forEach(booking => {
      const userId = booking.user
      uniqueUserIds.add(userId)
    })
    this.totalCustomer = uniqueUserIds.size
  }
}
