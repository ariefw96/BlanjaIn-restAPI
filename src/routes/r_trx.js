const express = require('express')
const transactionController = require ('../controllers/c_trx')
const transactionRouter = express.Router()

transactionRouter.post("/", transactionController.addTrx)
transactionRouter.post("/itemOrder", transactionController.addMultiple)
// transactionRouter.get("/:userId", transactionController.getTrx)
transactionRouter.get("/myTransaction/:userId", transactionController.getMyTrans)
transactionRouter.get("/getOrderDetail/:trxId", transactionController.getOrderDetails)
transactionRouter.get("/trx/:trxId", transactionController.getItemsTrx)

module.exports = transactionRouter
