const conn = require('../models/connection');
const asyncHandler = require('express-async-handler');

exports.char_per_list = asyncHandler(async (req, res, next) => {
  conn.query('SELECT `question` FROM `t_harrypotter`', (err, rows) => {
    if (err) throw (err);
    rows.forEach(element => {
      console.log(element);
    });
    res.render('index', {
      title2: 'Lista de Personalidades',
      char_per_list: rows
    });
  });
});

// Este es un módulo de prueba
