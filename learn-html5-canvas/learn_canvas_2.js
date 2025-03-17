function learnClip() {
  var elem = document.getElementById('canvas');
  canvas = elem.getContext('2d');
  canvas.beginPath();
  canvas.moveTo(100, 100);
  canvas.lineTo(200, 200);
  canvas.lineTo(100, 200);
  canvas.clip();
  canvas.beginPath();
  for(var f = 0; f < 300; f = f+10) {
    canvas.moveTo(0, f);
    canvas.lineTo(500, f);
  }
  canvas.stroke();
}

function learnLine() {
  var elem = document.getElementById('canvas');
  canvas = elem.getContext('2d');
  canvas.beginPath();
  canvas.moveTo(100, 100);
  canvas.lineTo(100, 200);
  canvas.stroke();
}

function learnPolygon() {
  var elem = document.getElementById('canvas');
  canvas = elem.getContext('2d');
  canvas.beginPath();
  canvas.moveTo(100, 100);
  canvas.lineTo(150, 150);
  canvas.lineTo(150, 200);
  canvas.lineTo(50, 100);
  canvas.closePath();
  // canvas.stroke();
  canvas.fill();
}

function learnArc() {
  var elem = document.getElementById('canvas');
  canvas = elem.getContext('2d');
  canvas.beginPath();
  // Start from 100,100 (not the center), radius of 50, start angle of 0 and end angle of pi/2
  canvas.arc(100, 100, 50, 0, Math.PI/2, false);
  canvas.stroke();
}

function learnCurves() {
  var elem = document.getElementById('canvas');
  canvas = elem.getContext('2d');
  canvas.beginPath();

  // Start from 50,50 and end at 50,200 with the control point at 100,125
  canvas.moveTo(50, 50);
  canvas.quadraticCurveTo(100, 125, 50, 200);

  // Start from 250,50 and end at 250,200 with control points at 200,125 and 300,125
  canvas.moveTo(250, 50);
  canvas.bezierCurveTo(200, 125, 300, 125, 250, 200);

  canvas.stroke();
}

function learnLineStyles() {
  // lineWidth by default is 1.0
  // lineCap can be 'butt', 'round', 'square'
  // lineJoin can be 'round', 'bevel', 'miter'

  var elem = document.getElementById('canvas');
  canvas = elem.getContext('2d');
  canvas.beginPath();
  canvas.arc(200, 150, 50, 0, 2*Math.PI, false);
  canvas.stroke();

  canvas.lineWidth = 10;
  canvas.lineCap = 'round';
  canvas.beginPath();
  canvas.moveTo(230, 150);
  canvas.arc(200, 150, 30, 0, Math.PI, false);
  canvas.stroke();

  canvas.lineWidth = 5;
  canvas.lineCap = 'square';
  canvas.lineJoin = 'miter';
  canvas.beginPath();
  canvas.moveTo(195, 135);
  canvas.lineTo(215, 155);
  canvas.lineTo(195, 155);
  canvas.stroke();
}

function learnText() {
  // font same as CSS
  // textAlign can 'start', 'end', 'left', 'right', 'center'
  // textBaseline for vertical alignment can be 'top', 'hanging', 'middle', 'alphabetic', 'ideographic', 'bottom'

  var elem = document.getElementById('canvas');
  canvas = elem.getContext('2d');
  canvas.beginPath();
  canvas.font = 'bold 24px verdana, sans-serif';
  canvas.textAlign = 'start';
  // canvas.fillText('my message', 100, 100);
  canvas.strokeText('my message', 100, 100);
}

function learnTransforms() {
  // Use canvas.save() to create a checkpoint and canvas.restore() to return to the checkpoint
  var elem = document.getElementById('canvas');
  canvas = elem.getContext('2d');
  canvas.font = 'bold 20px verdana sans-serif';
  canvas.fillText('TEST', 50, 20);

  canvas.translate(50, 70);
  canvas.rotate(Math.PI/4);
  canvas.fillText('TEST', 0, 0);

  canvas.rotate(-Math.PI/4);
  canvas.translate(0, 100);
  canvas.scale(2, 2);
  canvas.fillText('TEST', 0, 0);
}

function learnLayers() {
  /*
  globalCompositionOperation values -
  source-over:
  New shape will be drawn over the existing shape,

  source-in:
  Only part of the new shape that overlaps with the previous shape is drawn, rest are cropped.

  source-out:
  Only part of the new shape that does not overlap with the previous shape is drawn, rest are cropped.

  source-atop:
  Only part of the new shape that overlaps with the previous shape is drawn. The previous shape is
  preserved, rest of the new shape is cropped.

  destination-over, destination-in, destination-out, and desitnation-atop are similar except the previous
  shape is the main shape.

  lighter:
  Both the shapes are drawn, but the color of the parts that overlap is determined by summing up the  color values.

  darker:
  Both the shapes are drawn, but the color of the parts that overlap is determined by subtracting the color values.

  xor:
  Both shapes are drawn, but the parts that overlap are cropped.

  copy:
  Only the new shape is drawn, the old is removed.
  */
  var elem = document.getElementById('canvas');
  canvas = elem.getContext('2d');

  canvas.fillStyle = '#990000';
  canvas.fillRect(100, 100, 300, 100);

  canvas.globalCompositeOperation = 'destination-atop';
  canvas.fillStyle = '#aaaaff';
  canvas.font = 'bold 80px verdana, sans-serif';
  canvas.textAlign = 'center';
  canvas.textBaseline = 'middle';
  canvas.fillText('TEST', 250, 110);
}

window.addEventListener('load', learnLayers, false);
