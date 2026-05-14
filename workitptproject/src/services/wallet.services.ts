import { IReturnResponse } from '@interfaces/response'
import Wallet from '@models/wallet.model'
import { ITrainer } from '@models/trainer.model'
import Withdraw from '@models/withdraw.model'
import { truncateLastTwoNumber } from '@helpers/generator'
import { PAID, PENDING } from '@constants/paid.constant'

const walletServices = {
  currentBalance: async (
    trainer: ITrainer['_id']
  ): Promise<IReturnResponse> => {
    const totalCount = await Wallet.aggregate([
      { $match: { trainer: trainer } },
      {
        $group: {
          _id: '$trainer',
          total: { $sum: '$amount' }
        }
      }
    ])
    const pendingAmount = await Withdraw.aggregate([
      { $match: { trainer: trainer, approved: PENDING } },
      {
        $group: {
          _id: '$trainer',
          total: { $sum: '$amount' }
        }
      }
    ])
    const receivedAmount = await Withdraw.aggregate([
      { $match: { trainer: trainer, approved: PAID } },
      {
        $group: {
          _id: '$trainer',
          total: { $sum: '$amount' }
        }
      }
    ])

    const totalAmount =
      (totalCount[0]?.total || 0) -
      (pendingAmount[0]?.total || 0) -
      (receivedAmount[0]?.total || 0)

    return {
      ok: true,
      data: {
        currentAmount: truncateLastTwoNumber(totalAmount),
        pendingAmount: truncateLastTwoNumber(pendingAmount[0]?.total || 0),
        receivedAmount: truncateLastTwoNumber(receivedAmount[0]?.total || 0)
      }
    }
  },
  purchaseHistory: async (
    trainer: ITrainer['_id']
  ): Promise<IReturnResponse> => {
    const list = await Wallet.find({ trainer: trainer })
      .populate({
        path: 'booking',
        select: 'session',
        populate: {
          path: 'session',
          select: 'session_title price select_type date_from time_from time_to'
        }
      })
      .sort({ _id: -1 })
    return {
      ok: true,
      data: list
    }
  }
}

export default walletServices
