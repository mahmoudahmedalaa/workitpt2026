import config from '.'
import Stripe from 'stripe'

const stripe = new Stripe(config.stripe.secret_key)

export default stripe
