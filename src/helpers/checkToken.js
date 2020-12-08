const jsonwebtoken = require('jsonwebtoken')
const db = require('../config/mySQL')
const form = require('./form')


module.exports = {
    isLogin: (req, res, next) => {
        const bearerToken = req.header("x-access-token");
        //jika tidak ada header x-access-token
        console.log('disini cek token')
        if (!bearerToken) {
            console.log('token kosong')
            res.json({
                msg: `Please login first`,
                status: 401 //unauthorized access
            })
        } else {
            const token = bearerToken.split(" ")[1]
            const checkBlacklist = new Promise((resolve, reject) => {
                const queryStr = `SELECT token FROM blacklist_token WHERE token = ?`
                db.query(queryStr, token, (err, data) => {
                    if (!err) {
                        if (!data[0]) {
                            resolve(token)
                        } else {
                            console.log('token blacklisted')
                            reject({
                                msg: `Invalid token => ${data[0].token}, cannot user anymore. Already logout`
                            })
                        }
                    } else {
                        reject({
                            msg: `check Token ERROR!`
                        })
                    }
                })
            }).then((result) => {
                //cek decodedToken apakah cocok
                console.log('token jwt.verify')
                try {
                    decodedToken = jsonwebtoken.verify(result, process.env.SECRET_KEY)
                    //asign decodedToken to req
                    req.decodedToken = decodedToken
                    next() //meneruskan ke proses selanjutnya
                } catch (err) {
                    res.json({
                        msg: `Token invalid, wrong SECRET_KEY`
                    })
                }
            }).catch((error) => {
                res.json(error)
            })
        }
    },
    isSeller: (req, res, next) => {
        const { level } = req.decodedToken
        if (level != 2) {
            console.log(`True`)
            form.error(res,
                {
                    status: 401,
                    msg: `Unauthorized Access`,
                    details: `Yout dont have permission to access this page.`
                }
            )
        } else {
            console.log(`False`)
            next()
        }
    }
}
