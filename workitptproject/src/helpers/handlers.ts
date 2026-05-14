import { NextFunction, Request, Response } from 'express'
import { MulterError } from 'multer'
import config from '../config'

export interface IError extends Error {
  statusCode?: number
  fieldname?: string
}

export const notFoundHandlers = (
  req: Request,
  res: Response,
  next: NextFunction
): void => {
  const error: IError = new Error(`API path ${req.originalUrl} not found`)
  error.statusCode = 404
  next(error)
}

export const globalErrorHandlers = (
  error: IError,
  req: Request,
  res: Response,
  next: NextFunction
): void => {
  const { fieldname, statusCode, message, stack } = error
  const currentErr = { statusCode, message }
  if (error instanceof MulterError) {
    if (error.code === 'LIMIT_FILE_SIZE') {
      currentErr.statusCode = 400
      currentErr.message = `File must be lessthan ${config.upload.maxSize}MB`
    }
  }
  res.status(currentErr.statusCode || 500).json({
    ok: false,
    error: true,
    fieldname,
    message: currentErr.message || 'Server Error',
    stack: config.app.isDev ? stack : undefined
  })
  next()
}
