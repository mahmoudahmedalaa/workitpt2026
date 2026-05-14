import Session from '@models/session.models'
import mongoose from 'mongoose'
// import mongoose from 'mongoose'

export const getTrainerAverageSessionPrice = async (
  trainerId: string
): Promise<number> => {
  const averagePrice = await Session.aggregate([
    {
      $match: {
        trainer: new mongoose.Types.ObjectId(trainerId)
      }
    },
    {
      $group: {
        _id: '$trainer',
        average: { $avg: '$price' }
      }
    }
  ])
  return +averagePrice[0]?.average?.toFixed(2)
}

export const getTrainerAverageSessionRating = async (trainerId: string) => {
  const averageRating = await Session.aggregate([
    {
      $match: {
        trainer: new mongoose.Types.ObjectId(trainerId)
      }
    },
    {
      $group: {
        _id: '$trainer',
        average: {
          $avg: '$rating'
        }
      }
    }
  ])
  return +averageRating[0]?.average?.toFixed(2)
}
