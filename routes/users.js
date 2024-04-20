const express = require('express');
const router = express.Router();

/* GET users listing. */
/*
Esta funcion lo que hace es crear una direccion por defecto bajo el raiz
del index, en el que el nombre es el de la carpeta contenedora, es decir, users

-- Vale, esto no es cierto, el nombre se define en el app.js dandole un nombre con
el metodo app.use(/nombre, objeto del modulo expotado en routes)
*/
router.get('/', function (req, res, next) {
  res.send('Usuario tu puta madre');
});

module.exports = router;
