import asyncWrapper from '@utils/asyncWrapper'
import userServices from '@services/user.services'
import { returnResponse } from '@utils/returnResponse'
import { CutomerAnalytics } from '@storage/customerAnalytics.storage'
import { TrainerAnalytics } from '@storage/trainerAnalytics.storage'

export const listTrainer = asyncWrapper(async (req, res) => {
  const page = req.query.page as string
  const limit = req.query.limit as string
  const pageNumber = parseInt(page) || 1
  const pageLimit = parseInt(limit) || 10
  //applied filters
  const specialization = req.query.specialization as string
  const rating = req.query.rating as string
  const location = req.query.location as string
  const priceMin = req.query.minPrice as string
  const priceMax = req.query.maxPrice as string
  const appliedFilters = {
    specialization: specialization,
    rating: rating,
    location: location,
    price: { min: priceMin, max: priceMax },
    search: typeof req.query.search === 'string' ? req.query.search : undefined
  }

  const returns = await userServices.listTrainer(
    pageNumber,
    pageLimit,
    req.user,
    appliedFilters
  )
  returnResponse(res, returns)
})

export const listTrainerDetails = asyncWrapper(async (req, res) => {
  const trainerId = req.params.id
  const returns = await userServices.listTrainerDetails(trainerId, req.user._id)
  returnResponse(res, returns)
})

export const listCustomer = asyncWrapper(async (req, res) => {
  const page = req.query.page as string
  const limit = req.query.limit as string
  const pageNumber = parseInt(page) || 1
  const pageLimit = parseInt(limit) || 10
  const sorting = req.query.sort as string
  const price = req.query.price as string
  const appliedFilters = {
    sort: sorting,
    price: price,
    search: typeof req.query.search === 'string' ? req.query.search : undefined
  }

  const returns = await userServices.listCustomer(
    req.user._id,
    pageNumber,
    pageLimit,
    appliedFilters
  )
  returnResponse(res, returns)
})
export const listCustomerDetails = asyncWrapper(async (req, res) => {
  const customerId = req.params.id
  const returns = await userServices.listCustomerDetails(
    req.user._id,
    customerId
  )
  returnResponse(res, returns)
})

export const listWeekDayPlan = asyncWrapper(async (req, res) => {
  const userId = req.user._id
  const returns = await userServices.listWeekDayPlan(userId)
  returnResponse(res, returns)
})

export const listActivity = asyncWrapper(async (req, res) => {
  const userId = req.user._id
  const returns = await userServices.listActivity(userId)
  returnResponse(res, returns)
})

export const getUserStreak = asyncWrapper(async (req, res) => {
  const userId = req.user._id
  const returns = await userServices.getUserStreakDates(userId)
  returnResponse(res, returns)
})

export const getUserAnalytics = asyncWrapper(async (req, res) => {
  const userId = req.user._id
  const role = req.user.role
  let returns
  switch (role) {
    case 'TRAINER':
      const trainer_analytics = new TrainerAnalytics(userId)
      returns = await userServices.getTrainerAnalytics(trainer_analytics)
      break
    case 'USER':
      const customer_analytics = new CutomerAnalytics(userId)
      returns = await userServices.getCustomerAnalytics(customer_analytics)
      break
    default:
      returns = {
        ok: false,
        status: 200,
        data: {},
        message: 'The User is neither a Trainer or a Customer.'
      }
  }
  returnResponse(res, returns)
})
