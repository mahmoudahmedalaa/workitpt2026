import User from '@models/user.model'
import bcrypt from 'bcryptjs'
import crypto from 'crypto'

function generateRandomDate(from: Date, to: Date) {
  return new Date(
    from.getTime() + Math.random() * (to.getTime() - from.getTime())
  )
}

const users = [
  {
    firstName: 'ADMIN',
    lastName: 'USER',
    email: 'admin@workitpt.com',
    password: bcrypt.hashSync('hello123', 10),
    userSecret: crypto.randomBytes(32).toString('hex'),
    role: 'ADMIN',
    status: 'ACTIVE'
  },
  {
    firstName: 'CUSTOMER',
    lastName: 'USER ONE',
    customerInfo: {
      gender: 'Male',
      dob: '1998-04-19',
      emergencyContact: [
        {
          name: 'Someone',
          phone: '12345678',
          countryCode: '+852',
          relation: 'friend'
        }
      ],
      contactNumber: '12345678',
      country: 'Hongkong',
      countryCode: '+852',
      state: 'HK',
      location: {
        home: { name: 'Hongkong', lat: 22.3193, lng: 114.1694 },
        gym: { name: 'Hongkong', lat: 22.3193, lng: 114.1694 },
        outdoor: { name: 'Hongkong', lat: 22.3193, lng: 114.1694 },
        online: 'https://someurl.com'
      },
      height: '6ft',
      weight: '82KG',
      occupation: 'Software Engineer',
      workoutLocation: 'Anywhere',
      fitnessGoal: 'YOUR FITNESS GOALS HERE',
      coordinates: {
        lat: 22.3193,
        lng: 114.1694
      },
      introduction: 'Hello i am customer',
      medicalCondition: 'Normal',
      social: {
        facebook: 'https://facebook.com',
        instagram: 'https://instagram.com'
      }
    },
    email: 'customer@workitpt.com',
    password: bcrypt.hashSync('hello123', 10),
    userSecret: crypto.randomBytes(32).toString('hex'),
    profileCompleted: true,
    role: 'USER',
    status: 'ACTIVE',
    fcmToken: ['']
  },
  {
    firstName: 'CUSTOMER',
    lastName: 'USER TWO',
    customerInfo: {
      gender: 'Male',
      dob: '1998-04-19',
      emergencyContact: [
        {
          name: 'Someone',
          phone: '12345678',
          countryCode: '+852',
          relation: 'friend'
        }
      ],
      contactNumber: '12345678',
      country: 'Hongkong',
      countryCode: '+852',
      state: 'HK',
      location: {
        home: { name: 'Hongkong', lat: 22.3193, lng: 114.1694 },
        gym: { name: 'Hongkong', lat: 22.3193, lng: 114.1694 },
        outdoor: { name: 'Hongkong', lat: 22.3193, lng: 114.1694 },
        online: 'https://someurl.com'
      },
      height: '6ft',
      weight: '82KG',
      occupation: 'Software Engineer',
      fitnessGoal: 'YOUR FITNESS GOALS HERE',
      workoutLocation: 'Anywhere',
      coordinates: {
        lat: 22.3193,
        lng: 114.1694
      },
      introduction: 'Hello i am customer',
      medicalCondition: 'Normal',
      social: {
        facebook: 'https://facebook.com',
        instagram: 'https://instagram.com'
      }
    },
    email: 'customer2@workitpt.com',
    password: bcrypt.hashSync('hello123', 10),
    userSecret: crypto.randomBytes(32).toString('hex'),
    profileCompleted: true,
    role: 'USER',
    status: 'ACTIVE',
    fcmToken: ['']
  },
  {
    firstName: 'TRAINER',
    lastName: 'USER ONE',
    trainerInfo: {
      certification: [''],
      introduction: 'Hello i am trainer one',
      medicalCondition: 'Normal',
      gender: 'Male',
      images: [''],
      location: {
        home: { name: 'Hongkong', lat: 22.3193, lng: 114.1694 },
        gym: { name: 'Hongkong', lat: 22.3193, lng: 114.1694 },
        outdoor: { name: 'Hongkong', lat: 22.3193, lng: 114.1694 },
        online: 'https://someurl.com'
      },
      emergencyContact: [
        {
          name: 'Someone',
          phone: '12345678',
          countryCode: '+852',
          relation: 'friend'
        }
      ],
      contactNumber: '12345678',
      dob: '1998-04-20',
      country: 'Hongkong',
      countryCode: '+852',
      state: 'HK',
      specialization: [
        'Cardiovascular Conditioning',
        'Strength and Conditioning',
        'Postnatal Fitness',
        'Pre-natal Fitness'
      ],
      availability: [
        {
          day: 'Sunday',
          time: [
            generateRandomDate(new Date(2023, 12, 1), new Date(2024, 1, 28))
          ]
        }
      ],
      experience: '3 to 6 Years',
      verificationStatus: 'ACTIVE',
      currentLocation: {
        lat: 22.3193,
        lng: 114.1694
      }
    },
    email: 'trainer@workitpt.com',
    password: bcrypt.hashSync('hello123', 10),
    userSecret: crypto.randomBytes(32).toString('hex'),
    profileCompleted: true,
    role: 'TRAINER',
    status: 'ACTIVE',
    fcmToken: ['']
  },
  {
    firstName: 'TRAINER',
    lastName: 'USER TWO',
    trainerInfo: {
      certification: [''],
      introduction: 'Hello i am trainer one',
      medicalCondition: 'Normal',
      gender: 'Male',
      images: [''],
      location: {
        home: { name: 'Hongkong', lat: 22.3193, lng: 114.1694 },
        gym: { name: 'Hongkong', lat: 22.3193, lng: 114.1694 },
        outdoor: { name: 'Hongkong', lat: 22.3193, lng: 114.1694 },
        online: 'https://someurl.com'
      },
      emergencyContact: [
        {
          name: 'Someone',
          phone: '12345678',
          countryCode: '+852',
          relation: 'friend'
        }
      ],
      contactNumber: '12345678',
      dob: '1998-04-20',
      country: 'Hongkong',
      countryCode: '+852',
      state: 'HK',
      specialization: [
        'Cardiovascular Conditioning',
        'Strength and Conditioning',
        'Postnatal Fitness',
        'Pre-natal Fitness'
      ],
      availability: [
        {
          day: 'Sunday',
          time: [
            generateRandomDate(new Date(2023, 12, 1), new Date(2024, 1, 28))
          ]
        }
      ],
      experience: '3 to 6 Years',
      verificationStatus: 'ACTIVE',
      currentLocation: {
        lat: 22.3193,
        lng: 114.1694
      }
    },
    email: 'trainer2@workitpt.com',
    password: bcrypt.hashSync('hello123', 10),
    userSecret: crypto.randomBytes(32).toString('hex'),
    profileCompleted: true,
    role: 'TRAINER',
    status: 'ACTIVE',
    fcmToken: ['']
  }
]

export const seedUsers = async () => {
  await User.insertMany(users)

  console.log('Users seeded ✅✅✅')
}
