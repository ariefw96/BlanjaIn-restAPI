const express = require('express')
const authController = require ('../controllers/c_auth')
const authRouter = express.Router()

const checkToken = require('../helpers/checkToken')

authRouter.post("/signup",checkToken.isRegistered, authController.signup)
authRouter.post("/login", authController.login)
authRouter.post("/logout",checkToken.isLogin, authController.logout)



module.exports = authRouter
