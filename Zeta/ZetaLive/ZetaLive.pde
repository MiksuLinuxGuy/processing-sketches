int infty = 1000;
float[] limits = {-5, 5, -5, 5};
float step = 0.01; float t = 0;
PVector prev;

void setup(){
  size(640, 480);
  background(255);
  stroke(0, 0, 0, 100);
  for(int i = ceil(limits[0]); i < limits[1]; i++){
    if(i == 0){
      stroke(0);
      strokeWeight(2);
      line(mapSpace(i, 0).x, 0, mapSpace(i, 0).x, height);
      stroke(0, 0, 0, 100);
      strokeWeight(1);
    } else {
      line(mapSpace(i, 0).x, 0, mapSpace(i, 0).x, height);
    }
  }
  for(int i = ceil(limits[2]); i < limits[3]; i++){
    if(i == 0){
      stroke(0);
      strokeWeight(2);
      line(0, mapSpace(0, i).y, width, mapSpace(0, i).y);
      stroke(0, 0, 0, 100);
      strokeWeight(1);
    } else {
      line(0, mapSpace(0, i).y, width, mapSpace(0, i).y);
    }
  }
  prev = mapSpace(zeta(0));
}

void draw(){
  strokeWeight(2);
  stroke(100, 200, 0);
  line(prev.x, prev.y, mapSpace(zeta(t)).x, mapSpace(zeta(t)).y);
  prev = mapSpace(zeta(t));
  t += step;
}

PVector zeta(float t){ // zeta( 1/2 + t*i )
  Complex sum = new Complex(0, 0);
  Complex s = new Complex(0.5, t);
  Complex term;
  for(int i = 1; i < infty; i++){
    term = s.exp(i);
    term = term.recip();
    term = term.mult(pow(-1, i-1));
    sum = sum.add(term);
  }
  
  Complex coeff;
  coeff = s.mult(-1).add(1);
  coeff = coeff.exp(2);
  coeff = coeff.mult(-1).add(1);
  coeff = coeff.recip();
  
  sum = sum.mult(coeff);
  return new PVector(sum.x, sum.y);
}

PVector mapScreen(PVector p){
  PVector out; float x; float y;
  x = map(p.x, 0, width, limits[0], limits[1]);
  y = map(p.y, 0, height, limits[3], limits[2]);
  out = new PVector(x, y);
  return out;
}
PVector mapScreen(float px, float py){
  PVector out; float x; float y;
  x = map(px, 0, width, limits[0], limits[1]);
  y = map(py, 0, height, limits[3], limits[2]);
  out = new PVector(x, y);
  return out;
}

PVector mapSpace(PVector p){
  PVector out; float x; float y;
  x = map(p.x, limits[0], limits[1], 0, width);
  y = map(p.y, limits[2], limits[3], height, 0);
  out = new PVector(x, y);
  return out;
}
PVector mapSpace(float px, float py){
  PVector out; float x; float y;
  x = map(px, limits[0], limits[1], 0, width);
  y = map(py, limits[2], limits[3], height, 0);
  out = new PVector(x, y);
  return out;
}