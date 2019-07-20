PImage pic; PImage tmp; int picw;
int d = 120;
float a = 0.005; float b = 0.7;

PVector m; PVector p; PVector dir;

boolean grid = false;

void setup(){
  fullScreen();
  pic = loadImage("pic.jpg"); picw = pic.width;
  noFill();
  stroke(255, 255, 255, 50);
}

void draw(){
  background(255);
  tmp = pic.copy();
  tmp.loadPixels();
  for(int i = mouseX-d/2; i <= mouseX+d/2; i++){
    for(int j = mouseY-d/2; j <= mouseY+d/2; j++){
      if(d/2<=i&&i<width-d/2 && d/2<=j&&j<height-d/2){
        if((i-mouseX)*(i-mouseX) + (j-mouseY)*(j-mouseY) <= d*d/4){
          m = new PVector(mouseX, mouseY); p = new PVector(i, j);
          dir = m.copy().sub(p.copy());
          dir.setMag(a*(dir.mag())*(dir.mag())+b*(dir.mag()));
          p = m.add(dir.mult(-1));
          tmp.pixels[j*picw+i] = pic.pixels[(int)p.y*picw+(int)p.x];
        }
      }
    }
  }
  tmp.updatePixels();
  image(tmp, 0, 0);
  //ellipse(mouseX, mouseY, d, d);
}

void mousePressed(){
  if(mouseButton == RIGHT){
    exit();  
  } else {
    if(grid){
      pic = loadImage("pic.jpg"); picw = pic.width;
      grid = false;
    } else {
      pic = loadImage("grid.jpg"); picw = pic.width;
      grid = true;
    }
  }
}