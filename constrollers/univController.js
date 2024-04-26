const conn = require('../models/connection');
const asyncHandler = require('express-async-handler');

// Devuelve todos los test y su descripción

exports.universe_list = asyncHandler(async (req, res, next) => {
  conn.query('SELECT name_uni, desc_uni FROM universe', (err, rows) => {
    if (err) throw (err);
    res.render('universos', {
      title2: 'Lista de Universos',
      universe_list: rows
    });
  });
});
