PVector[] points = new PVector[5000];
PVector[][] field;

void setup(){
  size(640, 480);
  for(int i = 0; i < points.length; i++){
    points[i] = new PVector(int(random(width)), 0);
  }
  
  field = new PVector[width][height];
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      field[x][y] = new PVector(x/2+1, 2*y+5);
      if(field[x][y].mag() > 4){
        field[x][y].setMag(4);
      }
    }
  }
}

void draw(){
  background(10, 10, 30);
  strokeWeight(2);
  
  for(int i = 0; i < points.length; i++){
    if(points[i].x < 0 || points[i].y < 0 || points[i].x >= width || points[i].y >= height){
      points[i] = new PVector(int(random(width)), 0);
    }
    points[i].add(field[floor(points[i].x)][floor(points[i].y)]);
    stroke(150, 210, 255, random(180, 240));
    point(points[i].x, points[i].y);
  }
}
