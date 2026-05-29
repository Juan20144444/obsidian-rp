const tips = [
  'Pulsa E para interactuar en el mundo.',
  'Roleplay serio, limpio y con progresión.',
  'Respeta el entorno y crea una buena historia.',
  'Obsidian Roleplay se carga desde una recipe propia.'
];
let i = 0;
setInterval(() => {
  i = (i + 1) % tips.length;
  document.getElementById('tips').textContent = tips[i];
}, 3500);
