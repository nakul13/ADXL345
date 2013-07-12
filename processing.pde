/***********************************************
  Author : Nakul Rao I
  Date : 10/7/2013
************************************************/


import processing.serial.*;

int height = 640;
int width = 600;
float x, y, z, rx, ry, rz;

Serial port; 
int val; 

void setup() {
  x = 0.0;
  y = 1.0;
  z = 0.0;
  rx = 1.0;
  ry = 0.0;
  rz = 1.0;
  size(height, width, P3D);
  spotLight(255, 255, 255, // Color
  200, 0, 200, // Position
  0, 1, 1, // Direction XYZ
  PI, 2);
  background(200);
  fill(255, 255, 255);
  stroke(255, 50);
  translate(height/2, width/2, 0);
  rotateX(x);
  rotateY(y);
  rotateZ(z);
  box(500,20,20);
  
  //println(Serial.list());
  String serialPort = Serial.list()[0];
  port = new Serial(this, serialPort, 9600);
}

/*
into the screen = x-1.55, y-0.6, z-1.4 (1,0,1)
pointing up = x-2, y-1.57 ,z-(-0.2)
horizontal = x-0, y-1, z-0
*/ 

void draw() {
  if (port.available() > 0) { 
    val = port.read(); 
  }
  
  if (val == '2'){
    rx = 1.0;
    ry = 0.0;
    rz = 1.0;
  }
  else if (val == '1'){
    rx = 0.0;
    ry = 1.0;
    rz = 0.0;
  }
  else if (val == '3'){
    rx = 2.0;
    ry = 1.57;
    rz = -0.2;
  }
  else{
  }
  
  spotLight(255, 255, 255, // Color
  200, 0, 200, // Position
  0, 1, 1, // Direction XYZ
  PI, 2);
  background(200);
  fill(160, 0, 160);
  stroke(255, 50);
  translate(height/2, width/2, 0);
  
  rotateX(x);
  rotateY(y);
  rotateZ(z);
  box(500,20,20);
  
  if(x!=rx){
    if(x>rx){
      x = x-0.01;
    }
    if(x<rx){
      x = x+0.01;
    }
  }
  
  if(y!=ry){
    if(y>ry){
      y = y-0.01;
    }
    if(y<ry){
      y = y+0.01;
    }
  }
  
  if(z!=rz){
    if(z>rz){
      z = z-0.01;
    }
    if(z<rz){
      z = z+0.01;
    }
  }
}
