import FbAdmin from 'firebase-admin'

const { FIREBASE_PROJECT_ID, FIREBASE_CLIENT_EMAIL, FIREBASE_PRIVATE_KEY } =
  process.env

const privateKey = FIREBASE_PRIVATE_KEY?.replace(/\\n/g, '\n')

const credential =
  FIREBASE_PROJECT_ID && FIREBASE_CLIENT_EMAIL && privateKey
    ? FbAdmin.credential.cert({
        projectId: FIREBASE_PROJECT_ID,
        clientEmail: FIREBASE_CLIENT_EMAIL,
        privateKey
      })
    : undefined

const fb = FbAdmin.apps.length
  ? FbAdmin.app()
  : FbAdmin.initializeApp({
      ...(credential ? { credential } : {})
    })

if (!credential && process.env.NODE_ENV === 'production') {
  throw new Error(
    'Firebase Admin credentials are required in production. Set FIREBASE_PROJECT_ID, FIREBASE_CLIENT_EMAIL, and FIREBASE_PRIVATE_KEY.'
  )
}

export default fb
