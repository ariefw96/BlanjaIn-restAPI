const { query } = require('express')
const db = require('../config/mySQL')



module.exports = {
    addNewMessage: (body) => {
        return new Promise((resolve, reject) => {
            const queryStr = `INSERT INTO tb_chat SET ?`
            db.query(queryStr, body, (err, data) => {
                if (!err) {
                    resolve({
                        status: 200,
                        message: `Message Sent`
                    })
                } else {
                    reject({
                        status: 500,
                        message: `Message not sent!`,
                        detals: err
                    })
                }
            })
        })
    },
    getListChatSeller: (id) => {
        return new Promise((resolve, reject) => {
            const queryStr = `SELECT chatRoom FROM tb_chat WHERE seller = ? GROUP BY chatRoom`
            db.query(queryStr, id, (err, data) => {
                if (!err) {
                    if (data.length > 0) {
                        resolve({
                            status: 200,
                            data: data
                        })
                    } else {
                        resolve({
                            status: 200,
                            data: []
                        })
                    }
                } else {
                    reject({
                        status: 500,
                        details: err
                    })
                }
            })
        })
    },
    getListChatBuyer: (id) => {
        return new Promise((resolve, reject) => {
            const queryStr = `SELECT chatRoom FROM tb_chat WHERE buyer = ? GROUP BY chatRoom`
            db.query(queryStr, id, (err, data) => {
                if (!err) {
                    if (data.length > 0) {
                        resolve({
                            status: 200,
                            data: data
                        })
                    } else {
                        resolve({
                            status: 200,
                            data: []
                        })
                    }
                } else {
                    reject({
                        status: 500,
                        details: err
                    })
                }
            })
        })
    },
    getNewMessage: (chatRoom) => {
        return new Promise((resolve, reject) => {
            const queryStr = `
            SELECT c.id,c.seller, c.buyer,c.chatRoom, c.sender as sender_id, u.fullname as sender_name, c.message, c.created_at 
            FROM tb_chat c 
            JOIN tb_user u ON c.sender = u.id 
            WHERE c.chatRoom = ?
            ORDER BY c.created_at DESC`
            db.query(queryStr, chatRoom, (err, data) => {
                if (!err) {
                    if (data.length > 0) {
                        resolve({
                            status: 200,
                            data: data
                        })
                    } else {
                        resolve({
                            status: 200,
                            data: []
                        })
                    }
                } else {
                    reject({
                        status: 500,
                        details: err
                    })
                }
            })

        })
    }
}