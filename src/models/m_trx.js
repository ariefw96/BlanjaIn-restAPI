const db = require('../config/mySQL')
const bcrypt = require('bcrypt')
const jsonwebtoken = require('jsonwebtoken')

module.exports = {
    addTrx: (body) => {
        return new Promise((resolve, reject) => {
            const queryStr = `INSERT INTO history SET ?`
            db.query(queryStr, body, (err, data) => {
                if (!err) {
                    resolve({
                        msg: `Transaksi berhasil dilakukan`
                    })
                } else {
                    reject(err)
                }
            })
        })
    },
    getTrx: (user_id) => {
        return new Promise((resolve, reject) => {
            const queryStr = `SELECT trx.id as "trx_id", p.product_name, s.size_name, c.color_name, trx.product_qty, trx.created_at
            FROM history trx
            JOIN products p ON trx.product_name = p.id
            JOIN size s ON trx.product_size = s.id
            JOIN color c ON trx.product_color = c.id
            WHERE trx.user_id = ?`
            db.query(queryStr, user_id, (err, data) => {
                if (!err) {
                    resolve(data)
                } else {
                    reject(err)
                }
            })
        })
    }
}