import { Socket } from 'socket.io'
import { initializeChat } from './chat/chat.services'

export const socketService = async (
  socket: Socket,
  next: (error?: Error) => void
) => {
  console.log('Socket initialized')
  await initializeChat(socket, next)
  next()
}
