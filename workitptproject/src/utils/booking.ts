import { IBooking } from '@models/booking.model'
import PDFDocument from 'pdfkit'
import path from 'node:path'
import dayjs from 'dayjs'
import config from '@config/index'
import { ISession } from '@models/session.models'
import { calculateCharge } from '@helpers/calculateprice'
import { IUser } from '@models/user.model'

const createLineSepator = (doc: PDFKit.PDFDocument) => {
  return doc
    .moveDown()
    .strokeColor('#DCDCDC')
    .lineWidth(1)
    .moveTo(doc.x, doc.y)
    .lineTo(doc.page.width - doc.page.margins.right, doc.y)
    .stroke()
    .moveDown(2)
}

export const createBookingsReceiptDoc = (
  bookings: IBooking[],
  session: ISession & { trainer: IUser },
  user: IUser
): PDFKit.PDFDocument => {
  const pricing = calculateCharge(bookings)
  const bookingDateAndTime = bookings
    .map(booking => `${dayjs(booking.date_from).format('MMM DD')}`)
    .join(' & ')
  const trainer = session.trainer.firstName + ' ' + session.trainer.lastName

  const logo = path.join(process.cwd(), '/src/assets/logo.png')
  const doc = new PDFDocument({
    size: 'A4',
    margin: 50
  })

  doc.image(logo, (doc.page.width - 200) / 2)

  doc.moveDown(3)
  doc.fontSize(24)
  doc.text('Booking Payment Receipt', {
    align: 'center',
    underline: true
  })

  doc.fontSize(14)
  doc.moveDown(3)
  doc.text(`Booking Date : ${bookingDateAndTime}`)

  doc.moveDown()
  doc.text(`Time : ${session.time_from} - ${session.time_to}`)

  doc.moveDown()
  doc.text(`Trainer : ${trainer}`)

  doc.moveDown()
  doc.text(`Session : ${session.session}`)

  doc.moveDown()
  doc.text(
    `Location : ${
      session.location_on_map || session.online_url || session.location
    }`
  )

  createLineSepator(doc)
  doc.text(`Amount : $${pricing.details.currentCost}`)

  doc.moveDown()
  doc.text(`Service Charge : $${pricing.details.serviceCharge}`)

  doc.moveDown()
  doc.text(`Total : $${pricing.total}`)

  createLineSepator(doc)
  doc.text(`Name : ${user.firstName} ${user.lastName}`)

  doc.end()
  return doc
}
