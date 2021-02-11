const addressModel = require('../models/m_address')

module.exports = {
    //addNewAdress
    addAddress: (req, res) => {
        const {body} = req
        console.log(body)
        addressModel.postNewAddress(body)
        .then((result) =>{
            res.status(200).json(result)
        }).catch((error) =>{
            res.status(error.status).json(error)
        })
    },
    //changeAddress
    changeAddress: (req, res) =>{
        const {body} = req
        const {id} = req.params
        addressModel.changeAddress(body,id)
        .then((result) =>{
            res.status(200).json(result)
        }).catch((error) =>{
            res.status(error.status).json(error)
        })
    },
    //getAdressByUserId
    getAddress: (req, res) =>{
        const userId = req.decodedToken.user_id
        console.log(userId)
        addressModel.getAddress(userId)
        .then((result) =>{
            res.status(result.status).json(result)
        }).catch((error) =>{
            res.status(error.status).json(error)
        })
    },
    //getAdressById
    getAddressId: (req, res) => {
        const {id} = req.params
        addressModel.getAddressbyId(id)
        .then((result) =>{
            res.status(result.status).json(result)
        }).catch((error) =>{
            res.status(error.status).json(error)
        })
    },
    //deleteAddress
    deleteAdress: (req, res) =>{
        const {id} = req.params
        addressModel.deleteAddressId(id)
        .then((result) =>{
            res.status(200).json(result)
        }).catch((error) =>{
            res.status(error.status).json(error)
        })
    }
} 