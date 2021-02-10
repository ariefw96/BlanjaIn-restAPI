const express = require('express')
const addressRouter = express.Router()
const addressController = require('./../controllers/c_address')

const checkToken = require('../helpers/checkToken')

addressRouter.get("/", checkToken.isLogin, addressController.getAddress)
addressRouter.post("/new",checkToken.isLogin, addressController.addAddress)
addressRouter.patch("/update/:id", checkToken.isLogin, addressController.changeAddress )
addressRouter.get("/get/:id",checkToken.isLogin, addressController.getAddressId)
addressRouter.delete("/delete/:id",checkToken.isLogin, addressController.deleteAdress)

module.exports = addressRouter
 