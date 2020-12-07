const express = require('express')
const authRouter = express.Router()
const db = require('../config/mySQL')
const bcrypt = require ('bcrypt')
const jsonwebtoken = require ('jsonwebtoken')

//SigmUp
authRouter.post("/signup",(req, res) => {
    const {body} = req
    const postNewUser = new Promise ((resolve, reject) => {
        const saltRounds = 5
        //hashPw
        bcrypt.hash(body.password, saltRounds, (err, hashedPassword) => {
            //generate newBody from newPw
            const newUser = {...body, password: hashedPassword}
            const queryStr  = `INSERT INTO tb_user SET ?`
            db.query(queryStr, newUser, (err, data) => {
                if(!err) {
                    resolve({
                        msg: `Username ${body.username} telah berhasil didaftarkan, silahkan login.`
                    })
                }else{
                    reject(
                        err
                    )
                }
            })
        })
    })
    postNewUser.then((result) => {
        res.json(result)
    }).catch((error) => {
        res.json(error)
    })
})


//Lomgin
authRouter.post("/login", (req, res) => {
    const {username, password} = req.body
    const postLoginUser = new Promise ((resolve, reject) => {
        const queryStr = "SELECT username, password, level_id FROM tb_user WHERE username = ?"
        db.query(queryStr, username, (err, data) => {
            //error queryData
            if(err){
                reject({
                    msg : `Error ditemukan pada query`
                })
            }
            //no result data 
            if(!data[0]){
                reject({
                    msg : `Username tidak ditemukan`
                })
            }else{
                if(!data[0]){
                    reject({
                        msg : `Username tidak ditemukan!`
                    })
                }else{
                    //comparing pw
                    bcrypt.compare(password, data[0].password, (error, result) => {
                        //what is this ?
                        if(err){
                            reject({
                                msg: `Proses Hash Error!`
                            })
                        }
                        //result error ?
                        if(!result){
                            reject({
                                msg : `Password salah!`
                            })
                        }else{
                            //sign result to payload jwt
                            const payload = {
                                username, 
                                level: data[0].level_id
                            }
                            //generate token 
                            const token = jsonwebtoken.sign(payload, process.env.SECRET_KEY)
                            //resolve token to user(FE)
                            resolve({token})
                        }
    
                    })
                }
            }
        })
    })
    postLoginUser.then((result) => {
        res.json({result})
    }).catch((error) => {
        res.json(error)
    })
})

authRouter.post("/logout", (req, res) => {
    const bearerToken = req.header("x-access-token");
    if(!bearerToken){
        res.json({
            msg: `token null!`
        })
    }else{
        blacklisToken = {
            token : bearerToken.split(" ")[1]
        }

        const logoutUser = new Promise ((resolve, reject) => {
            const queryStr = "INSERT INTO blacklist_token SET ?"
            db.query(queryStr, blacklisToken, (err, data) => {
                if(!err){
                    resolve(data)
                }else{
                    reject(err)
                }
            })
        }).then((result) => {
            res.json({
                msg: `token already blacklisted, so its mean you already logout from system`
            })
        }).catch((error) => {
            res.json(error)
        })
    }

})


module.exports = authRouter
