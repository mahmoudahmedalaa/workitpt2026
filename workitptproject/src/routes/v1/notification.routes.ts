import { verifyToken, hasRole } from '@middlewares/auth.middleware'
import { ADMIN_ROLE, TRAINER_ROLE, USER_ROLE } from '@constants/role.constant'
import {
  getNotification,
  viewNotification,
  viewAllNotification
} from '@controllers/notification.controller'
import { Router } from 'express'

const notificationRouter = Router()

notificationRouter.use(
  verifyToken,
  hasRole([ADMIN_ROLE, USER_ROLE, TRAINER_ROLE])
)
notificationRouter.get('/', getNotification)
notificationRouter.patch('/:id/view', viewNotification)
notificationRouter.patch('/view/all', viewAllNotification)

export default notificationRouter
