export interface IReturnResponse {
  ok: boolean
  message?: string
  status?: number
  data?: any
  currentPage?: number
  totalPage?: number
  limit?: number
  total?: number
}

export type TReturnResponse<T> = {
  ok: boolean
  message?: string
  status?: number
  data?: T
  currentPage?: number
  totalPage?: number
  limit?: number
  total?: number
}
