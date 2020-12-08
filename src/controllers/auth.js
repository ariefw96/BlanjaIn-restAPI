const authModel = require('./../models/auth')
const form = require('./../helpers/form')

module.exports = {
    signup: (req, res) => {
        const { body } = req
        authModel.postNewUser(body)
            .then((result) => {
                form.success(res, result)
            }).catch((error) => {
                res.json(error)
            })
    },
    login: (req, res) => {
        const { body } = req
        authModel.postLogin(body)
            .then((result) => {
                form.success(res,{
                    status: 200,
                    msg: `Sukses Login`,
                    tokenId: result
                })
            }).catch((error) => {
                form.error(res,{
                    status: 401,
                    msg: `Gagal login`,
                    errMsg: error
                })
            })
    },
    logout: (req, res) => {
        const bearerToken = req.header("x-access-token");
        if (!bearerToken) {
            res.json({
                msg: `token null!`
            })
        } else {
            blacklisToken = {
                token: bearerToken.split(" ")[1]
            }

            authModel.postLogout(blacklisToken)
                .then((result) => {
                    res.json({
                        status: 204,
                        msg: `Logout successfull`
                    })
                }).catch((error) => {
                    res.json(error)
                })
        }
    }
}