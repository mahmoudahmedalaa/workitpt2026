import express, { Express } from 'express'
import cors from 'cors'
import morgan from 'morgan'
import 'module-alias/register'
import config from '@config/index'
import v1Router from '@routes/index'
import db from '@config/db'
import { Server } from 'socket.io'
import { createServer } from 'http'
import { corsOption } from '@utils/cors'
import { authenticateSocketUser } from '@middlewares/socket.middleware'
import { socketService } from '@services/socket.services'
import { globalErrorHandlers, notFoundHandlers } from '@helpers/handlers'
import isoWeek from 'dayjs/plugin/isoWeek'
import isBetween from 'dayjs/plugin/isBetween'
import localizedFormat from 'dayjs/plugin/localizedFormat'
import relativeTime from 'dayjs/plugin/relativeTime'
import isSameOrBefore from 'dayjs/plugin/isSameOrBefore'
import utc from 'dayjs/plugin/utc'
import timezone from 'dayjs/plugin/timezone'
import dayjs from 'dayjs'
;[
  isoWeek,
  isBetween,
  localizedFormat,
  relativeTime,
  isSameOrBefore,
  utc,
  timezone
].forEach(plugin => dayjs.extend(plugin))

import './cronjobs/completeBooking.cron'
import './cronjobs/upcommingBooking.cron'

const app: Express = express()
const httpServer = createServer(app)

const PORT = config.app.port
const HOST = config.app.host
export const IO = new Server(httpServer, {
  cors: corsOption
})

app.use(express.static('public'))
app.use(morgan(config.app.morganLevel))

app.use(cors(corsOption))
app.use(express.json())
app.use('/api', v1Router)
app.use(notFoundHandlers)
app.use(globalErrorHandlers)
//socket connection
IO.use(authenticateSocketUser)
IO.use(socketService)

db.on('error', console.error.bind(console, 'MongoDB connection error:'))
db.on('close', () => {
  console.log('DB connection is close')
})
db.once('open', () => {
  console.log('Connected to MongoDB database!')
})

const server = httpServer.listen(PORT, () => {
  console.log(`⚡️[server]: Server is running at http://${HOST}:${PORT} 🚀`)
})

process.on('unhandledRejection', () => {
  console.log('UNHANDLED REJECTION! Shutting down...')
  server.close(() => {
    process.exit(1)
  })
})

process.on('uncaughtException', err => {
  console.log('ERROR: ', err)
  console.log('UNCAUGHT EXCEPTION! Shutting down...')
  process.exit(1)
})
