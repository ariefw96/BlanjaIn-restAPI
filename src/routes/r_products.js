const express = require('express')

const productsRouter = express.Router()

const productsController = require('../controllers/c_products')

// SORT
productsRouter.get("/", productsController.sortProduct)

//get Product(from product)
productsRouter.get("/showAll", productsController.showAll)

module.exports = productsRouter