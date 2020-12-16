const express = require('express')
const db = require('../config/mySQL')

const productsRouter = express.Router()

const productsController = require('../controllers/c_products')

//sort search
productsRouter.get('/', productsController.SearchAndSort)

//get Product(from product)
productsRouter.get("/showAll", productsController.showAll)


productsRouter.get("/allSize", productsController.getAllsize)



productsRouter.get('/all_prod',(req, res) => {
    const get_all_prod = new Promise ((resolve, reject) => {
        const queryStr = `SELECT * FROM products`
        db.query(queryStr, (err, data) => {
            if(!err){
                resolve(data)
            }else{
                reject(err)
            }
        })
    }).then((result) => {
        res.json(result)
    }).catch((error) => {
        console.log(error)
    })
})

productsRouter.get('/all_color',(req, res) => {
    const get_all_prod = new Promise ((resolve, reject) => {
        const queryStr = `SELECT * FROM color`
        db.query(queryStr, (err, data) => {
            if(!err){
                resolve(data)
            }else{
                reject(err)
            }
        })
    }).then((result) => {
        res.json(result)
    }).catch((error) => {
        console.log(error)
    })
})

productsRouter.get('/all_size',(req, res) => {
    const get_all_prod = new Promise ((resolve, reject) => {
        const queryStr = `SELECT * FROM size`
        db.query(queryStr, (err, data) => {
            if(!err){
                resolve(data)
            }else{
                reject(err)
            }
        })
    }).then((result) => {
        res.json(result)
    }).catch((error) => {
        console.log(error)
    })
})

productsRouter.get('/all_cond',(req, res) => {
    const get_all_prod = new Promise ((resolve, reject) => {
        const queryStr = `SELECT * FROM conditions`
        db.query(queryStr, (err, data) => {
            if(!err){
                resolve(data)
            }else{
                reject(err)
            }
        })
    }).then((result) => {
        res.json(result)
    }).catch((error) => {
        console.log(error)
    })
})

productsRouter.get('/all_ctg', (req,res) => {
    const get_Cat = new Promise (( resolve, reject ) => {
        const queryStr = 'SELECT * FROM category'
        db.query(queryStr, (err, data) => {
            if(!err){
                resolve(data)
            }else{
                reject(err)
            }
        })
    }).then((result) => {
        res.json(result)
    }).catch((error) => {
        console.log(error)
    })
})
module.exports = productsRouter