// Esto es una apreciacion de todo el esqueleto de la página

const express = require('express');
const router = express.Router();

// Todos los controladores que hay

const universeController = require('../constrollers/univController');
const swController = require('../constrollers/swTestController');
const lotrController = require('../constrollers/lotrTestController');
const hpController = require('../constrollers/hpTestController');

// Aquí es donde están las muestras de tos los universos

router.get('/', universeController.universe_list);

// El controlador de Star Wars

// Descripcion del test
router.get('/starwars', swController.test_description);

// Preguntas del Test
router.get('/starwars/test', swController.sw_test_items);

// Resultados del Test
router.post('/starwars/test/results', swController.sw_test_results);

// El controlador de El Señor de los Anillos

router.get('/lordoftherings', lotrController.test_description);

// Preguntas del Test
router.get('/lordoftherings/test', lotrController.lotr_test_items);

// Resultados del Test
router.post('/lordoftherings/test/results', lotrController.lotr_test_results);

// El controlador de Harry Potter

router.get('/harrypotter', hpController.test_description);

// Preguntas del Test
router.get('/harrypotter/test', hpController.hp_test_items);

// Resultados del Test
router.post('/harrypotter/test/results', hpController.hp_test_results);

module.exports = router;
