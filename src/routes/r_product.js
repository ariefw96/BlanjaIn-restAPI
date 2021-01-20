const express = require('express')
const productRouter = express.Router()
const productController = require('../controllers/c_product')

const multiUpload = require('../helpers/uploadImg')

const checkToken = require('../helpers/checkToken')

//get by id - home card
productRouter.get('/:id', productController.getById)

//get All Product based User
productRouter.get('/user/:id', checkToken.isLogin, checkToken.isSeller, productController.getProductFromUser)
productRouter.get('/sell/user/:id', checkToken.isLogin, checkToken.isSeller, productController.getSellFromUser)
//add New Product
productRouter.post("/addProduct", checkToken.isLogin, checkToken.isSeller, multiUpload, productController.addNew)
//add from Existing Product
productRouter.post("/addStock", checkToken.isLogin, checkToken.isSeller, productController.addExisting)
//updateProd
productRouter.patch("/updateProduct/:id", checkToken.isLogin, checkToken.isSeller, multiUpload, productController.updateProd)
//update pivot
productRouter.patch("/updateStock/:id", checkToken.isLogin, checkToken.isSeller, productController.updateProduct)
//deleteProd
productRouter.delete("/deleteProd/:id", checkToken.isLogin, checkToken.isSeller, productController.deleteProd)
//delete Pivot
productRouter.delete("/deleteStock/:id", checkToken.isLogin, checkToken.isSeller, productController.deleteProduct)
//get Data Product
productRouter.get("/getProductData/:id", checkToken.isLogin, checkToken.isSeller, productController.getProductId)
//get Data Pivot
productRouter.get("/getStockData/:id", checkToken.isLogin, checkToken.isSeller, productController.getMasterId)
/


//getColor&Size in detailProduct
productRouter.get("/get_size/:id", productController.getSize)
productRouter.get("/get_color/:id", productController.getColor)

module.exports = productRouter