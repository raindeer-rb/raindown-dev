// Draws the page background as 2px squares alternating between three blues, darker at the top and lighter further down.
// A gentle swirl of smooth noise lightens and darkens them in patches, and the squares crumble away towards the bottom,
// so the background ends in the page's own colour.
const backdrop = document.querySelector('canvas.backdrop');
const SQUARE = 2;

// Shades of blue as [hue, saturation, lightness offset], used in turn.
const SHADES = [[212, 100, 8], [222, 100, 0], [232, 95, -8]];

// A random number from 0 to 1 for each pixel, so the pattern stays put when the window is resized.
function random(x, y, salt) {
  let hash = Math.imul(x, 374761393) + Math.imul(y, 668265263) + Math.imul(salt, 982451653);
  hash = Math.imul(hash ^ (hash >>> 13), 1274126177);
  return ((hash ^ (hash >>> 16)) >>> 0) / 4294967296;
}

// Smooth noise from 0 to 1, blending the random values at the corners of each grid cell.
function noise(x, y) {
  const left = Math.floor(x);
  const top = Math.floor(y);
  const smooth = (t) => t * t * (3 - (2 * t));
  const u = smooth(x - left);
  const v = smooth(y - top);

  const a = random(left, top, 3);
  const b = random(left + 1, top, 3);
  const c = random(left, top + 1, 3);
  const d = random(left + 1, top + 1, 3);
  return a + ((b - a) * u) + ((c - a) * v) + ((a - b - c + d) * u * v);
}

// Layers of noise, from broad shapes to fine detail.
function layered(x, y) {
  return (noise(x, y) * 0.57) + (noise(x * 2, y * 2) * 0.29) + (noise(x * 4, y * 4) * 0.14);
}

// Noise sampled at positions pushed around by more noise, which bends it into swirls.
function swirl(x, y) {
  const scale = 0.015;
  const pushX = layered(x * scale, y * scale);
  const pushY = layered((x * scale) + 5.2, (y * scale) + 1.3);
  return layered((x * scale) + (2 * pushX), (y * scale) + (2 * pushY));
}

function hslToRgb(hue, saturation, lightness) {
  const s = saturation / 100;
  const l = lightness / 100;
  const a = s * Math.min(l, 1 - l);
  const channel = (n) => {
    const k = (n + hue / 30) % 12;
    return Math.round(255 * (l - a * Math.max(-1, Math.min(k - 3, 9 - k, 1))));
  };
  return [channel(0), channel(8), channel(4)];
}

function drawBackdrop() {
  // One canvas pixel per square, scaled up by the browser.
  const width = Math.ceil(backdrop.clientWidth / SQUARE);
  const height = Math.ceil(backdrop.clientHeight / SQUARE);
  backdrop.width = width;
  backdrop.height = height;

  const context = backdrop.getContext('2d');
  const image = context.createImageData(width, height);

  for (let y = 0; y < height; y++) {
    // Nearly solid until the lower rows, then crumbling to no squares in the bottom row.
    const keep = 1 - (y / (height - 1)) ** 3;

    for (let x = 0; x < width; x++) {
      // Swirls of lighter and darker patches, which also shape where the squares crumble.
      const twist = swirl(x, y) - 0.5;
      if (random(x, y, 1) > keep * (1 + (twist * 0.4))) continue;

      const [hue, saturation, offset] = SHADES[(x + y) % SHADES.length];
      const lightness = Math.min(Math.max(34 + (y * SQUARE * 0.04) + offset + (twist * 12), 15), 75);
      const [red, green, blue] = hslToRgb(hue, saturation, lightness);
      const index = ((y * width) + x) * 4;
      image.data[index] = red;
      image.data[index + 1] = green;
      image.data[index + 2] = blue;
      image.data[index + 3] = Math.round(255 * Math.min(Math.max(0.3 + (twist * 0.15) + (random(x, y, 2) * 0.15), 0.08), 0.7));
    }
  }

  context.putImageData(image, 0, 0);
}

let frame;
window.addEventListener('resize', () => {
  cancelAnimationFrame(frame);
  frame = requestAnimationFrame(drawBackdrop);
});
drawBackdrop();
