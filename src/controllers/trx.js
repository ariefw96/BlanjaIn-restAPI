const trxModel = require('../models/trx')
const form = require ('../helpers/form')

module.exports = {
    addTrx: (req, res) => {
        const user_id = req.decodedToken.user_id
        let { body } = req
        body = {
            ...body,
            user_id
        }
        trxModel.addTrx(body)
        .then((result) => {
            form.success(res,result)
        }).catch((error) => {
            form.error(res, error)
        })

    },
    getTrx: (req, res) => {
        const user_id = req.decodedToken.user_id
        trxModel.getTrx(user_id)
        .then((result) => {
            form.success(res,{
                Title: `Daftar Transaksi`,
                ...result,
                
                
            })
        }).catch((error) => {
            form.error(res, error)
        })

    }
}