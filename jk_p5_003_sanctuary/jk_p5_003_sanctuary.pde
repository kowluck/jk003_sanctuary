// Nov 2013
// http://jiyu-kenkyu.org
// http://kow-luck.com
//
// This work is licensed under a Creative Commons 3.0 License.
// (Attribution - NonCommerical - ShareAlike)
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// 
// This basically means, you are free to use it as long as you:
// 1. give http://kow-luck.com a credit
// 2. don't use it for commercial gain
// 3. share anything you create with it in the same way I have
//
// If you want to use this work as more free, or encourage me,
// please contact me via http://kow-luck.com/contact

//========================================
import processing.opengl.*;
float rotY, rotZ, rotX;
float step;
float xSc, ySc, zSc;
float xInc, yInc, zInc;
float x, y, z;
float radius;
float radInc;
float rad;
//========================================
void setup() {
  size(1280, 720, OPENGL);
  frameRate(30);
  rotX = 0;
  rotY = 0;
  rotZ = 0;
  xSc = 100;
  ySc = 100;
  zSc = 100;
  xInc = 7;
  yInc = 5;
  zInc = 3;
  radius = 100;
  radInc = 2;
}
//========================================
void draw() {
  background(255);
  translate(width/2, height/2, -width);
  rotateMe();
  drawMe();
  growMe();
  println(frameRate);
}
//========================================
void drawMe() {
  strokeWeight(50);
  stroke(0, 20);
  noFill();
  for (float ang = 0; ang <= 360; ang +=3) { 
    pushMatrix();   
    rad = radians(ang);   
    x = (radius * cos(rad));
    y = (radius * sin(rad));
    translate(x, y);
    box(xSc + xSc/2, ySc + ySc/2, zSc + zSc/2);
    popMatrix();
  }
}
//========================================
void growMe() {
  xSc += xInc;
  ySc += yInc;
  zSc += zInc;
  radius += radInc;
  if (xSc < 100|| xSc > 3000) {
    xInc *= -1;
  }
  if (zSc < 100 || zSc >3000) {
    zInc *= -1;
  }
  if (ySc < 100 || ySc > 3000) {
    yInc *= -1;
  }
  if (radius < 100 || radius > 3000) {
    radInc *= -1;
  }
}
//========================================
void rotateMe() {
  rotateX(radians(rotX));
  rotateY(radians(rotY));
  rotateZ(radians(rotZ));
  rotX += random(-1, 2);
  rotY += random(1, 2);
  rotZ += random(-2, 1);
}

