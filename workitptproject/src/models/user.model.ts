import { Document, model, Schema } from 'mongoose'
import crypto from 'crypto'
import { IRole } from 'interfaces/role'
import Customer, { ICustomer } from './customer.model'
import Trainer, { ITrainer } from './trainer.model'
export const roles = ['ADMIN', 'USER', 'TRAINER']
const status = ['ACTIVE', 'INACTIVE', 'BANNED']

const UserSchema = new Schema(
  {
    firstName: String,
    lastName: String,
    avatar: String,
    customerInfo: {
      type: Customer,
      required: false
    },
    trainerInfo: {
      type: Trainer,
      required: false
    },
    email: {
      type: String,
      required: true
    },
    password: {
      type: String,
      select: false,
      required: true,
      minLength: 8
    },
    userSecret: {
      type: String,
      select: false,
      default: crypto.randomBytes(32).toString('hex')
    },
    profileCompleted: {
      type: Boolean,
      default: false
    },
    role: {
      type: String,
      enum: roles,
      default: 'USER'
    },
    stripe_customer_id: {
      type: String,
      selected: false
    },
    authProvider: {
      type: String,
      enum: ['GOOGLE', 'FACEBOOK', 'CREDENTIALS', 'APPLE'],
      default: 'CREDENTIALS'
    },
    authProviderId: String,
    status: {
      type: String,
      enum: status,
      default: 'INACTIVE'
    },
    fcmToken: [
      {
        type: String,
        select: false
      }
    ],
    bannedSpecification: {
      type: String,
      select: false
    }
  },
  { timestamps: true }
)
export interface IUser extends Document {
  firstName: string
  lastName: string
  customerInfo?: ICustomer
  trainerInfo?: ITrainer
  avatar: string
  email: string
  password: string
  userSecret?: string
  profileCompleted: boolean
  authProvider: string
  fcmToken: [string]
  authProviderId: string
  stripe_customer_id?: string
  role: IRole
  status: string
  bannedSpecification: string
}

const User = model<IUser>('User', UserSchema)

export default User
