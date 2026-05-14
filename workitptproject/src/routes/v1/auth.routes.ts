import { Router } from 'express'
import {
  login,
  register,
  profile,
  //test only
  deleteUser,
  //
  updateProfile,
  removeImages,
  credManager,
  verificationRequest,
  verifyUser,
  forgotPasswordRequest,
  forgotPasswordTokenRequest,
  changeForgotPassword,
  changePassword,
  deleteAccount
} from '@controllers/auth.controller'
import { verifyToken, verifyTokenOnly } from '@middlewares/auth.middleware'
import { validateUpdate } from '@middlewares/update.middleware'

const authRouter = Router()

authRouter.post('/login', login)
authRouter.post('/register', register)
authRouter.delete('/user/remove/:userId', deleteUser)

authRouter.post('/verification', verifyTokenOnly, verificationRequest)
authRouter.post('/verify', verifyTokenOnly, verifyUser)

authRouter.post('/forgot-password', forgotPasswordRequest)
authRouter.post('/forgot-password/token', forgotPasswordTokenRequest)
authRouter.post('/forgot-password/change', changeForgotPassword)
authRouter.patch('/change-password', verifyTokenOnly, changePassword)

authRouter.get('/profile', verifyTokenOnly, profile)

authRouter.patch('/profile', verifyTokenOnly, validateUpdate, updateProfile)
authRouter.delete('/profile/images', verifyTokenOnly, removeImages)
authRouter.patch('/profile/update-cred', verifyTokenOnly, credManager)

authRouter.delete('/delete-account', verifyToken, deleteAccount)

export default authRouter
