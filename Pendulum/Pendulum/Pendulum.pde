
int r = 200;
float s = 0.0; float v = 0.0; float a = 0.0;

float t = 0.3;

int x = 0, y = 0;

float g = 9.81;

float k = 0.01;

float m = 1;

void setup(){
  size(500, 500);

  x = width/2 + r; y = 100;

}

void draw(){
  background(255);
  
  strokeWeight(2);
  stroke(240);
  arc(width/2, 100, 2*r, 2*r, 0, PI);
  stroke(0);
  line(width/2, 100, x, y);
  strokeWeight(10);
  point(x, y);
  
  for(int i = 0; i < 3; i++){
    strokeWeight(2);
    stroke(0);
    strokeWeight(10);
  }
  
  a = t*(g*cos(s/r)-(sgn(a))*(k*pow(v, 2))/m);
  v += a;
  s += v;
  
  x = floor(width/2 + r*cos( s/r ));
  y = floor(100 + r*sin( s/r ));
  
}

int sgn(float a){
  if(a >= 0){
    return 1;
  } else {
    return -1;
  }
}