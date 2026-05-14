import { Document, Schema } from 'mongoose'

export const experienceRangeEnum = [
  '1 to 3 Years',
  '3 to 6 Years',
  '6 to 9 Years',
  'Morethan 9 Years'
]
export const specializationEnum = [
  'Weightlifting',
  'Cardiovascular Conditioning',
  'Strength and Conditioning',
  'Postnatal Fitness',
  'Pre-natal Fitness',
  'Senior Fitness',
  'Rehabilitation and Injury Prevention',
  'Flexibility and Stretching',
  'Mindfulness and Meditation',
  'Yoga',
  'Pilates',
  'CrossFit',
  'Functional Training',
  'High-Intensity Interval Training (HIIT)',
  'Kickboxing',
  'Boxing',
  'Jiu jitsu',
  'Judo',
  'Running and Endurance Training',
  'Cycling (Indoor or Outdoor)',
  'Dance Fitness (e.g., Zumba, Hip Hop, Ballet)',
  'Swimming',
  'Soccer',
  'Basketball',
  'Volleyball',
  'Bodyweight Training'
]

const status = ['ACTIVE', 'INACTIVE', 'PENDING', 'BANNED']

const TrainerSchema = new Schema(
  {
    attemptCount: {
      type: Number,
      default: 0
    },
    certification: [String],
    introduction: { type: String, maxLength: 256 },
    medicalCondition: { type: String, maxLength: 256 },
    gender: {
      type: String,
      enum: ['Male', 'Female', 'Other']
    },
    images: [String],
    location: {
      home: { name: String, lat: Number, lng: Number },
      gym: { name: String, lat: Number, lng: Number },
      outdoor: { name: String, lat: Number, lng: Number },
      online: String
    },
    emergencyContact: [
      {
        name: String,
        phone: String,
        countryCode: String,
        relation: String,
        countryName: String
      }
    ],
    contactNumber: {
      type: String,
      select: false
    },
    dob: Date,
    country: String,
    countryCode: String,
    state: String,
    specialization: {
      enum: specializationEnum,
      type: [String]
    },
    availability: [{ day: String, time: [Date] }],
    experience: {
      enum: experienceRangeEnum,
      type: String
    },
    blockerDetails: String,
    verificationStatus: {
      type: String,
      enum: status,
      default: 'PENDING'
    },
    currentLocation: {
      lat: Number,
      lng: Number
    },
    showAgain: {
      type: Boolean,
      default: false
    }
  },
  { timestamps: true }
)
export interface ITrainer extends Document {
  attemptCount?: number
  certification: string[]
  introduction: string
  medicalCondition: string
  gender: string
  dob: Date
  images: string[]
  location: {
    home: { name: string; lat: number; lng: number }
    gym: { name: string; lat: number; lng: number }
    outdoor: { name: string; lat: number; lng: number }
    online: string
  }
  emergencyContact: [
    {
      name: string
      phone: string
      countryCode?: string
      relation: string
      countryName?: string
    }
  ]
  contactNumber: string
  country: string
  countryCode: string
  state: string
  availability: { day: String; time: [Date] }[]
  specialization: string[]
  experience: string
  blockerDetails: string
  verificationStatus: string
  currentLocation: {
    lat: number
    lng: number
  }
}

export default TrainerSchema
