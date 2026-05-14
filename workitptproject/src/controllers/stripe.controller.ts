import asyncWrapper from '@utils/asyncWrapper'
import stripeServices from '@services/stripe.services'
import { returnResponse } from '@utils/returnResponse'

export const checkOutSession = asyncWrapper(async ({ body, user }, res) => {
  const checkoutUser = await stripeServices.createCheckoutSession(user, body)
  returnResponse(res, checkoutUser)
})

export const checkOutSessionWithCard = asyncWrapper(
  async ({ body, user }, res) => {
    const { cardId, booking } = body
    const checkoutUser = await stripeServices.chargeWithCard(user, cardId, {
      booking: booking
    })
    returnResponse(res, checkoutUser)
  }
)

export const listCard = asyncWrapper(async ({ user }, res) => {
  const cards = await stripeServices.listCard(user)
  returnResponse(res, cards)
})

export const saveCard = asyncWrapper(async ({ user, body }, res) => {
  const { card } = body
  const createCard = await stripeServices.saveCard(user, card)
  returnResponse(res, createCard)
})

export const deleteCard = asyncWrapper(async ({ body }, res) => {
  const { cardId } = body
  const detachCard = await stripeServices.deleteCard(cardId)
  returnResponse(res, detachCard)
})

export const successSession = asyncWrapper(async (req, res) => {
  const currentSession = req.query.user_session as string
  const checkoutSession = req.query.checkout_session as string
  const successRedirect = await stripeServices.paymentSuccess(
    currentSession,
    checkoutSession
  )
  const { redirectUriOnSuccess, successData } = successRedirect.data
  if (redirectUriOnSuccess) {
    return res.redirect(redirectUriOnSuccess)
  }
  returnResponse(res, { ...successRedirect, data: successData })
})

export const failureSession = asyncWrapper(async (_, res) => {
  const failureRedirect = await stripeServices.paymentFailure()
  returnResponse(res, failureRedirect)
})
