import asyncWrapper from '@utils/asyncWrapper'
import bookingService from '@services/booking.services'
import { returnResponse } from '@utils/returnResponse'
import { createBookingsReceiptDoc } from '@utils/booking'
import crypto from 'node:crypto'

export const listBooking = asyncWrapper(async (req, res) => {
  const page = req.query.page as string
  const limit = req.query.limit as string
  const pageNumber = parseInt(page) || 1
  const pageLimit = parseInt(limit) || 10
  const returns = await bookingService.list(pageNumber, pageLimit, req)
  returnResponse(res, returns)
})
export const addBooking = asyncWrapper(async (req, res) => {
  const userId = req.user._id
  const resBody = req.body
  const returns = await bookingService.create(resBody, userId)
  returnResponse(res, returns)
})

export const myUpcommingBooking = asyncWrapper(async (req, res) => {
  console.log(123)
  const page = req.query.page as string
  const limit = req.query.limit as string
  const pageNumber = parseInt(page) || 1
  const pageLimit = parseInt(limit) || 10
  const returns = await bookingService.upcommingMyBooking(
    pageNumber,
    pageLimit,
    req
  )
  returnResponse(res, returns)
})

export const myPendingPayments = asyncWrapper(async (req, res) => {
  const page = req.query.page as string
  const limit = req.query.limit as string
  const pageNumber = parseInt(page) || 1
  const pageLimit = parseInt(limit) || 10
  const returns = await bookingService.pendingPayments(
    pageNumber,
    pageLimit,
    req
  )
  returnResponse(res, returns)
})

export const locationRangeCalculation = asyncWrapper(async (req, res) => {
  const returns = await bookingService.locationRange(req)
  returnResponse(res, returns)
})

export const bookingDetail = asyncWrapper(async (req, res) => {
  const bookingId = req.params.id
  const userId = req.user._id
  const returns = await bookingService.bookingDetail(bookingId, userId)
  returnResponse(res, returns)
})

export const bookingDetailMultiple = asyncWrapper(async (req, res) => {
  const bookingIdsQuery = req.query.bookingIds
  const bookingIds =
    bookingIdsQuery && typeof bookingIdsQuery === 'string'
      ? bookingIdsQuery.split(',')
      : []
  const userId = req.user._id
  const returns = await bookingService.bookingDetailMultiple(bookingIds, userId)
  returnResponse(res, returns)
})

export const bookingReceipt = asyncWrapper(async (req, res) => {
  const bookingIdsQuery = req.query.bookingIds
  const bookingIds =
    typeof bookingIdsQuery === 'string' ? bookingIdsQuery.split(',') : []
  const userId = req.user._id
  const bookings = await Promise.all(
    bookingIds.map(bookingId =>
      bookingService.findOne({
        _id: bookingId,
        user: userId,
        date_from: { $gte: new Date() }
      })
    )
  )
  if (bookings.length === 0)
    return returnResponse(res, {
      ok: false,
      status: 404,
      message: 'Booking not found'
    })
  const uuid = crypto.randomUUID()
  const doc = createBookingsReceiptDoc(bookings, bookings[0].session, req.user)
  const filename = `booking-receipt-${uuid}.pdf`
  const stream = res.writeHead(200, {
    'Content-Type': 'application/pdf',
    'Content-disposition': `attachment;filename=${filename}`
  })
  doc.on('data', chunk => stream.write(chunk))
  doc.on('end', () => stream.end())
})
