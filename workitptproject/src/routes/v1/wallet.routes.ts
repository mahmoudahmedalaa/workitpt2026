import { verifyToken, hasRole } from '@middlewares/auth.middleware'
import { ADMIN_ROLE, TRAINER_ROLE } from '@constants/role.constant'
import { currentBalance, purchaseHistory } from '@controllers/wallet.controller'
import { Router } from 'express'

const walletRouter = Router()

walletRouter.use(verifyToken, hasRole([ADMIN_ROLE, TRAINER_ROLE]))
walletRouter.get('/balance', currentBalance)
walletRouter.get('/history', purchaseHistory)

export default walletRouter
