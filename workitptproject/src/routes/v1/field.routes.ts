import { Router } from 'express'
import { enumFields } from '@controllers/field.controller'

const fieldRouter = Router()

fieldRouter.get('/enums', enumFields)

export default fieldRouter
