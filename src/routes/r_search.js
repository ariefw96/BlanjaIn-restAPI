const express = require('express')

const searchRouter = express.Router()

const searchController = require('../controllers/c_search')

searchRouter.get('/', searchController.searchBy)

module.exports = searchRouter