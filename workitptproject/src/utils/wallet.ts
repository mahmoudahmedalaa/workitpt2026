import Booking, { IBooking } from '@models/booking.model'
import User, { IUser } from '@models/user.model'
import Wallet from '@models/wallet.model'

export const addToWallet = async (
  trainer: IUser['_id'],
  booking: IBooking['_id'],
  amount: number,
  transaction_charge: number
): Promise<boolean> => {
  try {
    const trainerExist = await User.findOne({ _id: trainer })
    if (!trainerExist) return false
    const checkIfPaymentSuccess = await Booking.findOne({
      _id: booking,
      isPaid: 'Paid'
    })
    if (checkIfPaymentSuccess) return false
    await Wallet.create(
      {
        trainer,
        booking,
        amount,
        transaction_charge
      },
      { new: true, upsert: true }
    )
    return true
  } catch (err) {
    return false
  }
}
