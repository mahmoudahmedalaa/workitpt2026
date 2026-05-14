import {
  getChatMessages,
  getInteractedLists
} from '@controllers/chat.controller'
import { Router } from 'express'

const chatRouter = Router()

chatRouter.get('/interacted-lists', getInteractedLists)
chatRouter.get('/:sessionId', getChatMessages)

export default chatRouter
