function learnAnimate() {
  var elem = document.getElementById('canvas');
  canvas = elem.getContext('2d');
  window.addEventListener('mousemove', animation, false);
}

function animation(e) {
  canvas.clearRect(0, 0, 300, 500);
  var xmouse = e.clientX;
  var ymouse = e.clientY;
  var xcenter = 220;
  var ycenter = 150;
  var ang = Math.atan2(xmouse - xcenter, ymouse - ycenter);
  var x = xcenter + Math.round(Math.sin(ang)*10);
  var y = ycenter + Math.round(Math.cos(ang)*10);
  canvas.beginPath();
  canvas.arc(xcenter, ycenter, 20, 0, 2*Math.PI, false);
  canvas.moveTo(xcenter+70, 150);
  canvas.arc(xcenter+50, 150, 20, 0, 2*Math.PI, false);
  canvas.stroke();

  canvas.beginPath();
  canvas.moveTo(x+10, y);
  canvas.arc(x, y, 10, 0, 2*Math.PI, false);
  canvas.moveTo(x+60, y);
  canvas.arc(x+50, y, 10, 0, 2*Math.PI, false);
  canvas.fill();
}

window.addEventListener('load', learnAnimate, false);
