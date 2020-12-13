const express = require('express')
const productRouter = express.Router()
const productController = require('../controllers/c_product')

const multiUpload = require ('../helpers/uploadImg')

//get by id
productRouter.get('/:id', productController.getById )

const checkToken = require('../helpers/checkToken')
//add New Product
productRouter.post("/add-product",checkToken.isSeller, multiUpload, productController.addNew)
//add from Existing Product
productRouter.post("/add-stock",checkToken.isSeller, productController.addExisting) 
//updateProd
productRouter.patch("/updateProd/:id",checkToken.isSeller,multiUpload, productController.updateProd)
//update pivot
productRouter.patch("/update/:id",checkToken.isSeller, productController.updateProduct)
//delete
productRouter.delete("/delete/:id",checkToken.isSeller, productController.deleteProduct)



//getColor&Size in detailProduct
productRouter.get("/get_size/:id", productController.getSize)
productRouter.get("/get_color/:id", productController.getColor)

module.exports = productRouter