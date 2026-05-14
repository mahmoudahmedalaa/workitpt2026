import { verifyToken, hasRole } from '@middlewares/auth.middleware'
import { ADMIN_ROLE, TRAINER_ROLE } from '@constants/role.constant'
import {
  withdrawBalance,
  withdrawStatement,
  withdrawStatementAdmin,
  withdrawApproval,
  withdrawStatementDetails
} from '@controllers/withdraw.controller'
import { Router } from 'express'

const withdrawRouter = Router()

withdrawRouter.post(
  '/balance',
  verifyToken,
  hasRole([TRAINER_ROLE]),
  withdrawBalance
)
withdrawRouter.get(
  '/statement',
  verifyToken,
  hasRole([TRAINER_ROLE]),
  withdrawStatement
)

withdrawRouter.get(
  '/statement/details/:id',
  verifyToken,
  hasRole([TRAINER_ROLE, ADMIN_ROLE]),
  withdrawStatementDetails
)

withdrawRouter.get(
  '/statement/info',
  verifyToken,
  hasRole([ADMIN_ROLE]),
  withdrawStatementAdmin
)

withdrawRouter.post(
  '/approve',
  verifyToken,
  hasRole([ADMIN_ROLE]),
  withdrawApproval
)

export default withdrawRouter
