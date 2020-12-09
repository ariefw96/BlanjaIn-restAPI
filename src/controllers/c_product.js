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
        let insert_product = req.body
        insert_product = {
            ...insert_product,
            product_img: req.filePath
        }

        const res_img = req.filePath.split(",")
        const Product_inserted = {
            ...insert_product,
            product_img:res_img
        }
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