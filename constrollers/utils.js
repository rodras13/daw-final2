function aggregateMetrics (results) {
  // Creamos un objeto que guarde cada tipo de item con su correspondiente valor
  const agregaciones = {
    NS: [],
    EI: [],
    SN: [],
    FT: [],
    TF: [],
    PJ: [],
    JP: []
  };

  const sumas = {};

  // Recorremos el cuerpo de la petición POST para procesar cada uno de los items
  Object.keys(results).forEach(key => {
    const value = results[key];

    // Coge solo la parte de la cadena con la información del item, por ejemplo, JP
    const [, qType] = key.split('-');

    // Y añade el valor correspondiente en la propiedad del item
    agregaciones[qType].push(Number(value));
  });

  // Recoremos agregaciones para asignar valores por defecto en caso de que
  // el ususario no haya respondido a un item y que los resultados no se descompensen
  Object.keys(agregaciones).forEach(key => {
    const replies = agregaciones[key];
    const numReplies = replies.length;
    const repliesLeft = 5 - numReplies;
    sumas[key] = agregaciones[key].reduce((a, b) => a + b, 0) + repliesLeft * 4;
  });

  return {
    EI: sumas.EI,
    SNt: sumas.NS + sumas.SN,
    TFt: sumas.TF + sumas.FT,
    JPt: sumas.PJ + sumas.JP
  };
}

// Funcion que cuenta que rasgo prevalece en cada par de valores y asigna el valor a un objeto,
// que será el resultado de la personalidad del usuario
function computePersonality (metrics) {
  const dataPer = {
    personality: ''
  };
  metrics.EI >= 18 ? dataPer.personality += 'I' : dataPer.personality += 'E';
  metrics.SNt >= 35 ? dataPer.personality += 'N' : dataPer.personality += 'S';
  metrics.TFt >= 35 ? dataPer.personality += 'F' : dataPer.personality += 'T';
  metrics.JPt >= 35 ? dataPer.personality += 'P' : dataPer.personality += 'J';

  return dataPer.personality;
}

// Duncion que suma la puntuación total para diferenciar unos personajes de otros en la consulta
function sumMetrics (metrics) {
  return Object.values(metrics).reduce((a, b) => a + b, 0);
}

module.exports = {
  aggregateMetrics,
  computePersonality,
  sumMetrics
};
