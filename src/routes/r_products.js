const express = require('express')

const productsRouter = express.Router()

const productsController = require('../controllers/c_products')

//sort search
productsRouter.get('/', productsController.SearchAndSort)

//get Product(from product)
productsRouter.get("/showAll", productsController.showAll)

module.exports = productsRouter