import Booking from '@models/booking.model'
import Chat from '@models/chat.model'
import Notification from '@models/notification.model'
import Session from '@models/session.models'
import Token from '@models/token.model'
import User from '@models/user.model'
import Wallet from '@models/wallet.model'
import WalletWithdraw from '@models/withdraw.model'

export const removeItems = async () => {
  console.log('Destroy initialized')
  await Booking.deleteMany()
  await Chat.deleteMany()
  await Notification.deleteMany()
  await Session.deleteMany()
  await Token.deleteMany()
  await User.deleteMany()
  await Wallet.deleteMany()
  await WalletWithdraw.deleteMany()
}
