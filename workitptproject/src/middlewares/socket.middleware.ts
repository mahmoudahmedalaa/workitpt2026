import User from '@models/user.model'
import { Socket } from 'socket.io'
import { verifyAccessToken, IDecodedToken } from '@utils/jwt'
import bookingService from '@services/booking.services'

export const authenticateSocketUser = async (
  socket: Socket,
  next: (error?: Error) => void
) => {
  try {
    const authToken = socket.handshake.headers.authorization
    const sessionId = socket.handshake.query.sessionId
    if (!authToken) next(new Error('Authorization token not found'))
    const userToken = authToken.split(' ')[1]
    const tokenRes = (await verifyAccessToken(userToken)) as IDecodedToken
    const user = await User.findOne({ _id: tokenRes._id }).select(
      '+userSecret -password'
    )
    if (!user) next(new Error('User not found'))

    //check session and payment status here
    const isBooked = await bookingService.isSessionBooked(sessionId as string)

    if (!isBooked) next(new Error('Payment is not completed'))
    socket.data = { user, session: sessionId }
    next()
  } catch (e) {
    console.log(e, 'eroor')
    next(new Error(e.message || 'Internal server error'))
  }
}
