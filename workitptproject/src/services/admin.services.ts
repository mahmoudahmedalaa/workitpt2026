import User, { IUser } from '@models/user.model'
import { IReturnResponse } from '@interfaces/response'
import { IStatus } from '@interfaces/status'
import { IRole } from '@interfaces/role'
import {
  ACTIVE_STATUS,
  BANNED_STATUS,
  INACTIVE_STATUS
} from '@constants/status.constant'
import { NotificationService } from './notification.services'
import { USER_ROLE } from '@constants/role.constant'

const adminServices = {
  users: async (
    page: number,
    limit: number,
    role?: IRole,
    search?: string,
    trainerVerificationStatus?: string
  ): Promise<IReturnResponse> => {
    const filter: { [key: string]: unknown } = {}
    const currentPage = page >= 1 ? page - 1 : page

    if (role) filter['role'] = role.toUpperCase()

    // search by firstName,lastName,email
    if (search) {
      const searchRegex = new RegExp(search, 'i')
      filter['$or'] = [
        { firstName: { $regex: searchRegex } },
        { lastName: { $regex: searchRegex } },
        { email: { $regex: searchRegex } }
      ]
    }
    // filter by trainerVerificationStatus
    if (trainerVerificationStatus) {
      filter['trainerInfo.verificationStatus'] = trainerVerificationStatus
    }

    const total = await User.count(filter)
    const totalPage = Math.ceil(total / limit)
    const list = await User.find(filter)
      .skip(currentPage * limit)
      .limit(limit)
      .sort({ _id: -1 })

    return {
      ok: true,
      data: list,
      currentPage: page,
      totalPage: totalPage,
      limit: limit,
      total: total
    }
  },
  user: async (userId: IUser['_id']): Promise<IReturnResponse> => {
    const list = await User.findOne({ _id: userId }).select(
      '+trainerInfo.contactNumber +customerInfo.contactNumber'
    )
    return {
      ok: true,
      data: list
    }
  },
  approveUsers: async (
    currentUser: IUser['_id'],
    userId: IUser['_id'],
    verificationStatus: IStatus,
    details: string
  ): Promise<IReturnResponse> => {
    const notification = new NotificationService()
    if (
      ![ACTIVE_STATUS, BANNED_STATUS, INACTIVE_STATUS].includes(
        verificationStatus
      )
    )
      return {
        ok: false,
        message: `Trainer status must be ${ACTIVE_STATUS},${INACTIVE_STATUS} or ${BANNED_STATUS}`
      }

    if (verificationStatus != ACTIVE_STATUS && !details)
      return {
        ok: false,
        message: `${INACTIVE_STATUS} || ${BANNED_STATUS} must have clarified description`
      }

    const foundUser = await User.findOne({
      $and: [{ _id: { $ne: currentUser } }, { _id: userId }]
    })
    if (foundUser.role === USER_ROLE) {
      return {
        ok: false,
        status: 400,
        message: `Customer role are already verfied via email, this only works for trainer verification`
      }
    }
    const notificationPayload = {
      user: foundUser,
      title: `Account ${
        verificationStatus === ACTIVE_STATUS
          ? 'activation'
          : verificationStatus === INACTIVE_STATUS
          ? 'deactivation'
          : verificationStatus.toLowerCase()
      } alert`,
      body:
        verificationStatus != ACTIVE_STATUS
          ? details
          : `Dear ${foundUser.role.toLowerCase()} your account has been activated`,
      data: foundUser
    }

    foundUser.trainerInfo.verificationStatus = verificationStatus
    verificationStatus != ACTIVE_STATUS
      ? (foundUser.trainerInfo.blockerDetails = details)
      : (foundUser.trainerInfo.blockerDetails = '')

    await foundUser.save()
    await notification.notify(notificationPayload)

    console.log(notificationPayload)

    return {
      ok: true,
      data: foundUser,
      message: `Trainer status is changed to ${verificationStatus.toLowerCase()}`
    }
  }
}

export default adminServices
