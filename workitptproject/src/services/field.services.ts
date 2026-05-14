import { IReturnResponse } from '@interfaces/response'
import { specializationEnum, experienceRangeEnum } from '@models/trainer.model'

const fieldServices = {
  enumFields: async (): Promise<IReturnResponse> => {
    return {
      ok: true,
      data: {
        specialization: specializationEnum,
        experience: experienceRangeEnum
      }
    }
  }
}

export default fieldServices
