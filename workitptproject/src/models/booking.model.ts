import { Document, Schema, model } from 'mongoose'
import { ISession } from './session.models'
import { IUser } from './user.model'
import { PAID, PENDING, UNPAID } from '@constants/paid.constant'
import { ACTIVE, ENDED } from '@constants/booking.constant'

const BookingSchema = new Schema(
  {
    session: { type: Schema.Types.ObjectId, ref: 'Session', index: true },
    user: { type: Schema.Types.ObjectId, ref: 'User', index: true },
    payment_id: String,
    date_from: { type: Date },
    date_to: { type: Date },
    time_from: { type: String },
    time_to: { type: String },
    referenceId: {
      type: String
    },
    visited: {
      type: Boolean,
      default: false,
      selected: false
    },
    isPaid: {
      type: String,
      enum: [UNPAID, PAID, PENDING],
      default: UNPAID
    },
    sessionStatus: {
      type: String,
      enum: [ACTIVE, ENDED],
      default: ACTIVE
    }
  },
  { timestamps: true }
)
export interface IBooking extends Document {
  status: boolean
  session: ISession['_id']
  payment_id?: string
  invoice_id: string
  user: IUser['_id']
  dates?: [{ date: string; session: string }]
  time_from: string
  time_to: string
  isPaid: typeof UNPAID | typeof PAID | typeof PENDING
  sessionStatus: typeof ACTIVE | typeof ENDED
  date_from: string
  date_to: string
  visited: boolean
  referenceId: string
}

const Booking = model<IBooking>('Booking', BookingSchema)
export default Booking
