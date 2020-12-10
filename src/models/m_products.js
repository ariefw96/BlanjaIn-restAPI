const db = require('../config/mySQL')
module.exports = {
    allProduct:() => {
      return new Promise((resolve, reject) => {
        const queryString = `SELECT id, product_name FROM products`
        db.query(queryString, (err, data) => {
          if(!err){
            resolve(data)
          }else{
            reject(err)
          }
        })
      })
    },
    sortProduct: (addQuery,urlQuery, page, offset, limit) => {
      let newData;
        return new Promise((resolve, reject) => {
            let queryString = `SELECT m.id, m.product_id, p.product_name, c.category_name, pc.color_name, ps.size_name, pco.condition_name, p.product_price, p.product_desc, p.product_price, p.product_img, m.qty, m.created_at, m.updated_at 
            FROM master m JOIN products p ON m.product_id = p.id 
            JOIN category c ON p.category_id = c.id 
            JOIN color pc ON m.color_id = pc.id 
            JOIN size ps ON m.size_id = ps.id 
            JOIN conditions pco ON m.condition_id = pco.id 
            `+addQuery+
            ` LIMIT ? OFFSET ?`
            db.query(queryString, [limit, offset], (err, data) => {
              if (!err) {
                if(data.length){
                  newData = {
                    products: data,
                    pageInfo: {
                      currentPage: page || 1,
                      previousPage:
                        page === 1 ? null : `/products?${urlQuery}page=${page - 1}&limit=${limit}`,
                      nextpage: (offset+data.length) <= (offset+limit) //dia sudah pada result2 terakhir
                          ? null
                          : `/products?${urlQuery}page=${page + 1}&limit=${limit}`
                    }
                    
                  }
                  resolve(newData)
                }else{
                  reject({
                    status: 404,
                    msg: `Not Found`
                  })
                }

              } else {
                reject({
                  msg : `ERROR on SQL Query`
                })
              }
            })
          })
    }
}