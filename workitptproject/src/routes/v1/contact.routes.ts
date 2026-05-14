import { postContactHandler } from '@controllers/contact.controller'
import { Router } from 'express'

const router = Router()

router.post('/', postContactHandler)

export default router
