const express = require('express');
const mainRouter = express.Router()

const welcomeRouter = require('./welcome')
const productsRouter = require('./products')
const productRouter = require('./product')
const searchRouter = require('./search')
const authRouter = require('./auth')
// const historyRouter = require("./history")

const checkToken = require('./../helpers/checkToken')



//calling endpoint handler
mainRouter.use("/", welcomeRouter)
mainRouter.use("/products",checkToken, productsRouter) // endpoint sort, delete
mainRouter.use("/product", productRouter) // endpoint insert, update
mainRouter.use("/search", searchRouter) // endpoint filter
mainRouter.use("/auth", authRouter) //endpoint auth
// mainRouter.use("/history", historyRouter)


module.exports = mainRouter