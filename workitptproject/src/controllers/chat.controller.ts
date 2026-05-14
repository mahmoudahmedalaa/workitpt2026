import { userChatService } from '@services/chat/chat.services'
import asyncWrapper from '@utils/asyncWrapper'
import { returnResponse } from '@utils/returnResponse'

export const getChatMessages = asyncWrapper(async (req, res) => {
  const { sessionId } = req.params
  const page = req.query.page as string
  const limit = req.query.limit as string
  const pageNumber = parseInt(page) || 1
  const pageLimit = parseInt(limit) || 10
  const data = await userChatService.getMessages(
    sessionId,
    pageNumber,
    pageLimit
  )
  returnResponse(res, data)
})

export const getInteractedLists = asyncWrapper(async (req, res) => {
  const userId = req.user._id
  const page = req.query.page as string
  const limit = req.query.limit as string
  const pageNumber = parseInt(page) || 1
  const pageLimit = parseInt(limit) || 10
  const data = await userChatService.getUsersLists(
    userId,
    pageNumber,
    pageLimit
  )
  returnResponse(res, data)
})
