import * as dotenv from 'dotenv'

dotenv.config()

const config = {
  app: {
    name: process.env.APP_NAME,
    queryToken: process.env.QUERY_TOKEN,
    headerToken: process.env.HEADER_TOKEN,
    env: process.env.NODE_ENV || 'development',
    url: process.env.APP_URL || 'http://localhost:8000',
    successRedirectUrl:
      process.env.REDIRECT_SUCCESS_URL ||
      'http://localhost:3000/user/dashboard/bookings/receipt/:bookingId',
    host: process.env.APP_HOST || 'localhost',
    port: process.env.APP_PORT || 8000,
    isDev: process.env.NODE_ENV === 'development',
    isProd: process.env.NODE_ENV === 'production',
    originRegex: process.env.ORIGIN_REGEX,
    allowedOrigins: process.env.ALLOWED_ORIGIN,
    morganLevel: process.env.MORGAN_LEVEL || 'dev',
    appStoreIconURL: process.env.APP_STORE_ICON_URL,
    playStoreIconURL: process.env.PLAYSTORE_ICON_URL,
    appStoreURL: process.env.APP_STORE_URL,
    playStoreURL: process.env.PLAYSTORE_URL,
    logoURL: process.env.LOGO_URL
  },
  upload: {
    maxSize: process.env.MAX_IMG_SIZE || '2'
  },
  stripe: {
    public_key: process.env.STRIPE_PUBLIC_KEY,
    secret_key: process.env.STRIPE_SECRET_KEY,
    service_charge: process.env.SERVICE_CHARGE,
    lt3500: process.env.LESSTHAN_3500,
    bt3500_7500: process.env.BETWEEN_3500_75000,
    bt7500_10500: process.env.BETWEEN_7500_10500,
    over_10500: process.env.OVER_10500
  },
  mail: {
    user: process.env.MAIL_USER,
    pass: process.env.MAIL_PASS,

    host: process.env.MAIL_HOST,
    port: process.env.MAIL_PORT,

    token_ttl: Number(process.env.MAIL_TOKEN_TTL),
    from: process.env.MAIL_FROM,

    debug: process.env.MAIL_DEBUG === 'true' || false,
    log: process.env.MAIL_LOG === 'true' || false,
    receiver: process.env.MAIL_RECEIVER
  },
  db: {
    mongo_uri: process.env.MONGO_URI,
    strictDB: Boolean(process.env.MONGO_STRICT_DB) || false
  },
  facebook: {
    app_id: process.env.FACEBOOK_APP_ID,
    app_secret: process.env.FACEBOOK_APP_SECRET,
    redirect_uri: process.env.FACEBOOK_REDIRECT_URI,
    base_uri: process.env.FACEBOOK_BASE_URI,
    graphUrl:
      process.env.FACEBOOK_GRAPH_URL || 'https://graph.facebook.com/v13.0/me'
  },
  google: {
    app_id: process.env.GOOGLE_APP_ID,
    app_secret: process.env.GOOGLE_APP_SECRET,
    redirect_uri: process.env.GOOGLE_REDIRECT_URI,
    oauth_base_uri: process.env.GOOGLE_BASE_URI,
    api_version: process.env.GOOGLE_API_VERSION,
    apiUrl:
      process.env.GOOGLE_API_URL ??
      'https://www.googleapis.com/oauth2/v3/userinfo'
  },
  jwt: {
    secretAccess: process.env.JWT_ACCESS_SECRET,
    issuer: process.env.JWT_ISSUER,
    token_access_ttl: process.env.JWT_ACCESS_EXPIRY || '1d'
  },
  firebase: {
    notiTtl: process.env.NOTIFICATION_TTL || 24,
    notiPriority: process.env.NOTIFICATION_PRIORITY || 'high',
    notiSound: process.env.NOTIFICATION_SOUND || 'default',
    notiBadge: process.env.NOTIFICATION_BADGE || '1'
  }
}
export default config
