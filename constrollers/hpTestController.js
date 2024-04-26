const conn = require('../models/connection');
const asyncHandler = require('express-async-handler');
const { aggregateMetrics, computePersonality, sumMetrics } = require('./utils');

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

exports.hp_test_results = asyncHandler(async (req, res, next) => {
  const metrics = aggregateMetrics(req.body);
  const personality = computePersonality(metrics);
  const total = sumMetrics(metrics).toString();

  conn.query(`SELECT char_name, ABS(${total}-CAST(t_score AS DECIMAL)) AS diff FROM personality_char WHERE char_per = "${personality}" AND char_uni=3 ORDER BY diff ASC LIMIT 1;`, (err, rows) => {
    if (err) throw (err);
    console.log(rows);
    res.render('results', {
      result: rows[0]
    });
  });
});
