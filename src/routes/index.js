const express = require('express');
const mainRouter = express.Router()

const welcomeRouter = require('./welcome')
const productsRouter = require('./r_products')
const productRouter = require('./r_product')
const authRouter = require('./r_auth')
const trxRouter = require('./r_trx')
const addressRouter = require ('./r_address')
const userRouter = require ('./r_user')
const kurirRouter = require ('./r_kurir')
const chatRouter = require ('./r_chat')
const notifRouter = require('./r_notif')

//calling endpoint handler
mainRouter.use("/", welcomeRouter)
mainRouter.use("/products", productsRouter) // endpoint sort


//mau nyoba blocking akses CRUD product kalo bukan level seller
mainRouter.use("/product",productRouter) // endpoint insert, update


mainRouter.use("/products", productsRouter) // endpoint search and sort
mainRouter.use("/address", addressRouter)
mainRouter.use("/auth", authRouter) //endpoint auth
mainRouter.use("/transaksi", trxRouter) //Trx
mainRouter.use("/user", userRouter)
mainRouter.use("/kurir", kurirRouter)
mainRouter.use('/chat', chatRouter)
mainRouter.use('/notif', notifRouter)


module.exports = mainRouter