const express = require('express');
const mainRouter = express.Router()

const welcomeRouter = require('./welcome')
const productsRouter = require('./products')
const productRouter = require('./product')
const searchRouter = require('./search')
// const historyRouter = require("./history")

//calling endpoint handler
mainRouter.use("/", welcomeRouter)
mainRouter.use("/products", productsRouter) // endpoint sort, delete
mainRouter.use("/product", productRouter) // endpoint insert, update
mainRouter.use("/search", searchRouter) // endpoint filter
// mainRouter.use("/history", historyRouter)


module.exports = mainRouter