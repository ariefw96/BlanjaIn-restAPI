const getModel = require('../models/products')
const form = require('../helpers/form')
module.exports = {
  showAll:(req,res) => {
    getModel.allProduct()
    .then((data) => {
      form.success(res, data)
    }).catch((err) => {
      form.error(res, err)
    })
  },
  sortProduct: (req, res) => {
    const { sortBy, orderBy } = req.query;

    let addQuery = ``

    if (sortBy != null) {
      if (orderBy == `desc`) {
        addQuery += `ORDER BY  ${sortBy} DESC`
      }else{
        addQuery += `ORDER BY ${sortBy} ASC`
      }
    }

    getModel.sortProduct(addQuery)
      .then((data) => {
        form.success(res, data)
      })
      .catch((err) => {
        form.error(res, err)
      })
  },
  deleteProduct: (req, res) => {
    const { id } = req.query
    getModel.deleteProduct(id)
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
}