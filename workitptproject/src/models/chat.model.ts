import { Document, Schema, model } from 'mongoose'
import { IUser } from './user.model'
import { ISession } from './session.models'

const chatSchema = new Schema(
  {
    sender: {
      type: Schema.Types.ObjectId,
      ref: 'User'
    },
    receiver: {
      type: Schema.Types.ObjectId,
      ref: 'User'
    },
    message: String,
    session: {
      type: Schema.Types.ObjectId,
      ref: 'Session'
    },
    seen: {
      type: Boolean,
      default: false
    }
  },
  { timestamps: true }
)

export interface IChat extends Document {
  sender: IUser['_id']
  receiver: IUser['_id']
  message: string
  seen: boolean
  session: ISession['_id']
}

const Chat = model<IChat>('Chat', chatSchema)
export default Chat
