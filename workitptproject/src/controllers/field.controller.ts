import asyncWrapper from '@utils/asyncWrapper'
import { returnResponse } from '@utils/returnResponse'
import fieldServices from '@services/field.services'

export const enumFields = asyncWrapper(async (req, res) => {
  const returns = await fieldServices.enumFields()
  returnResponse(res, returns)
})
