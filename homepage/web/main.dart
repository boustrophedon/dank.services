import 'dart:html';
import 'dart:math' as math;

// yeah global variables. got a problem, punk?
var width, height;
var lumwidth,lumheight;
var gnome;
var lum1;
var lum2;

void rotate(num t) {
  num rotate_speed = t/3;
  gnome.style.transform = 'rotate(${rotate_speed%360}deg)';

  num circle_speed = (t/500)%(2*math.pi);
  var x1 = width/2 - lumwidth/2 + (width/4)*math.cos(circle_speed);
  var x2 = width/2 - lumwidth/2 + (width/4)*math.cos(-circle_speed);
  var y = -height/2 - lumheight/2 + (height/4)*math.sin(circle_speed);

  lum1.style.transform = 'translate(${x1}px, ${y}px)';
  lum2.style.transform = 'scaleX(-1) translate(${x2}px, ${y}px)';

  lum1.style.transformOrigin = '${width/2}px ${height/2}px';
  lum2.style.transformOrigin = '${width/2}px ${height/2}px';

  window.requestAnimationFrame(rotate);
}

void main() async {
  width = window.innerWidth;
  height = window.innerHeight;
  gnome = querySelector("#gnome"); // #GNOME
  lum1 = querySelector("#lum1");
  lum2 = querySelector("#lum2");

  lumwidth = lum1.clientWidth;
  lumheight = lum1.clientHeight;
  await window.requestAnimationFrame(rotate);
}
