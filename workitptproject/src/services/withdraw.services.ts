import { IReturnResponse } from '@interfaces/response'
import Withdraw, { IWithdrawalAmount } from '@models/withdraw.model'
import walletServices from './wallet.services'
import { truncateLastTwoNumber } from '@helpers/generator'
import { ITrainer } from '@models/trainer.model'
import mailService from './mail.services'
import config from '@config/index'
import { PAID, PENDING, REJECTED } from '@constants/paid.constant'
import { NotificationService } from './notification.services'

const withdrawServices = {
  withdrawBalance: async (
    trainer: ITrainer['_id'],
    email: string,
    amountToWithdraw: number,
    details: {
      acNo: string
      name: string
      bankName: string
    }
  ): Promise<IReturnResponse> => {
    if (!details.acNo || !details.name || !details.bankName) {
      return {
        ok: false,
        status: 400,
        message: 'acNo, name and bankName are required'
      }
    }
    const withdrawAmount = truncateLastTwoNumber(amountToWithdraw)
    if (!withdrawAmount)
      return {
        ok: false,
        status: 400,
        data: {},
        message: 'Please enter amount to be withdrawn'
      }
    const trainerWallet = await walletServices.currentBalance(trainer)
    const totalBalance = trainerWallet?.data?.currentAmount || 0
    if (withdrawAmount > totalBalance)
      return {
        ok: false,
        status: 400,
        data: {},
        message: 'Insufficient balance'
      }
    await Withdraw.create({
      trainer: trainer,
      amount: withdrawAmount,
      details
    })
    //to trainer
    mailService.sendMailManually(
      [email],
      'Amount withdraw status',
      `<p>Your amount of $${amountToWithdraw} withdrawal request has been sent to admin</p>
      <p>It might take few days for your amount to be deposited to given bank account. for more information please contact our administator</p>
      `
    )
    //to admin
    mailService.sendMailManually(
      [config.mail.receiver],
      'Amount withdraw request',
      `<p>Trainer with id: ${trainer}, email:${email} is requesting $${amountToWithdraw}, please visit admin pannel for more info...</p>`
    )
    return {
      ok: true,
      data: 'Amount withdraw request has been sent to admin, you will receive this amount once it is approved within 1 to 2 business days'
    }
  },
  statement: async (
    page: number,
    limit: number,
    trainer: ITrainer['_id'],
    paymentStatus: string
  ): Promise<IReturnResponse> => {
    let filter: { [key: string]: any } = {}
    if (paymentStatus) filter['approved'] = paymentStatus
    const currentPage = page >= 1 ? page - 1 : page
    const total = await Withdraw.count({ trainer: trainer, ...filter })
    const totalPage = Math.ceil(total / limit)
    const statements = await Withdraw.find({ trainer: trainer, ...filter })
      .populate({
        path: 'trainer',
        select: 'firstName lastName avatar email role'
      })
      .skip(currentPage * limit)
      .limit(limit)
      .sort({ _id: -1 })
    return {
      ok: true,
      data: statements,
      currentPage: page,
      totalPage: totalPage,
      limit: limit,
      total: total
    }
  },
  statementDetails: async (
    statement: IWithdrawalAmount['_id']
  ): Promise<IReturnResponse> => {
    const currentStatement = await Withdraw.findOne({
      _id: statement
    }).populate({
      path: 'trainer',
      select: 'firstName lastName avatar email role'
    })
    return {
      ok: true,
      data: currentStatement
    }
  },
  statementAdmin: async (
    page: number,
    limit: number,
    trainer: ITrainer['_id'],
    paymentStatus: string
  ): Promise<IReturnResponse> => {
    let filter: { [key: string]: any } = {}

    if (trainer) filter['trainer'] = trainer
    if (paymentStatus) filter['approved'] = paymentStatus

    const currentPage = page >= 1 ? page - 1 : page
    const total = await Withdraw.count({ ...filter })
    const totalPage = Math.ceil(total / limit)
    const statements = await Withdraw.find({ ...filter })
      .populate({
        path: 'trainer',
        select: 'firstName lastName avatar email role'
      })
      .skip(currentPage * limit)
      .limit(limit)
      .sort({ _id: -1 })
    return {
      ok: true,
      data: statements,
      currentPage: page,
      totalPage: totalPage,
      limit: limit,
      total: total
    }
  },
  withdrawApproval: async (
    statement: IWithdrawalAmount['_id'],
    approval: string,
    remarks: string
  ): Promise<IReturnResponse> => {
    const checkIfApproved = await Withdraw.findOne({
      _id: statement
    })
    if (!checkIfApproved)
      return {
        ok: false,
        status: 404,
        message: 'Statement not found'
      }
    if (checkIfApproved.approved === PAID)
      return {
        ok: false,
        message: 'Request is already paid and cannot be altered',
        status: 400,
        data: {}
      }
    if (![PENDING, PAID, REJECTED].includes(approval))
      return {
        ok: false,
        message: 'Invalid approve value',
        data: {},
        status: 400
      }
    if (!remarks)
      return {
        ok: false,
        message: 'Remarks is required',
        data: {},
        status: 400
      }
    await Withdraw.findOneAndUpdate(
      { _id: statement },
      {
        approved: approval,
        remarks: remarks
      },
      { new: true }
    )
    const notification = new NotificationService()
    await notification.notify({
      user: checkIfApproved.trainer,
      title: 'Workitpt - Withdraw approved',
      body: `Your withdraw request for amount ${checkIfApproved.amount} has been approved`,
      isAdmin: false
    })
    mailService.sendMailManually(
      [config.mail.receiver],
      'Amount withdraw request status',
      bodyRes(approval, checkIfApproved.amount, remarks)
    )
    return {
      ok: true,
      data: {},
      message: `Withdraw request ${approval.toLowerCase()}`
    }
  }
}

const bodyRes = (approval: string, amt: number, remarks: string) => {
  let resBody = ''
  switch (approval) {
    case PAID: {
      resBody = `
        Amount withdraw request paid
        <p>
       Your request for $${amt} has been deposited to your given bank account
       <br />
       <strong>REMARKS:<strong>
       <br />
      ${remarks}
      </p>`
      break
    }
    case PENDING: {
      resBody = `
      Amount withdraw request is still pending
      <p>
       Your request for $${amt} is still pending
       <br />
       <strong>REMARKS:<strong>
       <br />
      ${remarks}
      </p>`
      break
    }
    case REJECTED: {
      resBody = `
      Amount withdraw request has been rejected
      <p>
       Your request for $${amt} is rejected
       <br />
       <strong>REMARKS:<strong>
       <br />
      ${remarks}
      </p>`
      break
    }
  }
  return resBody
}
export default withdrawServices
