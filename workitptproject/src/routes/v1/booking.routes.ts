import { Router } from 'express'
import { verifyToken, hasRole } from '@middlewares/auth.middleware'
import {
  addBooking,
  listBooking,
  myUpcommingBooking,
  myPendingPayments,
  locationRangeCalculation,
  bookingDetail,
  bookingReceipt,
  bookingDetailMultiple
} from '@controllers/booking.controller'
import { USER_ROLE } from '@constants/role.constant'

const bookingRouter = Router()

bookingRouter.use(verifyToken)
bookingRouter.get('/list', listBooking)
bookingRouter.get('/detail/multiple', bookingDetailMultiple)
bookingRouter.get('/detail/:id', bookingDetail)
bookingRouter.post('/add', hasRole([USER_ROLE]), addBooking)
bookingRouter.get('/upcomming-bookings', myUpcommingBooking)
bookingRouter.get('/pending-payments', myPendingPayments)
bookingRouter.post('/location-range', locationRangeCalculation)
bookingRouter.get('/receipt', bookingReceipt)

export default bookingRouter
