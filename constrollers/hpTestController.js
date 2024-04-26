const conn = require('../models/connection');
const asyncHandler = require('express-async-handler');

// Devuelve la descripción del test en si

exports.test_description = asyncHandler(async (req, res, next) => {
  conn.query('SELECT name_uni, desc_uni FROM universe WHERE name_uni = "Harry Potter";', (err, rows) => {
    if (err) throw (err);
    res.render('tests', {
      styleTarget: 'hp',
      test_description: rows
    });
  });
});

// Devuelve las preguntas del cuestionario del test de Star Wars

exports.hp_test_items = asyncHandler(async (req, res, next) => {
  conn.query('SELECT item, question, item_type FROM t_harrypotter;', (err, rows) => {
    if (err) throw (err);
    res.render('items', {
      styleTarget: 'hp',
      hp_test_items: rows
    });
  });
});

// Y aqui la funcion para alojar los resultados de la personalidad
