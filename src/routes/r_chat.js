const express = require('express')
const chatRouter = express.Router()
const chatController = require('./../controllers/c_chat')
const checkToken = require ('./../helpers/checkToken')

chatRouter.post('/addMessage', checkToken.isLogin, chatController.addNewMessage)
chatRouter.get('/chatRoomSeller', checkToken.isLogin, chatController.getListChatSeller)
chatRouter.get('/chatRoomBuyer', checkToken.isLogin, chatController.getListChatBuyer)
chatRouter.get('/newMessage/:chatRoom', chatController.getNewMessage )

module.exports = chatRouter