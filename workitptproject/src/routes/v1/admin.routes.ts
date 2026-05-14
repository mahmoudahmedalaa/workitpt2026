import { verifyToken, hasRole } from '@middlewares/auth.middleware'
import { ADMIN_ROLE } from '@constants/role.constant'
import {
  users,
  user,
  approveUsers,
  migrateSessions,
  migrateTrainers
} from '@controllers/admin.controller'
import { Router } from 'express'

const adminRouter = Router()
adminRouter.use(verifyToken, hasRole([ADMIN_ROLE]))
adminRouter.get('/users', users)
adminRouter.get('/users/:id', user)
adminRouter.patch('/approval', approveUsers)

adminRouter.get('/migrate-sessions', migrateSessions)
adminRouter.get('/migrate-trainers', migrateTrainers)

export default adminRouter
