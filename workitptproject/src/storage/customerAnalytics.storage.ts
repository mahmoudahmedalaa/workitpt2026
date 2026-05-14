import Booking, { IBooking } from '@models/booking.model'
import { PAID } from '@constants/paid.constant'
import { ENDED } from '@constants/booking.constant'

export interface ICutomerAnalytics {
  userId: string
  completedSessionByCustomer: IBooking[]
  sanitezedSession: IBooking[]
  totalAmountSpent: number
  totalTrainers: number
  listCustomerTotalCompletedSession(): void
  countCustomerTotalSessions(): number
  getTotalAmountSpentAndTrainers(): void
  sanitizeSessions(): void
}

export class CutomerAnalytics implements ICutomerAnalytics {
  userId: string
  completedSessionByCustomer: IBooking[]
  sanitezedSession: IBooking[]
  totalAmountSpent: number
  totalTrainers: number
  constructor(userId: string) {
    this.userId = userId
    this.completedSessionByCustomer = []
    this.sanitezedSession = []
    this.totalAmountSpent = 0
    this.totalTrainers = 0
  }

  async listCustomerTotalCompletedSession() {
    const bookings = await Booking.find({
      user: this.userId,
      sessionStatus: ENDED,
      isPaid: PAID
    }).populate({
      path: 'session',
      populate: {
        path: 'trainer',
        select: 'firstName lastName avatar'
      }
    })
    this.completedSessionByCustomer = bookings.filter(booking => booking.session !== null);
    this.sanitizeSessions()
  }

  sanitizeSessions() {
    const uniqueSessionIds = new Set<string>()

    this.sanitezedSession = this.completedSessionByCustomer.filter(booking => {
      const sessionId = booking.session._id
      if (!uniqueSessionIds.has(sessionId)) {
        uniqueSessionIds.add(sessionId)
        return true
      }
      return false
    })
  }

  countCustomerTotalSessions() {
    return this.completedSessionByCustomer.length
  }

  getTotalAmountSpentAndTrainers() {
    let uniqueTrainers = new Set()

    for (const booking of this.completedSessionByCustomer) {
      if (booking.session && booking.session.price) {
        this.totalAmountSpent += booking.session.price
      }

      if (booking.session && booking.session.trainer) {
        uniqueTrainers.add(booking.session.trainer)
      }
    }

    this.totalTrainers = Array.from(uniqueTrainers).length
  }
}
