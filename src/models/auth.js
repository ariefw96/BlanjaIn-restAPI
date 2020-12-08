const db = require('../config/mySQL')
const bcrypt = require('bcrypt')
const jsonwebtoken = require('jsonwebtoken')

module.exports = {
    postNewUser: (body) => {
        return new Promise((resolve, reject) => {
            const saltRounds = Math.floor(Math.random() * 10)+1
            //hashPw
            bcrypt.hash(body.password, saltRounds, (err, hashedPassword) => {
                //generate newBody from newPw
                const newUser = { ...body, password: hashedPassword }
                const queryStr = `INSERT INTO tb_user SET ?`
                db.query(queryStr, newUser, (err, data) => {
                    if (!err) {
                        resolve({
                            msg: `Username ${body.username} telah berhasil didaftarkan, silahkan login.`
                        })
                    } else {
                        reject(err)
                    }
                })
            })
        })
    },
    postLogin: (body) => {
        return new Promise((resolve, reject) => {
            const { username, password } = body
            const queryStr = "SELECT id, username, password, level_id FROM tb_user WHERE username = ?"
            db.query(queryStr, username, (err, data) => {
                console.log(data)
                //error queryData
                if (err) {
                    reject({
                        msg: `Error ditemukan pada query`
                    })
                }
                //no result data 
                if (!data[0]) {
                    reject({
                        msg: `Username tidak ditemukan`
                    })
                } else {
                    //comparing pw
                    bcrypt.compare(password, data[0].password, (error, result) => {
                        //what is this ?
                        if (err) {
                            reject({
                                msg: `Proses Hash Error!`
                            })
                        }
                        //result error ?
                        if (!result) {
                            reject({
                                msg: `Password salah!`
                            })
                        } else {
                            //sign result to payload jwt
                            const payload = {
                                user_id: data[0].id,
                                username,
                                level: data[0].level_id
                            }
                            //generate token 
                            const token = jsonwebtoken.sign(payload, process.env.SECRET_KEY)
                            //resolve token to user(FE)
                            resolve({ token })
                        }

                    })

                }
            })
        })
    },
    postLogout: (blacklisToken) => {
        return new Promise((resolve, reject) => {
            const queryStr = "INSERT INTO blacklist_token SET ?"
            db.query(queryStr, blacklisToken, (err, data) => {
                if (!err) {
                    resolve(data)
                } else {
                    reject(err)
                }
            })
        })
    }
}