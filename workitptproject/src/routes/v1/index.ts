import { Router } from 'express'
import authRouter from './auth.routes'
import fieldRouter from './field.routes'
import adminRouter from './admin.routes'
import sessionRouter from './session.routes'
import notificationRouter from './notification.routes'
import userRouter from './user.routes'
import bookingRouter from './booking.routes'
import stripeRouter from './stripe.routes'
import walletRouter from './wallet.routes'
import withdrawRouter from './withdraw.routes'
import chatRouter from './chat.routes'
import contactRouter from './contact.routes'
import { verifyToken } from '@middlewares/auth.middleware'

const router = Router()

router.use('/auth', authRouter)
router.use('/field', fieldRouter)
router.use('/admin', adminRouter)
router.use('/session', sessionRouter)
router.use('/notification', notificationRouter)
router.use('/users', userRouter)
router.use('/booking', bookingRouter)
router.use('/payment', stripeRouter)
router.use('/wallet', walletRouter)
router.use('/withdraw', withdrawRouter)
router.use('/message', [verifyToken], chatRouter)
router.use('/contact-us', [verifyToken], contactRouter)
//NOTE: only for dev ( REMOVE THIS IN PRODUCTION )
// router.use('/test', testRouter)

export default router
