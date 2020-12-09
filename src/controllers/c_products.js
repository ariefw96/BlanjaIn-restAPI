const getModel = require('../models/m_products')
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
    const { sortBy, orderBy } = req.query
    const {query} = req
    const limit = Number(query.limit) || 5 //jika tidak terdeklarasi limit otomatis 5
    const page = Number(query.page) || 1 //jika tidak terdeklarasi page otomatis 1
    const offset = (page - 1)*limit

    let addQuery = ``
    let urlQuery = ``

    if (sortBy != null) {
      if (orderBy == `desc`) {
        addQuery += `ORDER BY  ${sortBy} DESC`
        urlQuery = `sortBy=${sortBy}&orderBy=desc&`
      }else{
        addQuery += `ORDER BY ${sortBy} ASC`
        urlQuery = `sortBy=${sortBy}&orderBy=asc&`
      }
    }else{
      addQuery+= `ORDER BY created_at DESC`
    }

    getModel.sortProduct(addQuery,urlQuery, page, offset, limit)
      .then((data) => {
        form.success(res, data)
      })
      .catch((err) => {
        form.error(res, err)
      })
  }
}