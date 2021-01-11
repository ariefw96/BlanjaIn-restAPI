const express = require('express')
const db = require('../config/mySQL')

const productsRouter = express.Router()

const productsController = require('../controllers/c_products')

//sort search
productsRouter.get('/', productsController.SearchAndSort)

productsRouter.get('/alldata/:id',productsController.getAllData)

//get Product(from product)
productsRouter.get("/showAll/:id", productsController.showAll)


productsRouter.get("/allSize", productsController.getAllsize)



productsRouter.get('/all_prod/:id',(req, res) => {
    const {id} = req.params
    const get_all_prod = new Promise ((resolve, reject) => {
        const queryStr = `SELECT * FROM products WHERE user_id = ${id}`
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

productsRouter.get('/prodById/:id', (req, res) => {
    const {id} = req.params
    const get = new Promise ((resolve, reject) => {
        const queryStr = `SELECT product_name, product_img,product_price from products where id=${id}`
        db.query(queryStr,(err,data) => {
            if(!err){
                resolve(data)
            }else{
                reject(error)
            }
        })
    }).then((data) => {
        res.json(data)
    }).catch((error) => {
        res.json(error)
    })
})

productsRouter.get('/colorById/:id', (req, res) => {
    const {id} = req.params
    const get = new Promise ((resolve, reject) => {
        const queryStr = `select color_name from color where id=${id}`
        db.query(queryStr,(err,data) => {
            if(!err){
                resolve(data)
            }else{
                reject(err)
            }
        })
    }).then((data) => {
        res.json(data)
    }).catch((error) => {
        res.json(error)
    })
})

productsRouter.get('/sizeById/:id', (req, res) => {
    const {id} = req.params
    const get = new Promise ((resolve, reject) => {
        const queryStr = `select size_name from size where id=${id}`
        db.query(queryStr,(err,data) => {
            if(!err){
                resolve(data)
            }else{
                reject(err)
            }
        })
    }).then((data) => {
        res.json(data)
    }).catch((error) => {
        res.json(error)
    })
})

module.exports = productsRouter