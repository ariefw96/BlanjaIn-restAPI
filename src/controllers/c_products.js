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
  }
}