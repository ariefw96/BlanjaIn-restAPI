const { getUserDetails } = require('./../models/m_user')
const userModel = require('./../models/m_user')

module.exports = {
    addReview: (req, res) => {
        const { body } = req
        userModel.addReview(body)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },

    getReview: (req, res) => {
        const { productId } = req.params
        console.log(productId)
        userModel.getReview(productId)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },

    getUserDetails: (req, res) => {
        const id = req.decodedToken.user_id
        userModel.getUserDetails(id)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
    changePassword: (req, res) => {
        let { body } = req
        body = {
            ...body,
            email:req.decodedToken.email
        }
        userModel.changePassword(body)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
    getNameUser: (req, res) =>{
        const {id} = req.params
        userModel.getNameUser(id)
        .then((result) => {
            res.status(result.status).json(result)
        }).catch((error) => {
            res.status(error.status).json(error)
        })
    }
}