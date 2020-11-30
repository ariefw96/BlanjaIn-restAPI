const express = require('express')

const productsRouter = express.Router()

const productsController = require('../controllers/products')

//DELETE
productsRouter.delete("/delete", productsController.deleteProduct)

// SORT
productsRouter.get("/", productsController.sortProduct)

//get Products
productsRouter.get("/showAll", productsController.showAll)

module.exports = productsRouter