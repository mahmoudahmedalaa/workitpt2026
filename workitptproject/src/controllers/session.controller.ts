import asyncWrapper from '@utils/asyncWrapper'
import sessionService from '@services/session.services'
import { returnResponse } from '@utils/returnResponse'

export const listSession = asyncWrapper(async (req, res) => {
  const page = req.query.page as string
  const limit = req.query.limit as string
  const pageNumber = parseInt(page) || 1
  const pageLimit = parseInt(limit) || 10
  const returns = await sessionService.list(pageNumber, pageLimit, req)
  returnResponse(res, returns)
})
export const addSession = asyncWrapper(async (req, res) => {
  const trainerId = req.user._id
  const resBody = req.body
  const returns = await sessionService.create(resBody, trainerId)
  returnResponse(res, returns)
})

export const updateSession = asyncWrapper(async (req, res) => {
  const sessionId = req.params.sessionId
  const resBody = req.body
  const trainerId = req.user._id
  const returns = await sessionService.update(sessionId, resBody, trainerId)
  returnResponse(res, returns)
})

export const viewSession = asyncWrapper(async (req, res) => {
  const sessionId = req.params.sessionId
  const userId = req.user._id
  const returns = await sessionService.viewSession(sessionId, userId)
  returnResponse(res, returns)
})

export const deleteSession = asyncWrapper(
  async ({ params: { sessionId } }, res) => {
    const returns = await sessionService.deleteSession(sessionId)
    returnResponse(res, returns)
  }
)

export const upcommingSession = asyncWrapper(async (req, res) => {
  const page = req.query.page as string
  const limit = req.query.limit as string
  const pageNumber = parseInt(page) || 1
  const pageLimit = parseInt(limit) || 10
  const returns = await sessionService.upcommingSession(
    pageNumber,
    pageLimit,
    req
  )
  returnResponse(res, returns)
})

export const previousSession = asyncWrapper(async (req, res) => {
  const page = req.query.page as string
  const limit = req.query.limit as string
  const pageNumber = parseInt(page) || 1
  const pageLimit = parseInt(limit) || 10
  const returns = await sessionService.previousSession(
    pageNumber,
    pageLimit,
    req
  )
  returnResponse(res, returns)
})

export const completedSession = asyncWrapper(async (req, res) => {
  const page = req.query.page as string
  const limit = req.query.limit as string
  const pageNumber = parseInt(page) || 1
  const pageLimit = parseInt(limit) || 10
  const returns = await sessionService.completedSession(
    pageNumber,
    pageLimit,
    req
  )
  returnResponse(res, returns)
})

export const sessionByReferenceId = asyncWrapper(async (req, res) => {
  const page = req.query.page as string
  const limit = req.query.limit as string
  const pageNumber = parseInt(page) || 1
  const pageLimit = parseInt(limit) || 10
  const returns = await sessionService.sessionByRefrenceId(
    pageNumber,
    pageLimit,
    req
  )
  returnResponse(res, returns)
})

export const todaySession = asyncWrapper(async (req, res) => {
  const returns = await sessionService.todaySession(req)
  returnResponse(res, returns)
})

export const sessionRating = asyncWrapper(async (req, res) => {
  const returns = await sessionService.rating(req)
  returnResponse(res, returns)
})
