const authModel = require('../models/m_auth')
const form = require('../helpers/form')

module.exports = {
    signup: (req, res) => {
        const { body } = req
        authModel.postNewUser(body)
            .then((result) => {
                form.success(res, result)
            }).catch((error) => {
                form.error(res, error)
            })
    },
    login: (req, res) => {
        const { body } = req
        authModel.postLogin(body)
            .then((result) => {
                form.success(res,{
                    msg: `Sukses Login`,
                    tokenId: result
                })
            }).catch((error) => {
                form.error(res,{
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
                    form.success(res, result)
                }).catch((error) => {
                    form.error(res, error)
                })
        }
    }
}