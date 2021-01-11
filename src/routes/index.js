const express = require('express');
const mainRouter = express.Router()

const welcomeRouter = require('./welcome')
const productsRouter = require('./r_products')
const productRouter = require('./r_product')
const authRouter = require('./r_auth')
const trxRouter = require('./r_trx')

const checkToken = require('./../helpers/checkToken')

//calling endpoint handler
mainRouter.use("/", welcomeRouter)
mainRouter.use("/products", productsRouter) // endpoint sort


//mau nyoba blocking akses CRUD product kalo bukan level seller
mainRouter.use("/product",productRouter) // endpoint insert, update


mainRouter.use("/products", productsRouter) // endpoint search and sort

mainRouter.use("/auth", authRouter) //endpoint auth
mainRouter.use("/transaction",checkToken.isLogin, trxRouter) //Trx


module.exports = mainRouter