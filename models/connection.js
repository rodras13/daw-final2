const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'RooT1234',
  database: 'personality_web'
});

connection.connect((err) => {
  if (err) {
    throw err;
  } else {
    console.log('Great Connection');
  }
});

module.exports = connection;
