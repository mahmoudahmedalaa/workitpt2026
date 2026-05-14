import { IReturnResponse } from '@interfaces/response'
import Chat, { IChat } from '@models/chat.model'
import Session, { ISession } from '@models/session.models'
import User, { IUser } from '@models/user.model'
import { IO } from 'server'
import { Socket } from 'socket.io'
import { NotificationService } from '@services/notification.services'
import Booking from '@models/booking.model'
import mongoose from 'mongoose'

export const userChatService = {
  getMessages: async (
    sessionId: ISession['_id'],
    page: number,
    limit: number
  ): Promise<IReturnResponse> => {
    let messages
    let totalPage
    let total
    const currentPage = page >= 1 ? page - 1 : page
    const skip = currentPage * limit

    const filter = {
      session: sessionId
    }
    const userFields = '_id firstName lastName avatar email role'
    total = await Chat.find(filter).countDocuments()
    messages = await Chat.find(filter)
      .skip(skip)
      .limit(limit)
      .sort({ createdAt: -1 })
      .populate({ path: 'sender', select: userFields })
      .populate({
        path: 'session',
        populate: {
          path: 'trainer',
          select: 'firstName lastName avatar'
        }
      })

    totalPage = Math.ceil(total / limit)

    return {
      ok: true,
      data: messages ? messages : [],
      currentPage: page,
      totalPage: totalPage,
      limit: limit,
      total: total
    }
  },
  getUsersLists: async (
    userId: IUser['_id'],
    page: number,
    limit: number
  ): Promise<IReturnResponse> => {
    let sessionLists
    // let totalPage
    // let total
    // const currentPage = page >= 1 ? page - 1 : page
    // const skip = currentPage * limit
    // total = await Chat.find(filter).countDocuments()
    sessionLists = await Chat.aggregate([
      { $match: { sender: new mongoose.Types.ObjectId(userId) } },

      {
        $lookup: {
          from: 'users',
          localField: 'sender',
          foreignField: '_id',
          as: 'sender'
        }
      },
      {
        $unwind: '$sender'
      },
      {
        $group: {
          _id: '$session',
          message: { $last: '$message' },
          createdAt: { $last: '$createdAt' }
        }
      },
      {
        $lookup: {
          from: 'sessions',
          localField: '_id',
          foreignField: '_id',
          as: 'session'
        }
      },
      {
        $unwind: '$session'
      },
      {
        $lookup: {
          from: 'users',
          localField: 'session.trainer',
          foreignField: '_id',
          as: 'session.trainer'
        }
      },
      { $unwind: '$session.trainer' },
      {
        $unset: [
          'session.trainer.password',
          'session.trainer.userSecret',
          'session.trainer.fcmToken',
          'session.trainer.stripe_customer_id'
        ]
      },
      { $sort: { createdAt: -1 } }
    ])
    // totalPage = Math.ceil(total / limit)

    // console.log(total, messages)
    return {
      ok: true,
      data: sessionLists ? sessionLists : []
      // currentPage: page,
      // totalPage: totalPage,
      // limit: limit,
      // total: total
    }
  },

  create: async (chatData: Partial<IChat>): Promise<IReturnResponse> => {
    console.log(chatData)
    const { session, sender, message } = chatData
    console.log(session, 'session')
    const _session = await Session.findById(session)
    if (!_session)
      return {
        ok: false,
        status: 404,
        message: 'Session not found'
      }
    const chat = await Chat.create({ session, sender, message })
    return {
      ok: true,
      status: 201,
      data: chat
    }
  }
}

export const initializeChat = async (
  socket: Socket,
  next: (error?: Error) => void
) => {
  const { user, session } = socket.data
  const sender = await User.findOne({ _id: user._id }).select(
    '_id firstName lastName avatar role email'
  )
  socket.join(session)
  socket.on('chatMsg', async (payload: any) => {
    try {
      const { msg } = payload
      const message = await userChatService.create({
        sender,
        message: msg,
        session
      })

      if (sender.role === 'USER') {
        const bookedData = await Booking.find({ session }).populate('session')
        const receivers = bookedData.map(item => item.session.trainer)
        await sendNotification(receivers, msg).catch(err => {
          console.log(err)
        })
      }

      if (sender.role === 'TRAINER') {
        const bookedData = await Booking.find({ session })
        const receivers = bookedData.map(item => item.user)
        await sendNotification(receivers, msg).catch(err => {
          console.log(err)
        })
      }

      IO.to(session).emit('msgReceived', {
        sender,
        message: msg,
        createdAt: message.data.createdAt,
        seen: message.data.seen
      })
      IO.to(socket.id).emit('success', 'Message sent')
    } catch (error) {
      console.error('Error processing chat message:', error)
    }
  })

  socket.on('disconnect', payload => {
    console.log('Chat disconnected')
  })

  next()
}

const sendNotification = async (users: string[], msg: string) => {
  const notification = new NotificationService()
  for (const user of users) {
    const reciver = await User.findById(user)
    const notificationPayload = {
      user: reciver,
      title: `Workitpt - New Message`,
      body: msg,
      data: user
    }
    await notification.notify(notificationPayload)
  }
}
