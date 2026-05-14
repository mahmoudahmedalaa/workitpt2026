import {
  SESSION_DAY_OF_WEEK,
  SESSION_DIFFICULTY_LEVEL,
  SESSION_SELECT_TYPE,
  SESSION_TYPE
} from '@constants/session.contant'

export type SessionDificultyLevel = (typeof SESSION_DIFFICULTY_LEVEL)[number]
export type SessionType = (typeof SESSION_TYPE)[number]
export type SessionDayOfWeek = (typeof SESSION_DAY_OF_WEEK)[number]
export type SessionSelectType = (typeof SESSION_SELECT_TYPE)[number]
