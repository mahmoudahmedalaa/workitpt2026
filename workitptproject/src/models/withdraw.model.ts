import { Document, model, Schema } from 'mongoose'
import { ITrainer } from './trainer.model'
const approvedStatus = ['Pending', 'Paid', 'Rejected']
const WithdrawalAmount = new Schema(
  {
    trainer: { type: Schema.Types.ObjectId, ref: 'User' },
    details: {
      acNo: String,
      name: String,
      bankName: String
    },
    amount: Number,
    transactionId: String,
    approved: { type: String, enum: approvedStatus, default: 'Pending' },
    remarks: { type: String, default: '' }
  },
  { timestamps: true }
)

export interface IWithdrawalAmount extends Document {
  trainer: ITrainer['_id']
  details: {
    acNo: string
    name: string
    bank: string
  }
  transactionId: string
  amount: number
  approved: string
  remarks: string
}

function generateTransactionId() {
  const timestamp = Date.now()
  const randomSuffix = Math.random().toString(36).substring(2, 5)
  const transactionId = `tr_wipt${randomSuffix}${timestamp}`
  return transactionId
}

WithdrawalAmount.pre<IWithdrawalAmount>('save', function (next) {
  this.transactionId = generateTransactionId()
  next()
})

const Withdraw = model<IWithdrawalAmount>('Withdraw', WithdrawalAmount)
export default Withdraw
