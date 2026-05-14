import { Router } from 'express'
import { removeItems } from '@seeders/destroy/destroy'
import { seedUsers } from '@seeders/users'
const testRouter = Router()

testRouter.delete('/wipe/db', async (req, res) => {
  const password = req.query.password
  if (password !== 'hello123') {
    res.json({
      ok: false,
      message: 'invalid',
      data: {}
    })
    return
  }
  await removeItems()
  res.json({
    ok: true,
    message: 'database cleared'
  })
})

testRouter.post('/seed/db', async (req, res) => {
  const password = req.query.password
  if (password !== 'hello123') {
    res.json({
      ok: false,
      message: 'invalid',
      data: {}
    })
    return
  }
  await seedUsers()
  res.json({
    ok: true,
    message: 'users seeded'
  })
})

export default testRouter
