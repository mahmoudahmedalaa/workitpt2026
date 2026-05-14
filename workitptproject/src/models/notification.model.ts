import mongoose, { Document, Schema } from 'mongoose'
import { IUser } from './user.model'

const notificationSchema = new mongoose.Schema(
  {
    user: {
      type: Schema.Types.ObjectId,
      ref: 'User'
    },
    title: String,
    body: String,
    isAdmin: {
      type: Boolean,
      // select: false,
      default: false
    },
    image: String,
    data: Object,
    seen: {
      type: Boolean,
      default: false
    }
  },
  { timestamps: true }
)

export interface INotification extends Document {
  user: IUser['_id']
  title: string
  body: string
  isAdmin: boolean
  image?: string
  data: { [key: string]: any }
  seen: boolean
}

const Notification = mongoose.model<INotification>(
  'Notification',
  notificationSchema
)

export default Notification
