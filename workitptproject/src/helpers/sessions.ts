import { Model } from 'mongoose'
import { ISession } from '@models/session.models'
import Booking from '@models/booking.model'
import {
  SESSION_STATUS_ACTIVE,
  SESSION_STATUS_INACTIVE
} from '@constants/session.contant'
import dayjs from 'dayjs'

export const parseTime = async (timeStr: any) => {
  const [time, meridiem] = timeStr.split(' ')
  const [hours, minutes] = time.split(':')
  const parsedTime = {
    hours: parseInt(hours),
    minutes: parseInt(minutes)
  }
  if (meridiem === 'pm' && parsedTime.hours !== 12) {
    parsedTime.hours += 12
  }
  return parsedTime
}

export const checkForSessionOverlap = async (
  sessionStartDateTime: any,
  sessionEndDateTime: any,
  Session: Model<ISession>,
  trianerId: string,
  sessionName: string,
  time_from: string,
  time_to: string
) => {
  let timeOverlap = false
  const dayStart = dayjs(sessionStartDateTime).startOf('day').format()
  const dayEnd = dayjs(sessionEndDateTime).endOf('day').format()

  const overlappingSessions = await Session.find({
    $and: [
      {
        date_from: { $lte: dayEnd },
        date_to: { $gte: dayStart }
      },
      {
        trainer: trianerId,
        status: SESSION_STATUS_ACTIVE
      }
    ]
  })

  for (let session of overlappingSessions) {
    const sessionStartMinutes = await parseTime(session.time_from).then(
      sf => sf.hours * 60 + sf.minutes
    )
    const sessionEndMinutes = await parseTime(session.time_to).then(
      st => st.hours * 60 + st.minutes
    )
    const timeStartMinutes = await parseTime(time_from).then(
      tf => tf.hours * 60 + tf.minutes
    )
    const timeEndMinutes = await parseTime(time_to).then(
      tt => tt.hours * 60 + tt.minutes
    )

    if (
      sessionStartMinutes < timeEndMinutes &&
      timeStartMinutes < sessionEndMinutes
    ) {
      timeOverlap = true
      break
    }
  }

  return timeOverlap ? overlappingSessions : []
}

export const checkForBookingOverlap = async (
  sessionStartDateTime: any,
  sessionEndDateTime: any,
  userId: string
) => {
  const overlappingBooking = await Booking.findOne({
    $and: [
      {
        $or: [
          {
            $and: [
              { date_from: { $lte: sessionStartDateTime } },
              { date_to: { $gte: sessionStartDateTime } }
            ]
          },
          {
            $and: [
              { date_from: { $lte: sessionEndDateTime } },
              { date_to: { $gte: sessionEndDateTime } }
            ]
          },
          {
            $and: [
              { date_from: { $eq: sessionStartDateTime } },
              { date_to: { $eq: sessionEndDateTime } }
            ]
          }
        ]
      },
      { user: userId }
    ]
  })

  return !!overlappingBooking
}
