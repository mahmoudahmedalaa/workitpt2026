import { Document, Schema } from 'mongoose'
import { specializationEnum } from './trainer.model'

const CustomerSchema = new Schema(
  {
    gender: {
      type: String,
      enum: ['Male', 'Female', 'Other']
    },
    dob: Date,
    emergencyContact: [
      {
        name: String,
        phone: String,
        countryCode: String,
        relation: String,
        countryName: String
      }
    ],
    contactNumber: { type: String, select: false },
    country: String,
    countryCode: String,
    state: String,
    location: {
      home: { name: String, lat: Number, lng: Number },
      gym: { name: String, lat: Number, lng: Number },
      outdoor: { name: String, lat: Number, lng: Number },
      online: String
    },
    height: String,
    weight: String,
    occupation: String,
    workoutLocation: String,
    fitnessGoal: String,
    fitnessInterest: {
      enum: specializationEnum,
      type: [String]
    },
    coordinates: {
      lat: Number,
      lng: Number
    },
    introduction: { type: String, maxLength: 256 },
    medicalCondition: { type: String, maxLength: 256 },
    social: {
      facebook: String,
      instagram: String
    },
    streakDates: [Date]
  },
  { timestamps: true }
)
export interface ICustomer extends Document {
  dob: Date
  gender: string
  emergencyContact: [
    { name: string; phone: string; countryCode?: string; relation: string }
  ]
  contactNumber: string
  country: string
  countryCode: string
  state: string
  introduction: string
  workoutLocation: string
  location: {
    home: { name: string; lat: number; lng: number }
    gym: { name: string; lat: number; lng: number }
    outdoor: { name: string; lat: number; lng: number }
    online: string
  }
  height: string
  weight: string
  occupation: string
  fitnessGoal: string
  fitnessInterest: string[]
  coordinates: {
    lat: number
    lng: number
  }
  social: {
    facebook?: string
    instagram?: string
  }
  medicalCondition: string
  streakDates: string[]
}

export default CustomerSchema
