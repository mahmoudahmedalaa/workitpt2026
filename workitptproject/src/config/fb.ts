import FbAdmin from 'firebase-admin'
import * as services from '../../src/fbServices.json'

interface IServices {
  [key: string]: any
}

const notifcationService: IServices = services

const fb = FbAdmin.initializeApp({
  credential: FbAdmin.credential.cert(notifcationService)
})

export default fb
