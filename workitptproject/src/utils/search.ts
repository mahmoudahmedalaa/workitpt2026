export const buildSearchByMultipleFields = (
  fields: string[],
  value: string
) => {
  const regex = new RegExp(value, 'i')
  return fields.map(field => ({ [field]: regex }))
}
