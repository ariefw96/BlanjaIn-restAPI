const express = require('express')
const kurirRouter = express.Router()
const kurirControlller = require('./../controllers/c_kurir')

kurirRouter.get('/jasa_pengiriman', kurirControlller.getKurir)

module.exports = kurirRouter