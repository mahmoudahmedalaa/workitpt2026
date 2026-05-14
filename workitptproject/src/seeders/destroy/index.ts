import db from '@config/db'
import { removeItems } from './destroy'

const destroyItems = async () => {
  await removeItems()
  console.log('Items destroyed successfully!!!')
  process.exit()
}

db.once('open', function () {
  destroyItems()
})
