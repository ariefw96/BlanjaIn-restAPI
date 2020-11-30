const express = require('express')
const productRouter = express.Router()
const db = require('../config/mySQL')

//get by id
productRouter.get('/:id', (req, res) => {
    const { id } = req.params
    const getById = new Promise((resolve, reject) => {
        const queryStr = "SELECT m.id, p.product_name, c.category_name, pc.color_name, ps.size_name, pco.condition_name, p.product_desc, p.product_img, m.qty, m.created_at, m.updated_at FROM master m JOIN products p ON m.product_id = p.id JOIN category c ON p.category_id = c.id JOIN color pc ON m.color_id = pc.id JOIN size ps ON m.size_id = ps.id JOIN conditions pco ON m.condition_id = pco.id WHERE m.id = ?"
        db.query(queryStr, id , (err, data) => {
            if (!err) {
                resolve(data)
            } else {
                reject(err)
            }
        })
    })
    getById.then(data => {
        res.json(data)
    })
    .catch((err) => {
        res.json(err)
    })
})

//post cant be modularized because rejection cant be handled inside the returned promise
//add New Product
productRouter.post("/add-product", (req, res) => {
    const insert_product = req.body
    const insertProduct = new Promise((resolve, reject) => {
        const queryStr = "INSERT INTO products SET ?"
        db.query(queryStr, insert_product, (err, data) => {
            if (!err) {
                resolve(
                    {
                        msg : `data berhasil di insert`
                    }
                )
            } else {
                reject(err)
            }
        })

    })
    insertProduct.then((result) => {
        res.json(result)
    }).catch((err) => {
        res.json(err)
    })
})

//add from Existing Product
productRouter.post("/add-stock", (req, res) => {
    const add_stock = req.body
    const addStock = new Promise((resolve, reject) => {
        const queryStr = "INSERT INTO master SET ?"
        db.query(queryStr, add_stock, (err, data) => {
            if(!err){
                resolve({
                    msg : `stock barang berhasil di update`
                })
            }else{
                reject(err)
            }
        })
    })
    addStock.then((result) => {
        res.json(result)
    }).catch((err) => {
        res.json(err)
    }) 
})

//update pivot
productRouter.patch("/update", (req, res) => {
    const { id } = req.body
    const { body } = req
    const updatePatch = {
        ...body,
        updated_at: new Date(Date.now())
    }
    const update = new Promise((resolve, reject) => {
        const queryStr = "UPDATE master SET ? WHERE id = ?"
        db.query(queryStr, [updatePatch, id], (err, data) => {
            if (!err) {
                resolve(updatePatch)
            } else {
                reject(err)
            }
        })
    })
    update.then((result) => {
        const output = {
            msg: `Data updated at id ${id}`,
            ...result,
        }
        res.json(output)
    }).catch((error) => {
        res.json(error)
    })

})

productRouter.get("/get_size/:id", (req,res) =>{
    const {id} = req.params
    const getSize = new Promise ((resolve, reject) => {
        const queryStr = `SELECT m.product_id, s.id, s.size_name FROM master m
                        JOIN size s ON m.size_id = s.id
                        WHERE m.product_id = ? GROUP BY s.size_name`
        db.query(queryStr, id, (err, data) => {
            if(!err){
                resolve(data)
            }else{
                reject(err)
            }
        })
    }).then((result) =>{
        res.json(result)
    }).catch((error) =>{
        res.json(error)
    })
})

productRouter.get("/get_color/:id", (req, res) => {
    const {id} = req.params
    const getColor = new Promise ((resolve, reject) => {
        const queryStr = `SELECT m.product_id,c.id, c.color_name FROM master m
                        JOIN color c ON m.color_id = c.id
                        WHERE m.product_id = ? GROUP BY c.color_name`
        db.query(queryStr, id, (err, data) => {
            if(!err){
                resolve(data)
            }else{
                reject(err)
            }
        })
    }).then((result) => {
        res.json(result)
    }).catch((error) => {
        res.json(error)
    })
})

productRouter.get("/get_max_qty/:id", (req, res) => {
    const {id} = req.params
    const getMaxQty = new Promise ((resolve, reject) => {
        const queryStr = `SELECT MAX(qty) FROM master WHERE product_id = ?`
        db.query(queryStr, id, (err, data) => {
            if(!err){
                resolve(data)
            }else{
                reject(err)
            }
        })
    }).then((result) => {
        res.json(result)
    }).catch((error) => {
        res.json(error)
    })
})

module.exports = productRouter