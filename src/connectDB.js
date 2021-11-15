
const mysql = require('mysql2');
const con = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database:'doakid'
});

module.exports = con;