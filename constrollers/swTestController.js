const conn = require('../models/connection');
const asyncHandler = require('express-async-handler');

// Devuelve la descripción del test en si

exports.test_description = asyncHandler(async (req, res, next) => {
  conn.query('SELECT name_uni, desc_uni FROM universe WHERE name_uni = "Star Wars";', (err, rows) => {
    if (err) throw (err);
    res.render('tests', {
      styleTarget: 'sw',
      // Esta variable le va a indicar a la vista de los test que imagen tiene que escoger
      test_description: rows
    });
  });
});

// Devuelve las preguntas del cuestionario del test de Star Wars

exports.sw_test_items = asyncHandler(async (req, res, next) => {
  conn.query('SELECT item, question, item_type FROM t_starwars;', (err, rows) => {
    if (err) throw (err);
    res.render('items', {
      styleTarget: 'sw',
      sw_test_items: rows
    });
  });
});

// Y aqui la funcion para alojar los resultados de la personalidad
