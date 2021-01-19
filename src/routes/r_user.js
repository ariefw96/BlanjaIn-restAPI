const express = require('express')
const userController = require('./../controllers/c_user')
const userRouter = express.Router()

userRouter.post("/addReview", userController.addReview)
userRouter.get("/getReview/:productId", userController.getReview)

module.exports = userRouter
