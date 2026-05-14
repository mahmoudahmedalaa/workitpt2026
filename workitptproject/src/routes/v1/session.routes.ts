import { Router } from 'express'
import {
  verifyToken
  // hasRole
} from '@middlewares/auth.middleware'
import {
  addSession,
  deleteSession,
  listSession,
  previousSession,
  sessionByReferenceId,
  sessionRating,
  todaySession,
  upcommingSession,
  updateSession,
  viewSession,
  completedSession
} from '@controllers/session.controller'
// import { TRAINER_ROLE } from '@constants/role.constant'

const sessionRouter = Router()

sessionRouter.use(verifyToken)
sessionRouter.get('/list', listSession)
sessionRouter.post('/add', addSession)
sessionRouter.put('/:sessionId', updateSession)
sessionRouter.delete('/:sessionId', deleteSession)
sessionRouter.get('/view/:sessionId', viewSession)
sessionRouter.get('/upcomming-session', upcommingSession)
sessionRouter.get('/previous-session', previousSession)
sessionRouter.get('/today-session', todaySession)
sessionRouter.get('/session-by-referanceId/:referanceId', sessionByReferenceId)
sessionRouter.post('/session-rating/:sessionId', sessionRating)
sessionRouter.get('/completed-session', completedSession)

export default sessionRouter
