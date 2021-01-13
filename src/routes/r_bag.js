const express = require('express')
const bagRouter = express.Router()
const bagController = require ('./../controllers/c_bag')

bagRouter.post('/add', bagController.postNewItems)
bagRouter.get('/getFromUser/:id' , bagController.getData)
bagRouter.delete('/delete/:id', bagController.deleteItems)

module.exports = bagRouter
