const express = require('express');
const mainRouter = express.Router()

const welcomeRouter = require('./welcome')
const productsRouter = require('./products')
const productRouter = require('./product')
const searchRouter = require('./search')
const authRouter = require('./auth')
const trxRouter = require('./trx')

const checkToken = require('./../helpers/checkToken')

//calling endpoint handler
mainRouter.use("/", welcomeRouter)
mainRouter.use("/products",checkToken.isLogin,checkToken.isSeller, productsRouter) // endpoint sort


//mau nyoba blocking akses CRUD product kalo bukan level seller
mainRouter.use("/product",checkToken.isLogin,checkToken.isSeller, productRouter) // endpoint insert, update


mainRouter.use("/search", searchRouter) // endpoint filter
mainRouter.use("/auth", authRouter) //endpoint auth
mainRouter.use("/transaction",checkToken.isLogin, trxRouter) //Trx


module.exports = mainRouter