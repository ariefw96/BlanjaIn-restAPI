const productModel = require('../models/product')
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
        console.log(req.decodedToken)
        console.log(req.body) // why u do this to meh
        const insert_product = req.body
        productModel.addNew(insert_product)
            .then((data) => {
                form.success(res, data)
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
        const { id } = req.body
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
          res.json(output)
        })
        .catch((err) => {
          res.json(err);
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