import asyncWrapper from '@utils/asyncWrapper'
import User from '@models/user.model'
import { experienceRangeEnum, specializationEnum } from '@models/trainer.model'
import { unlinkMedia } from '@helpers/unlink'
import { BANNED_STATUS, INACTIVE_STATUS } from '@constants/status.constant'

export const validateUpdate = asyncWrapper(async (req, _, next) => {
  const doc = { _id: req.user._id, trainerInfo: req.body.trainerInfo }
  if (doc?.trainerInfo) {
    if (doc?.trainerInfo?.experience) {
      if (!experienceRangeEnum.includes(doc.trainerInfo.experience)) {
        return next(
          new Error('Experience doesnot match from the given selection')
        )
      }
    }
    if (doc?.trainerInfo?.specialization) {
      const specializationValueExist = doc.trainerInfo.specialization.every(
        (val: string) => specializationEnum.includes(val)
      )
      if (!specializationValueExist) {
        return next(
          new Error('Specialization doesnot match from the given selection')
        )
      }
    }
    const currentImage = doc.trainerInfo?.images
    const currentCertification = doc.trainerInfo?.certification

    const prevData = await User.findOne({ _id: doc._id }).select('trainerInfo')

    const prevDetails = {
      prevStatus: prevData?.trainerInfo?.verificationStatus,
      prevBlockerDetail: prevData?.trainerInfo?.blockerDetails,
      prevCount: prevData?.trainerInfo?.attemptCount
    }
    const changedImages =
      prevData?.trainerInfo?.images?.filter(
        val => !currentImage?.includes(val)
      ) || []
    const changedCertification =
      prevData?.trainerInfo?.certification?.filter(
        val => !currentCertification?.includes(val)
      ) || []

    if (
      prevDetails['prevStatus'] === BANNED_STATUS ||
      prevDetails['prevStatus'] === INACTIVE_STATUS
    ) {
      if (prevDetails['prevBlockerDetail']) {
        prevDetails['prevCount'] += 1
        req.body.trainerInfo['attemptCount'] = prevDetails.prevCount
      }
    }
    for (let img of changedImages) {
      unlinkMedia(img)
    }
    for (let cerficiation of changedCertification) {
      unlinkMedia(cerficiation)
    }
  }

  next()
})
