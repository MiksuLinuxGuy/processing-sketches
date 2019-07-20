float limits[] = {-5, 5, -5, 5};
ArrayList<Complex> drawing = new ArrayList<Complex>();
ArrayList<Complex> image = new ArrayList<Complex>();

void setup(){
  size(800, 400);
}

void draw(){
  background(255);
  stroke(0, 0, 0, 100);
  for(int i = ceil(limits[0]); i < limits[1]; i++){
    if(i == 0){
      stroke(0);
      strokeWeight(2);
      line(mapLSpace(i, 0).x, 0, mapLSpace(i, 0).x, height);
      line(mapRSpace(i, 0).x, 0, mapRSpace(i, 0).x, height);
      stroke(0, 0, 0, 100);
      strokeWeight(1);
    } else {
      line(mapLSpace(i, 0).x, 0, mapLSpace(i, 0).x, height);
      line(mapRSpace(i, 0).x, 0, mapRSpace(i, 0).x, height);
    }
  }
  for(int i = ceil(limits[2]); i < limits[3]; i++){
    if(i == 0){
      stroke(0);
      strokeWeight(2);
      line(0, mapLSpace(0, i).y, width, mapLSpace(0, i).y);
      line(0, mapRSpace(0, i).y, width, mapRSpace(0, i).y);
      stroke(0, 0, 0, 100);
      strokeWeight(1);
    } else {
      line(0, mapLSpace(0, i).y, width, mapLSpace(0, i).y);
      line(0, mapRSpace(0, i).y, width, mapRSpace(0, i).y);
    }
  }
  
  strokeWeight(4);
  stroke(50, 20, 170);
  line(width/2, 0, width/2, height);
  strokeWeight(2);
  
  stroke(100, 200, 0);
  int c = 0;
  while(c < drawing.size()-1){
    while(drawing.get(c) != null && drawing.get(c+1) != null && c < drawing.size()-2){
      line(mapLSpace(drawing.get(c)).x, mapLSpace(drawing.get(c)).y, mapLSpace(drawing.get(c+1)).x, mapLSpace(drawing.get(c+1)).y);
      line(mapRSpace(image.get(c)).x, mapRSpace(image.get(c)).y, mapRSpace(image.get(c+1)).x, mapRSpace(image.get(c+1)).y);
      c++;
    }
    c++;
  }
  
  //for(int i = 0; i < drawing.size()-1; i++){
  //  line(mapLSpace(drawing.get(i)).x, mapLSpace(drawing.get(i)).y, mapLSpace(drawing.get(i+1)).x, mapLSpace(drawing.get(i+1)).y);
  //  line(mapRSpace(image.get(i)).x, mapRSpace(image.get(i)).y, mapRSpace(image.get(i+1)).x, mapRSpace(image.get(i+1)).y);
  //}
}

Complex f(Complex z){
  Complex out;
  out = z.sinn();
  return out;
}

void mouseDragged(){
  if(0<mouseX&&mouseX<width/2&&0<mouseY&&mouseY<height){
    drawing.add(mapScreen(mouseX, mouseY));
    image.add(f(mapScreen(mouseX, mouseY)));
  }
}

void mouseReleased(){
  drawing.add(null);
  image.add(null);
}

void keyPressed(){
  if(key == 'r'){
    drawing.clear();
    image.clear();
  }
}

Complex mapScreen(PVector p){
  Complex out; float x; float y;
  x = map(p.x, 0, width/2, limits[0], limits[1]);
  y = map(p.y, 0, height, limits[3], limits[2]);
  out = new Complex(x, y);
  return out;
}
Complex mapScreen(float px, float py){
  Complex out; float x; float y;
  x = map(px, 0, width/2, limits[0], limits[1]);
  y = map(py, 0, height, limits[3], limits[2]);
  out = new Complex(x, y);
  return out;
}

PVector mapLSpace(Complex p){
  PVector out; float x; float y;
  x = map(p.x, limits[0], limits[1], 0, width/2);
  y = map(p.y, limits[2], limits[3], height, 0);
  out = new PVector(x, y);
  return out;
}
PVector mapLSpace(float px, float py){
  PVector out; float x; float y;
  x = map(px, limits[0], limits[1], 0, width/2);
  y = map(py, limits[2], limits[3], height, 0);
  out = new PVector(x, y);
  return out;
}

PVector mapRSpace(Complex p){
  PVector out; float x; float y;
  x = map(p.x, limits[0], limits[1], width/2, width);
  y = map(p.y, limits[2], limits[3], height, 0);
  out = new PVector(x, y);
  return out;
}
PVector mapRSpace(float px, float py){
  PVector out; float x; float y;
  x = map(px, limits[0], limits[1], width/2, width);
  y = map(py, limits[2], limits[3], height, 0);
  out = new PVector(x, y);
  return out;
}
