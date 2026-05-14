import { Router } from 'express'
import {
  listTrainer,
  listTrainerDetails,
  listCustomer,
  listCustomerDetails,
  listWeekDayPlan,
  listActivity,
  getUserStreak,
  getUserAnalytics
} from '@controllers/users.controller'
import { verifyToken, hasRole } from '@middlewares/auth.middleware'
import { TRAINER_ROLE, USER_ROLE } from '@constants/role.constant'

const userRouter = Router()

userRouter.get('/trainer/list', verifyToken, hasRole([USER_ROLE]), listTrainer)
userRouter.get(
  '/trainer/:id/list',
  verifyToken,
  hasRole([USER_ROLE]),
  listTrainerDetails
)

userRouter.get(
  '/customer/list',
  verifyToken,
  hasRole([TRAINER_ROLE]),
  listCustomer
)
userRouter.get(
  '/customer/:id/list',
  verifyToken,
  hasRole([TRAINER_ROLE]),
  listCustomerDetails
)
userRouter.get('/activity', verifyToken, listActivity)
userRouter.get('/week-day-plan', verifyToken, listWeekDayPlan)
userRouter.get('/streak', verifyToken, getUserStreak)
userRouter.get('/analytics', verifyToken, getUserAnalytics)
export default userRouter
