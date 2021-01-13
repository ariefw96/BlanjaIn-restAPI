const bagModel = require('./../models/m_bag')

module.exports = {
    postNewItems: (req, res) => {
        const { body } = req
        bagModel.add(body)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
    getData: (req, res) => {
        const { id } = req.params
        bagModel.get(id)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    },
    deleteItems: (req, res) => {
        const { id } = req.params
        bagModel.delete(id)
            .then((result) => {
                res.status(result.status).json(result)
            }).catch((error) => {
                res.status(error.status).json(error)
            })
    }
}