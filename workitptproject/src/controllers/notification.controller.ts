import asyncWrapper from '@utils/asyncWrapper'
import { returnResponse } from '@utils/returnResponse'
import { NotificationService } from '@services/notification.services'

export const getNotification = asyncWrapper(async (req, res) => {
  const user = req.user
  const page = req.query.page as string
  const limit = req.query.limit as string
  const pageNumber = parseInt(page) || 1
  const pageLimit = parseInt(limit) || 10
  const notification = new NotificationService()
  const returns = await notification.getNotification(
    user,
    pageNumber,
    pageLimit
  )
  returnResponse(res, returns)
})

export const viewNotification = asyncWrapper(async (req, res) => {
  const notificationId = req.params.id
  const notification = new NotificationService()
  const returns = await notification.viewNotification(notificationId)
  returnResponse(res, returns)
})

export const viewAllNotification = asyncWrapper(async (req, res) => {
  const user = req.user
  const notification = new NotificationService()
  const returns = await notification.viewAllNotification(user)
  returnResponse(res, returns)
})
