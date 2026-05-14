import asyncWrapper from '@utils/asyncWrapper'
import walletServices from '@services/wallet.services'
import { returnResponse } from '@utils/returnResponse'

export const currentBalance = asyncWrapper(async (req, res) => {
  const returns = await walletServices.currentBalance(req.user._id)
  returnResponse(res, returns)
})

export const purchaseHistory = asyncWrapper(async (req, res) => {
  const returns = await walletServices.purchaseHistory(req.user._id)
  returnResponse(res, returns)
})
