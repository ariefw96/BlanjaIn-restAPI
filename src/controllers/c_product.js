const productModel = require('../models/m_product')
const form = require('../helpers/form')

module.exports = {
    getById: (req, res) => {
        const { id } = req.params
        productModel.getById(id)
            .then((data) => {
                form.success(res, data)
            })
            .catch((err) => {
                form.error(res, err)
            })
    },
    addNew: (req, res) => {
        let Product_inserted;
        let insert_product = req.body
        if (req.filePath != '') {
            insert_product = {
                ...insert_product,
                product_img: req.filePath
            }
            const res_img = req.filePath.split(",")
            Product_inserted = {
                ...insert_product,
                product_img: res_img
            }
        }
        Product_inserted = insert_product
        productModel.addNew(insert_product)
            .then((data) => {
                form.success(res, {
                    ...data,
                    Product_inserted
                })
            }).catch((err) => {
                form.error(res, err)
            })
    },
    addExisting: (req, res) => {
        const add_stock = req.body
        productModel.addExisting(add_stock)
            .then((data) => {
                form.success(res, data)
            }).catch((err) => {
                form.error(res, err)
            })
    },
    updateProd: (req, res) => {
        const { id } = req.params
        let { body } = req
        if(req.filePath != ''){
            body = {
                ...body,
                product_img: req.filePath
            }
        }
        productModel.updateProd(body, id)
        .then((result) => {
            res.status(200).json(result)
        }).catch((error) => {
            res.status(500).json(error)
        })
    },
    updateProduct: (req, res) => {
        const { id } = req.params //update ID at req.params
        const { body } = req
        const updatePatch = {
            ...body,
            updated_at: new Date(Date.now())
        }
        productModel.updateProduct(id, updatePatch)
            .then((result) => {
                const output = {
                    msg: `Data updated at id ${id}`,
                    ...result,
                }
                res.json(output)
            }).catch((err) => {
                res.json(err)
            })
    },
    deleteProduct: (req, res) => {
        const { id } = req.params
        productModel.deleteProduct(id)
            .then((data) => {
                const output = {
                    deletedId: id,
                    msg: data
                }
                form.success(res, output)
            })
            .catch((err) => {
                form.error(res, err)
            })
    },
    getSize: (req, res) => {
        const { id } = req.params
        productModel.getSize(id).then((data) => {
            form.success(res, data)
        }).catch((err) => {
            form.error(res, err)
        })
    },
    getColor: (req, res) => {
        const { id } = req.params
        productModel.getColor(id).then((data) => {
            form.success(res, data)
        }).catch((err) => {
            form.error(res, err)
        })
    }
}