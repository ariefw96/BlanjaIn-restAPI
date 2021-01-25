const express = require('express')
const db = require('../config/mySQL')

const productsRouter = express.Router()

const productsController = require('../controllers/c_products')

//sort search
productsRouter.get('/', productsController.SearchAndSort)

module.exports = productsRouter