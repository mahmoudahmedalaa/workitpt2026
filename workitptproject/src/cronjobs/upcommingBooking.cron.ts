import cron from 'node-cron'
import Booking, { IBooking } from '@models/booking.model'
import User, { IUser } from '@models/user.model'
import { NotificationService } from '@services/notification.services'
import dayjs from 'dayjs'

const cronSchedule = '0 */2 * * *' // Runs every 2 hour
// const cronSchedule = '*/10 * * * * *' // Run evey 10 secs

const job = cron.schedule(cronSchedule, async () => {
  try {
    const paidBookings: IBooking[] = await Booking.find({
      isPaid: 'Paid',
      sessionStatus: 'Active'
    })
      .populate({
        path: 'session'
      })
      .exec()

    const currentDateTime = dayjs().tz('Asia/Hong_Kong')

    for (const booking of paidBookings) {
      const bookingDateTime = dayjs(booking.date_from)
      const hour = dayjs(booking.time_from, 'hh:mm a').hour()
      const minute = dayjs(booking.time_from, 'hh:mm a').minute()
      bookingDateTime.add(hour, 'hour')
      bookingDateTime.add(minute, 'minute')
      const hoursDiff = bookingDateTime.diff(currentDateTime, 'hours')
      if (hoursDiff <= 2 && hoursDiff >= 0) {
        const customer = await User.findOne({ _id: booking.user })
        const trainer = await User.findOne({ _id: booking.session.trainer })
        await sendNotification([customer, trainer])
        console.log(
          `Current time is less than or equal to 2 hours before bookingDateTime for booking ID ${booking._id}`
        )
      }
    }
    console.log('Cron job completed.')
  } catch (error) {
    console.error('Error in cron job:', error)
  }
})

const sendNotification = async (users: IUser[]) => {
  const notification = new NotificationService()
  for (const user of users) {
    const notificationPayload = {
      user,
      title: `Session About Start`,
      body: `Dear ${user.firstName} your session is about to start`,
      data: user
    }
    await notification.notify(notificationPayload)
  }
}

job.start()
