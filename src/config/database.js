const { Client } = require('pg');

require('dotenv').config();

const { USER, HOST, DATABASE, PASSWORD, DB_PORT } = process.env;

const client = new Client({
    user: USER,
    host: HOST,
    database: DATABASE,
    password: PASSWORD,
    port: DB_PORT,
});

client.connect((err) => {
  if (err) throw err;
  console.log("Connected Database!");
});

module.exports = client;

// const pgp = require('pg-promise')();
// const db = pgp({
// 	user: USER,
//     host: HOST,
//     database: DATABASE,
//     password: PASSWORD,
//     port: DB_PORT,
// });

// module.exports = db;