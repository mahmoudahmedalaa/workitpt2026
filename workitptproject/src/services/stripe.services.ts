import { IReturnResponse } from '@interfaces/response'
import stripe from '@config/stripe'
import User, { IUser } from '@models/user.model'
import config from '@config/index'
import Booking, { IBooking } from '@models/booking.model'
import { PAID, PENDING, UNPAID } from '@constants/paid.constant'
import { calculateCharge } from '@helpers/calculateprice'
import { addToWallet } from '@utils/wallet'

const stripeServices = {
  createCustomers: async (user: IUser): Promise<IReturnResponse> => {
    const customer = await stripe.customers.create({
      name: `${user.firstName} ${user.lastName}`,
      email: user.email
    })
    await User.findOneAndUpdate(
      { _id: user._id },
      { stripe_customer_id: customer.id }
    )
    return {
      ok: true,
      data: customer
    }
  },
  listCard: async (user: IUser): Promise<IReturnResponse> => {
    if (!user.stripe_customer_id) {
      return {
        ok: true,
        data: []
      }
    }
    const cards = await stripe.paymentMethods.list({
      customer: user.stripe_customer_id,
      type: 'card'
    })
    return {
      ok: true,
      data: cards.data
    }
  },
  saveCard: async (
    user: IUser,
    card: {
      number: string
      exp_month: number
      exp_year: number
      cvc: string
      card_holder_name: string
    }
  ): Promise<IReturnResponse> => {
    let currentCustomer = user?.stripe_customer_id || ''
    const { number, exp_month, exp_year, cvc, card_holder_name } = card
    const { firstName, lastName, email } = user
    const paymentMethodCard = await stripe.paymentMethods.create({
      type: 'card',
      card: {
        number,
        exp_month,
        exp_year,
        cvc
      },
      billing_details: {
        name: `${card_holder_name}`,
        email: email
      }
    })
    // workitpt_api_stage
    if (!currentCustomer) {
      const res = await stripeServices.createCustomers(user)
      currentCustomer = res.data.id
    }
    const attachPaymentMethod = await stripe.paymentMethods.attach(
      paymentMethodCard.id,
      { customer: currentCustomer }
    )

    return {
      ok: true,
      data: attachPaymentMethod
    }
  },
  deleteCard: async (pmId: string): Promise<IReturnResponse> => {
    if (!pmId)
      return { ok: false, status: 404, message: 'Card not found', data: {} }
    await stripe.paymentMethods.detach(pmId)
    return {
      ok: true,
      data: 'Card removed sucessfully'
    }
  },
  chargeWithCard: async (
    user: IUser,
    pmId: string,
    req_session: { booking: IBooking['_id'][]; quantity?: number }
  ): Promise<IReturnResponse> => {
    if (!pmId)
      return { ok: false, message: 'Card not found', status: 404, data: {} }

    const currentBookings = await Booking.find({
      _id: { $in: req_session.booking },
      user: user._id,
      isPaid: { $in: [UNPAID, PENDING] }
    }).populate('session')
    if (!currentBookings.length) {
      return {
        ok: false,
        status: 404,
        message: 'Booking not found or is already purchased',
        data: {}
      }
    }
    const checkCardOwner = await stripe.paymentMethods.retrieve(pmId)
    if (checkCardOwner.customer !== user?.stripe_customer_id)
      return {
        ok: false,
        message: 'Unauthorized card owner',
        data: {},
        status: 401
      }
    const checkoutFromCard = await stripe.paymentIntents.create({
      amount: calculateCharge(currentBookings).total * 100,
      currency: 'usd',
      customer: user.stripe_customer_id,
      payment_method: pmId,
      confirm: true,
      receipt_email: user.email,
      return_url: `${config.app.url}`
    })
    await Booking.updateMany(
      {
        _id: { $in: req_session.booking },
        user: user._id,
        isPaid: { $in: [UNPAID, PENDING] }
      },
      { isPaid: PENDING }
    )
    if (!checkoutFromCard?.id || checkoutFromCard?.status !== 'succeeded') {
      return {
        ok: false,
        message: 'Payment not completed, something went wrong with the payment',
        data: {}
      }
    }
    const paymentIntent = checkoutFromCard.id
    const paymentResponse = await handleWalletPayment(
      req_session.booking,
      paymentIntent
    )
    return paymentResponse
  },
  createCheckoutSession: async (
    user: IUser,
    req_session: {
      booking: IBooking['_id'][]
      quantity?: number
      redirectUriOnSuccess?: string
    }
  ): Promise<IReturnResponse> => {
    let currentCustomer = user.stripe_customer_id
    const currentBooking = await Booking.find({
      _id: { $in: req_session.booking },
      user: user._id,
      isPaid: { $in: [UNPAID, PENDING] }
    }).populate('session')

    if (!currentBooking.length) {
      return {
        ok: false,
        status: 404,
        message: 'Booking not found or is already purchased',
        data: {}
      }
    }
    if (!currentCustomer) {
      const res = await stripeServices.createCustomers(user)
      currentCustomer = res.data.id
    }
    const line_items = currentBooking.map((i: IBooking) => {
      return {
        price_data: {
          currency: 'usd',
          product_data: {
            name: i.session.session_title,
            description: `
              Session price is ${calculateCharge([i]).details.currentCost},
              Service charge is ${calculateCharge([i]).details.serviceCharge},
            `,
            metadata: i._id
          },
          unit_amount: calculateCharge([i]).total * 100
        },
        quantity: 1
      }
    })
    const session = await stripe.checkout.sessions.create({
      customer: currentCustomer,
      payment_method_types: ['card'],
      mode: 'payment',
      success_url: `${config.app.url}/api/v1/payment/success?x-key=${
        config.app.queryToken
      }&user_session=${currentBooking.map(
        i => i._id
      )}&checkout_session={CHECKOUT_SESSION_ID}`,
      cancel_url: `${config.app.url}/api/v1/payment/failure?x-key=${config.app.queryToken}`,
      line_items: line_items,
      metadata: {
        redirectUriOnSuccess: req_session.redirectUriOnSuccess
      }
    })
    await Booking.updateMany(
      {
        _id: { $in: req_session.booking },
        user: user._id,
        isPaid: { $in: [UNPAID, PENDING] }
      },
      { isPaid: PENDING }
    )
    return { ok: true, data: session.url }
  },
  paymentSuccess: async (
    currentBookings: IBooking['_id'],
    checkoutSessionId: string
  ): Promise<IReturnResponse> => {
    if (!currentBookings || !checkoutSessionId)
      return { ok: false, message: 'Invalid request', status: 404 }

    const booking = currentBookings.split(',')
    const currentCheckoutSession = await stripe.checkout.sessions
      .retrieve(checkoutSessionId)
      .catch(_ => {
        return null
      })
    const redirectUriOnSuccess: string | undefined =
      currentCheckoutSession?.metadata?.redirectUriOnSuccess
    if (!currentCheckoutSession) {
      return {
        ok: false,
        status: 404,
        message: 'Checkout unrecognized'
      }
    }
    if (currentCheckoutSession.payment_status != 'paid') {
      return {
        ok: false,
        status: 400,
        message:
          'Payment not completed yet, something went wrong during payment please check',
        data: {}
      }
    }
    const paymentIntent = currentCheckoutSession?.payment_intent
    const paymentResult = await handleWalletPayment(booking, paymentIntent)
    return {
      ...paymentResult,
      data: { successData: paymentResult.data, redirectUriOnSuccess }
    }
  },
  paymentFailure: async (): Promise<IReturnResponse> => {
    return {
      ok: true,
      message: 'Session purchase failed or cancelled',
      data: 'FAILURE'
    }
  }
}

export default stripeServices

//generate payment intent

//save to wallet
const handleWalletPayment = async (
  booking: IBooking['_id'][],
  paymentIntent: string
): Promise<IReturnResponse> => {
  const currentBookings = await Booking.find({
    _id: { $in: booking },
    isPaid: PENDING
  })
    .populate('session')
    .select('session visited _id')

  if (!currentBookings.length)
    return {
      ok: false,
      message: 'Booking not found or expired',
      status: 400,
      data: {}
    }

  for (let currentBooking of currentBookings) {
    await addToWallet(
      currentBooking.session.trainer,
      currentBooking._id,
      calculateCharge([currentBooking], true).total,
      calculateCharge([currentBooking], true).details.transactionCharge
    )
  }
  await Booking.updateMany(
    { _id: { $in: currentBookings }, isPaid: [PENDING, UNPAID] },
    { isPaid: PAID, payment_id: paymentIntent, visited: true }
  )
  return {
    ok: true,
    message: 'Session purchased successfully',
    data: 'SUCCESS'
  }
}
