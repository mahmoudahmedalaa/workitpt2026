import cron from 'node-cron'
import Booking, { IBooking } from '../models/booking.model'
import User, { IUser } from '../models/user.model'
import dayjs from 'dayjs'

const cronSchedule = '0 * * * *' // Runs every hour
// const cronSchedule = '*/10 * * * * *' // Run evey 10 secs

const job = cron.schedule(cronSchedule, async () => {
  try {
    const paidBookings: IBooking[] = await Booking.find({
      isPaid: 'Paid',
      sessionStatus: 'Active'
    }).exec()

    const currentDateTime = dayjs().tz('Asia/Hong_Kong');

    for (const booking of paidBookings) {
      const bookingDateTime = dayjs(booking.date_to)
      const hour = dayjs(booking.time_to, 'hh:mm a').hour()
      const minute = dayjs(booking.time_to, 'hh:mm a').minute()
      bookingDateTime.add(hour, 'hour')
      bookingDateTime.add(minute, 'minute')

      if (currentDateTime.isAfter(bookingDateTime)) {
        await Booking.findByIdAndUpdate(booking._id, {
          sessionStatus: 'Ended'
        }).exec()

        console.log(`Booking ${booking._id} status updated to 'Ended'.`)

        const userId = booking.user
        const user: IUser | null = await User.findById(userId).exec()
        console.log('user ', user)
        if (user) {
          const currentDate = dayjs().tz('Asia/Hong_Kong');
          user.customerInfo.streakDates.push(currentDate.format('YYYY-MM-DD'))
          await user.save()

          console.log(`Streak date added for user ${userId}.`)
        }
      } else {
        console.error(`User not found for booking ${booking._id}.`)
      }
    }
    console.log('Cron job completed.')
  } catch (error) {
    console.error('Error in cron job:', error)
  }
})

job.start()
