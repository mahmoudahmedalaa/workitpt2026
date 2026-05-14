import config from '@config/index'
import mailService from './mail.services'
import { CONTACT_US_SUBJECT } from '@constants/mail.constant'
import { TReturnResponse } from '@interfaces/response'

type TContactPayload = {
  email: string
  fullname: string
  message: string
}
const contactService = {
  /**
   * Asynchronously creates a contact with the given payload.
   *
   * @param {TContactPayload} payload - the contact payload
   * @return {Promise<TReturnResponse<null>>} a promise with null return response
   */
  createContact: async (
    payload: TContactPayload
  ): Promise<TReturnResponse<null>> => {
    const contactHtml = `<p>From: ${payload.email}</p>
    <p>Name: ${payload.fullname}</p>
    <p>Message: ${payload.message}</p>`
    await mailService.sendMailManually(
      [config.mail.receiver],
      CONTACT_US_SUBJECT,
      contactHtml
    )
    return {
      ok: true,
      status: 200,
      message: 'Mail send successfully'
    }
  }
}

export default contactService
