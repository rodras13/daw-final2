const express = require('express');
const router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('index', { title: 'Express' }); // Utiliza una plantilla específica como primer parámetro, define variables en la siguiente
});

module.exports = router;
