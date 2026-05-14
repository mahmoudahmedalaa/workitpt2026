export const successSession = {
  addSession: {
    msg: 'session create successfully.',
    status: 200
  },

  listSession: {
    msg: 'session list successfully.',
    status: 200
  },

  updateSession: {
    msg: 'session update successfully.',
    status: 200
  },

  deleteSession: {
    msg: 'session delete successfully.',
    status: 200
  },
  viewSession: {
    msg: 'session view successfully.',
    status: 200
  },
  checkSession: {
    msg: 'Session not found.',
    status: 400
  },

  overLapSession: {
    msg: 'Overlap with existing sessions. Cannot create a new session.',
    status: 400
  },

  locationRangeSession: {
    msg: 'Out of Location range to create Session ',
    status: 400
  },

  addBooking: {
    msg: 'booking create successfully.',
    status: 200
  },

  listBooking: {
    msg: 'booking list successfully.',
    status: 200
  },
  bookingAlready: {
    msg: 'you have already book.',
    status: 400
  },
  upcommingBookingList: {
    msg: 'Upcomming Booking list successfully.',
    status: 200
  }
}

export const SESSION_DIFFICULTY_LEVEL = [
  'Beginner',
  'Intermediate',
  'Advanced'
] as const

export const SESSION_TYPE = ['1-on-1', 'group'] as const

export const SESSION_DAY_OF_WEEK = [
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday'
] as const

export const SESSION_SELECT_TYPE = ['one_time', 'recurring'] as const

export const SESSION_LOCATION = ['Online', 'Gym', 'Outdoor', 'Home'] as const

export const SESSION_STATUS_ACTIVE = 'ACTIVE'
export const SESSION_STATUS_INACTIVE = 'INACTIVE'
