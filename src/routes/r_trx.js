const express = require('express')
const transactionController = require ('../controllers/c_trx')
const transactionRouter = express.Router()

transactionRouter.post("/", transactionController.addTrx)
transactionRouter.get("/", transactionController.getTrx)

module.exports = transactionRouter
