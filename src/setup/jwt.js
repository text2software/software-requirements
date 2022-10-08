const jwt = require('jsonwebtoken')
require('dotenv').config()

const { SECRET } = process.env

const sign = payload => jwt.sign(payload, SECRET, { expiresIn: 86400 })

const verify = token => jwt.verify(token, SECRET)

module.exports = { sign, verify }