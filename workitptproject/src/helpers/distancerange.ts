export const calculateHaversineDistance = (coord1: any, coord2: any) => {
  const R = 6371 // Earth radius in kilometers

  const dLat = toRadians(coord2.lat - coord1.lat)
  const dLon = toRadians(coord2.lon - coord1.lon)

  const a =
    Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos(toRadians(coord1.lat)) *
      Math.cos(toRadians(coord2.lat)) *
      Math.sin(dLon / 2) *
      Math.sin(dLon / 2)

  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))

  const distance = R * c // Distance in kilometers

  return distance
}

export const toRadians = (degrees: number) => {
  return degrees * (Math.PI / 180)
}
