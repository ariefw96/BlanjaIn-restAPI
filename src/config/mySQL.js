const mysql = require('mysql')
// koneksi ke db

const {HOST, USER, PASS, DB} = process.env
const db = mysql.createConnection({
    host: HOST,
    user: USER,
    password: PASS,
    database: DB
})

// cek koneksi ke db
db.connect((err) => {
    if (err) throw err;
    console.log('Database Connected');
})

module.exports = db