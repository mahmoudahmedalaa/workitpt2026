import asyncWrapper from '@utils/asyncWrapper'
import adminServices from '@services/admin.services'
import { returnResponse } from '@utils/returnResponse'
import { IRole } from '@interfaces/role'
import Session from '@models/session.models'
import User from '@models/user.model'

//admin user part
export const users = asyncWrapper(async (req, res) => {
  const trainerVerificationStatus = req.query.trainerVerificationStatus as
    | string
    | undefined
  const search = req.query.search as string | undefined
  const page = req.query.page as string
  const limit = req.query.limit as string
  const role = req.query.role as IRole
  const pageNumber = parseInt(page) || 1
  const pageLimit = parseInt(limit) || 10
  const returns = await adminServices.users(
    pageNumber,
    pageLimit,
    role,
    search,
    trainerVerificationStatus
  )
  returnResponse(res, returns)
})

export const user = asyncWrapper(async ({ params }, res) => {
  const returns = await adminServices.user(params.id)
  returnResponse(res, returns)
})

export const approveUsers = asyncWrapper(async (req, res) => {
  const currentUser = req.user._id
  const userReq = req.query.user as string
  const { verificationStatus, details } = req.body
  const returns = await adminServices.approveUsers(
    currentUser,
    userReq,
    verificationStatus,
    details
  )
  returnResponse(res, returns)
})

export const migrateSessions = asyncWrapper(async (req, res) => {
  const invalidSessionsRegex =
    /(one_on_one)|(One On One)|(one on one)|(One-on-One)/i
  const sessions = await Session.find()
  sessions.forEach(async session => {
    if (invalidSessionsRegex.test(session.session_type)) {
      session.session_type = '1-on-1'
      await session.save()
    } else {
      session.session_type = session.session_type
      await session.save()
    }
  })
  const newSessions = await Session.find()
  res.json({
    message: 'Migrated sessions',
    sessions: newSessions
  })
})

export const migrateTrainers = asyncWrapper(async (req, res) => {
  const trainers = await User.find({ role: 'TRAINER' })
  trainers.forEach(async trainer => {
    if (trainer.trainerInfo?.verificationStatus === 'INACTIVE') {
      await User.findByIdAndUpdate(trainer._id, {
        $set: {
          'trainerInfo.verificationStatus': 'PENDING'
        }
      })
    }
  })
  res.json({
    message: 'Migrated trainers'
  })
})
