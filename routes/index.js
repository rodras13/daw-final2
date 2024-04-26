const express = require('express');
const router = express.Router();
// const BETA = require('../constrollers/BETAcharPerController');

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('index', { title: 'Frikitest' }); // Utiliza una plantilla específica como primer parámetro, define variables en la siguiente
});

router.get('/aboutest', function (req, res, next) {
  res.render('aboutest');
});

router.get('/comunidad', function (req, res, next) {
  res.render('comunidad');
});

router.get('/users', function (req, res, next) {
  res.render('users');
});

router.get('/error', function (req, res, next) {
  res.render('error');
});

module.exports = router;
