export const genRandomNumber = (digit = 6): number => {
  let random = 8848
  do {
    random = Math.floor(Math.random() * 10 ** digit)
  } while (random < 10 ** (digit - 1))
  return random
}

export const truncateLastTwoNumber = (num: string | number): number => {
  if (!num) return 0
  let n = num.toString().split('.')
  if (!n[1]) return Number(num)
  const integralPart = n[0]
  const fractionalPart = n[1].slice(0, 2)
  const combinedResult = `${integralPart}.${fractionalPart}`
  return Number(combinedResult)
}
