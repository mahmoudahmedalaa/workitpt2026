import { IBooking } from '@models/booking.model'

interface ICalculatePrice {
  serviceCharge: number
  currentCost: number
  transactionCharge: number
}

export const calculateCharge = (
  booking: IBooking[],
  isTrainer?: boolean
): { total: number; details: ICalculatePrice } => {
  if (booking && !booking.length) return
  const totalPrice =
    booking?.map(i => i.session.price)?.reduce((i, sum) => i + sum) || 0
  const currentServiceCharge = parseFloat(((2.5 / 100) * totalPrice).toFixed(2))
  const appliedCharges: ICalculatePrice = {
    serviceCharge: currentServiceCharge > 20 ? 20 : currentServiceCharge,
    currentCost: totalPrice,
    transactionCharge: 0
  }
  switch (true) {
    case totalPrice < 3500:
      appliedCharges.transactionCharge = parseFloat(
        (totalPrice * (20 / 100)).toFixed(2)
      )
      break
    case totalPrice > 3500 && totalPrice < 7000:
      appliedCharges.transactionCharge = parseFloat(
        (totalPrice * (12 / 100)).toFixed(2)
      )
      break
    default:
      appliedCharges.transactionCharge = parseFloat(
        (totalPrice * (7 / 100)).toFixed(2)
      )
      break
  }
  const grandTotal = isTrainer
    ? parseFloat(
        (appliedCharges.currentCost - appliedCharges.transactionCharge).toFixed(
          2
        )
      )
    : appliedCharges.currentCost + appliedCharges.serviceCharge

  return {
    total: grandTotal,
    details: appliedCharges
  }
}
