import {
  SESSION_DAY_OF_WEEK,
  SESSION_DIFFICULTY_LEVEL,
  SESSION_LOCATION,
  SESSION_SELECT_TYPE,
  SESSION_STATUS_ACTIVE,
  SESSION_STATUS_INACTIVE,
  SESSION_TYPE
} from '@constants/session.contant'
import { Document, Schema, SchemaTypeOptions, model } from 'mongoose'
import {
  SessionDayOfWeek,
  SessionDificultyLevel,
  SessionSelectType,
  SessionType
} from 'types/session'

const CoordinateSchema = new Schema({
  lat: { type: Number, required: true },
  lng: { type: Number, required: true }
} satisfies Record<PropertyKey, SchemaTypeOptions<unknown>>)

const SessionSchema = new Schema(
  {
    session_title: {
      type: String,
      required: true,
      trim: true,
      maxlength: 255
    },
    session: {
      type: String,
      required: true
    },
    difficulty_level: {
      type: String,
      enum: SESSION_DIFFICULTY_LEVEL,
      required: true
    },
    price: {
      type: Number,
      min: 0,
      required: true
    },
    session_type: {
      type: String,
      enum: SESSION_TYPE,
      required: true
    },
    no_of_attendees: {
      type: Number,
      min: 0,
      required() {
        return (this as ISession).session_type === 'group'
      }
    },
    select_type: {
      type: String,
      required: true,
      enum: SESSION_SELECT_TYPE
    },
    occurrence: {
      type: String
    },
    date_from: { type: Date, required: true },
    date_to: { type: Date },
    time_from: { type: String, required: true },
    time_to: { type: String, required: true },
    location: {
      type: String,
      maxlength: 255, // Limit location length to 255 characters
      required: true,
      enum: SESSION_LOCATION
    },
    online_url: {
      type: String,
      required() {
        return (this as ISession).location === 'Online'
      },
      validate(value: string) {
        const urlRegex = /^(http|https):\/\/[^ "]+$/
        return urlRegex.test(value)
      }
    },
    location_on_map: {
      type: String,
      maxlength: 255,
      required() {
        return (this as ISession).location !== 'Online'
      }
    },
    coordicates: {
      type: CoordinateSchema,
      required() {
        return (this as ISession).location !== 'Online'
      }
    },
    day_of_week: {
      type: String,
      enum: SESSION_DAY_OF_WEEK
    },
    description: { type: String, maxLength: 256 },
    what_to_expect: { type: String, maxLength: 256 },
    what_to_bring: { type: String, maxLength: 256 },
    benefits: { type: String, maxLength: 256 },
    booked: {
      type: Boolean,
      default: false
    },

    trainer: { type: Schema.Types.ObjectId, ref: 'User', index: true },
    referenceId: {
      type: String
    },
    images: [String],
    location_range: {
      type: Number,
      required() {
        return (this as ISession).flexible_location === true
      }
    },
    flexible_location: {
      type: Boolean,
      default: false
    },
    ratings: [{ user: { type: String }, rating: { type: Number } }],
    rating: {
      type: Number
    },
    status: {
      type: String,
      enum: [SESSION_STATUS_ACTIVE, SESSION_STATUS_INACTIVE],
      default: SESSION_STATUS_ACTIVE
    }
  } satisfies Record<PropertyKey, SchemaTypeOptions<unknown>>,
  { timestamps: true }
)
export interface ISession extends Document {
  session_title: string
  session_type: SessionType
  select_type: SessionSelectType
  session: string
  price: number
  intoduction: string
  difficulty_level: SessionDificultyLevel
  location: (typeof SESSION_LOCATION)[number]
  date_from: Date
  date_to: Date
  time_from: string
  time_to: string
  occurrence: string
  no_of_attendees: number
  day_of_week: SessionDayOfWeek
  coordicates: {
    lat: number
    lng: number
  }
  description: string
  what_to_expect: string
  what_to_bring: string
  benefits: string
  dayOfWeek?: [{ day: string; date_from: string; date_to?: string }]
  trainer: string
  location_on_map: string
  online_url: string
  referenceId: string
  location_range: number
  images: string[]
  ratings: { user: string; rating: number }[]
  rating: number
  flexible_location: boolean
  status: typeof SESSION_STATUS_ACTIVE | typeof SESSION_STATUS_INACTIVE
}

const Session = model<ISession>('Session', SessionSchema)
export default Session
