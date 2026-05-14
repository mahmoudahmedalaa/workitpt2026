import User from '@models/user.model'
import axios from 'axios'
import bcrypt from 'bcryptjs'
import config from '@config/index'
import crypto from 'crypto'
import { TRAINER_ROLE, USER_ROLE } from '@constants/role.constant'
import { CREDENTIALS_PROVIDER } from '@constants/provider.constant'
import { decode, verify, GetPublicKeyOrSecret } from 'jsonwebtoken'
import jwksClient from 'jwks-rsa'
import { IDecodedToken } from '@utils/jwt'

export const getCredentialsUser = async (email: string, password: string) => {
  const user = await User.findOne({ email })
    .select('email password userSecret authProvider')
    .lean()

  if (!user) {
    const err = new Error()
    err.name = 'user'
    err.message = 'User not found'
    throw err
  }
  if (user && user.authProvider && user.authProvider !== CREDENTIALS_PROVIDER) {
    const err = new Error()
    err.name = 'user'
    err.message = `Login with ${user?.authProvider?.toLowerCase()} to continue`
    throw err
  }
  const isValid = bcrypt.compareSync(password, user?.password)
  if (!isValid) {
    {
      const err = new Error()
      err.name = 'user'
      err.message = 'Email or password is invalid'
      throw err
    }
  }
  delete user['password']
  return { ...user }
}

export async function getGoogleUser(accessToken: string) {
  const {
    data: { name, email, sub, picture }
  } = await axios({
    method: 'GET',
    url: config.google.apiUrl,
    headers: {
      Authorization: `Bearer ${accessToken}`
    }
  })

  const firstName = name?.split(' ')[0] || name
  const lastName = name?.split(' ')[1] || ''
  const password = bcrypt.hashSync(crypto.randomBytes(32).toString('hex'), 10)

  return {
    firstName,
    lastName,
    email,
    password,
    authProvider: 'GOOGLE',
    authProviderId: sub,
    avatar: picture
  }
}

export async function getFacebookUser(accessToken: string) {
  const {
    data: { name, email, id, picture }
  } = await axios({
    url: config.facebook.graphUrl,
    method: 'GET',
    params: {
      fields: 'id,email,name,picture.type(large)',
      access_token: accessToken
    }
  })

  const firstName = name?.split(' ')[0] || name
  const lastName = name?.split(' ')[1] || ''
  const password = bcrypt.hashSync(crypto.randomBytes(32).toString('hex'), 10)

  return {
    firstName,
    lastName,
    email,
    password,
    authProvider: 'FACEBOOK',
    authProviderId: id,
    avatar: picture?.data?.url
  }
}

export async function getAppleUser(accessToken: string) {
  const decodedUser = decode(accessToken, { complete: true })
  const clientPublicKey = (await getPublicKey(
    decodedUser?.header?.kid
  )) as unknown as GetPublicKeyOrSecret

  const verifyUser = verify(
    accessToken,
    clientPublicKey
  ) as unknown as IDecodedToken

  return {
    email: verifyUser.email,
    authProvider: 'APPLE',
    authProviderId: verifyUser.sub
  }
}

export const contactSelector = (role: string) => {
  switch (role) {
    case TRAINER_ROLE:
      return '+trainerInfo.contactNumber'
    case USER_ROLE:
      return '+customerInfo.contactNumber'
    default:
      return ''
  }
}

const getPublicKey = async (kid: string) => {
  const client = jwksClient({
    jwksUri: 'https://appleid.apple.com/auth/keys'
  })
  const publicKey = new Promise((resolve, reject) => {
    try {
      client.getSigningKey(kid, async (err, key) => {
        if (err) throw new Error(err?.message || 'Error getting user')
        resolve(key.getPublicKey())
      })
    } catch (err) {
      reject(err)
    }
  })
  return publicKey
}
