import User, { IUser } from '@models/user.model'
import Notification, { INotification } from '@models/notification.model'
import { IReturnResponse } from '@interfaces/response'
import fb from '@config/fb'
import config from '@config/index'
import { ADMIN_ROLE } from '@constants/role.constant'

interface NotificationParams {
  user: IUser
  title: string
  isAdmin?: boolean
  body: string
  data?: string | any
  seen?: boolean
}

export class NotificationService {
  private notificationOptions = {
    priority: config.firebase.notiPriority,
    timeToLive: 60 * 60 * Number(config.firebase.notiTtl)
  }

  async notify(params: NotificationParams) {
    try {
      const { user, title, body, isAdmin, data = {} } = params
      const fcmTokens = await User.findOne({ _id: user }).distinct('fcmToken')
      const nonEmptyTokens = fcmTokens.filter(i => i != '')
      await Notification.create({
        user,
        title,
        body,
        isAdmin,
        data: data
      })
      const notiObj = {
        title: title,
        sound: config.firebase.notiSound,
        body: body,
        badge: config.firebase.notiBadge
      }
      if (!nonEmptyTokens.length) return null
      const sendNotification = await fb.messaging().sendToDevice(
        nonEmptyTokens,
        {
          notification: notiObj,
          data: { data: JSON.stringify(data || {}) }
        },
        this.notificationOptions
      )
      return sendNotification
    } catch (err) {
      throw err
    }
  }

  async getNotification(
    user: IUser,
    page: number,
    limit: number
  ): Promise<IReturnResponse> {
    const isAdmin = user.role === ADMIN_ROLE ? true : false
    const currentPage = page >= 1 ? page - 1 : page

    const unseenNotificationCount = await Notification.count(
      isAdmin ? { isAdmin: true, seen: false } : { user: user._id, seen: false }
    )
    const filter = isAdmin ? { isAdmin: true } : { user: user._id }
    const notification = await Notification.find(filter)
      .populate({ path: 'user', select: 'firstName lastName avatar role' })
      .skip(currentPage * limit)
      .limit(limit)
      .sort({ _id: -1 })
    const total = await Notification.count(filter)
    const totalPage = Math.ceil(total / limit)
    return {
      ok: true,
      data: notification,
      currentPage: currentPage,
      total: unseenNotificationCount,
      totalPage
    }
  }
  async viewNotification(
    notification: INotification['_id']
  ): Promise<IReturnResponse> {
    const seenNotification = await Notification.findOneAndUpdate(
      { _id: notification },
      { seen: true },
      { new: true }
    )
    return {
      ok: true,
      message: 'Seen',
      data: seenNotification
    }
  }
  async viewAllNotification(user: IUser): Promise<IReturnResponse> {
    const isAdmin = user.role === ADMIN_ROLE ? true : false
    await Notification.updateMany(
      isAdmin
        ? { isAdmin, seen: false }
        : { user: user._id, isAdmin: true, seen: false },
      { seen: true },
      { new: true }
    )
    return {
      ok: true,
      message: 'Seen all',
      data: {}
    }
  }
}
