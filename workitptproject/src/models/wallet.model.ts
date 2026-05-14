import { Document, model, Schema } from 'mongoose'
import { IUser } from './user.model'
import { IBooking } from './booking.model'

const WalletSchema = new Schema(
  {
    trainer: { type: Schema.Types.ObjectId, ref: 'User' },
    amount: Number,
    transaction_charge: Number,
    booking: { type: Schema.Types.ObjectId, ref: 'Booking' }
  },
  { timestamps: true }
)

export interface IWallet extends Document {
  trainer: IUser['_id']
  booking: IBooking['_id']
  transaction_charge: number
  amount: number
}

const Wallet = model<IWallet>('Wallet', WalletSchema)
export default Wallet
