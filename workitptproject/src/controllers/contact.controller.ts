import contactService from '@services/contact.services'
import asyncWrapper from '@utils/asyncWrapper'
import { returnResponse } from '@utils/returnResponse'

export const postContactHandler = asyncWrapper(async (req, res) => {
  const { email, fullname, message } = req.body
  const returns = await contactService.createContact({
    email,
    fullname,
    message
  })
  returnResponse(res, returns)
})
