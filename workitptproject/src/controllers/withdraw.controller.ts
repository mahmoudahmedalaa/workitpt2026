import asyncWrapper from '@utils/asyncWrapper'
import withdrawServices from '@services/withdraw.services'
import { returnResponse } from '@utils/returnResponse'

export const withdrawBalance = asyncWrapper(async (req, res) => {
  const { amount, acNo, name, bankName } = req.body
  const accountDetails = {
    acNo,
    name,
    bankName
  }
  const returns = await withdrawServices.withdrawBalance(
    req.user._id,
    req.user.email,
    amount,
    accountDetails
  )
  returnResponse(res, returns)
})

export const withdrawStatement = asyncWrapper(async (req, res) => {
  const page = req.query.page as string
  const limit = req.query.limit as string
  const paymentStatus = req.query.paymentStatus as string
  const pageNumber = parseInt(page) || 1
  const pageLimit = parseInt(limit) || 10
  const returns = await withdrawServices.statement(
    pageNumber,
    pageLimit,
    req.user._id,
    paymentStatus
  )
  returnResponse(res, returns)
})

export const withdrawStatementDetails = asyncWrapper(async (req, res) => {
  const statementId = req.params.id as string
  const returns = await withdrawServices.statementDetails(statementId)
  returnResponse(res, returns)
})

//used by admin only
export const withdrawStatementAdmin = asyncWrapper(async (req, res) => {
  const page = req.query.page as string
  const limit = req.query.limit as string
  const paymentStatus = req.query.paymentStatus as string
  const trainerId = req.query.trainer as string
  const pageNumber = parseInt(page) || 1
  const pageLimit = parseInt(limit) || 10
  const returns = await withdrawServices.statementAdmin(
    pageNumber,
    pageLimit,
    trainerId,
    paymentStatus
  )
  returnResponse(res, returns)
})

export const withdrawApproval = asyncWrapper(async (req, res) => {
  const { statement, remarks, approval } = req.body
  const returns = await withdrawServices.withdrawApproval(
    statement,
    approval,
    remarks
  )
  returnResponse(res, returns)
})
