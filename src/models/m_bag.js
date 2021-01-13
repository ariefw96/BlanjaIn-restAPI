const db = require('../config/mySQL')

module.exports = {
    add: (body) =>{
        return new Promise ((resolve, reject) =>{
            const queryStr = `INSERT INTO mybag SET ?`
            db.query(queryStr, body, (err, data) =>{
                if(!err){
                    resolve({
                        status:200,
                        message:'Berhasil ditambahkan'
                    })
                }else{
                    reject({
                        status:500,
                        message:err
                    })
                }
            })
        })
    },
    get: (id) =>{
        return new Promise ((resolve, reject) =>{
            const queryStr = `SELECT m.id, p.product_name, c.color_name, s.size_name, qty, p.product_price FROM mybag m
            JOIN tb_user u ON u.id = m.user_id
            JOIN products p ON p.id = m.product_id
            JOIN color c ON c.id = m.color
            JOIN size s ON s.id = m.size
            WHERE u.id = ?`
            db.query(queryStr, id, (err, data) =>{
                if(!err){
                    if(data[0]){
                        resolve({
                            status:200,
                            data:data
                        })
                    }else{
                        resolve({
                            status:404,
                            data:`Cart anda masih kosong`
                        })
                    }
                }else{
                    reject({
                        status:500,
                        message:err
                    })
                }
            })
        })
    },
    delete: (id) =>{
        const queryStr = `DELETE FROM mybag WHERE id = ?`
        db.query(queryStr,id, (err, data) =>{
            if(!err){
                resolve({
                    status:200,
                    message:`Item dihapus`
                })
            }else{
                reject({
                    status:500,
                    message:err
                })
            }
        })
    }
}