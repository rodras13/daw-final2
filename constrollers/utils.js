function aggregateMetrics (results) {
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

  Object.keys(results).forEach(key => {
    const value = results[key];
    const [, qType] = key.split('-');
    agregaciones[qType].push(Number(value));
  });

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

function sumMetrics (metrics) {
  return Object.values(metrics).reduce((a, b) => a + b, 0);
}

module.exports = {
  aggregateMetrics,
  computePersonality,
  sumMetrics
};
