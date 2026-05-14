import {
  checkOutSession,
  checkOutSessionWithCard,
  listCard,
  saveCard,
  deleteCard,
  successSession,
  failureSession
} from '@controllers/stripe.controller'
import { Router } from 'express'
import { verifyToken, hasRole } from '@middlewares/auth.middleware'
import { USER_ROLE } from '@constants/role.constant'
const stripeRouter = Router()

stripeRouter.get('/success', successSession)
stripeRouter.get('/failure', failureSession)
stripeRouter.get('/card/list', verifyToken, hasRole([USER_ROLE]), listCard)
stripeRouter.post('/card', verifyToken, hasRole([USER_ROLE]), saveCard)
stripeRouter.delete(
  '/card/detach',
  verifyToken,
  hasRole([USER_ROLE]),
  deleteCard
)
stripeRouter.post(
  '/checkout',
  verifyToken,
  hasRole([USER_ROLE]),
  checkOutSession
)
stripeRouter.post(
  '/checkout/card',
  verifyToken,
  hasRole([USER_ROLE]),
  checkOutSessionWithCard
)

export default stripeRouter
