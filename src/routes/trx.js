const express = require('express')
const transactionController = require ('../controllers/trx')
const transactionRouter = express.Router()

transactionRouter.post("/", transactionController.addTrx)
transactionRouter.get("/", transactionController.getTrx)

module.exports = transactionRouter
