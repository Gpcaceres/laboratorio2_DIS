const mysql = require('mysql');
require('dotenv').config();

const pool = mysql.createPool({
    host: process.env.DBHOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD, // Added valid value for password
    database: process.env.DB_DATABASE, // Added valid value for database
    connectionLimit: 10,
    waitForConnection: true // Added value for waitForConnection
})