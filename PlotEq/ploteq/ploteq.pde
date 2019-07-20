float[] limits = {-5, 5, -5, 5};
ArrayList<PVector> points = new ArrayList<PVector>();

void setup(){
  size(640, 640);
  
  /* // Faster, for discontinuous functions
  float epsilon1 = 0.0025;
  float epsilon2 = 0.01;
  for(float x = limits[0]; x < limits[1]; x+=epsilon1){
    for(float y = limits[2]; y < limits[3]; y+=epsilon1){
      if(abs(f(x, y)) < epsilon2){
        points.add(mapSpace(x, y));
      }
    }
  }
  */
  
   // Slower, cleaner
  float epsilon = 0.01;
  PVector p;
  for(float x = limits[0]; x < limits[1]; x+=epsilon){
    for(float y = limits[2]; y < limits[3]; y+=epsilon){
      p = newton(x, y);
      if(p.copy().sub(newton(p.x, p.y)).mag() < 0.01){
        for(int i = 0; i < 3; i++){
          p = newton(p.x, p.y);
        }
        points.add(mapSpace(p));
      }
    }
  }
  
  
  noLoop();
}

void draw(){
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
  
  stroke(100, 200, 0);
  for(int i = 0; i < points.size(); i++){
    point(points.get(i).x, points.get(i).y);
  }

}

float f(float x, float y){
  return y-exp(x);
  //return x*x-y*y-1;
}
PVector gradf(float x, float y){
  //PVector out = new PVector(2*x, -2*y);
  PVector out = new PVector(-exp(x), 1);
  return out;
}
PVector newton(float x, float y){
  PVector f = new PVector(x, y, f(x, y));
  PVector df = gradf(x, y);
  PVector v = new PVector(df.x/df.mag(), df.y/df.mag(), df.mag());
  return f.sub(v.mult(f(x, y)/df.mag()));
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