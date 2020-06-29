const easyDB = require('easydb-io');

const db = easyDB({
    database: process.env.DATABASE_ID,
    token: process.env.DATABASE_TOKEN
})

module.exports = db;