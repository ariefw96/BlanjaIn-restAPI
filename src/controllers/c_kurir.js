const kurirRouter = require('../routes/r_kurir')
const kurirModel = require('./../models/m_kurir')

module.exports = {
    getKurir: (req, res) =>{
        kurirModel.getKurirData()
        .then((result) =>{
            res.status(200).json(result)
        }).catch((error) =>{
            res.status(error.status).json(error)
        })
    }
}