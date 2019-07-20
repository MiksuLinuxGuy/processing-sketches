
int r = 100;
float sidelength;
int n = 3;

void setup(){
  size(640, 480);
}

void draw(){
  background(51);
  sidelength = tan(TWO_PI / (2 * n)) * 2 * r;
  noFill();
  pushMatrix();
  translate(width / 2, height / 2);
  if(n != 4){                     //Just to make it look better, because a square doesn't look good when it's twisted 45 degs....
    rotate(TWO_PI / (2 * n));
  }
  stroke(255);
  point(0, 0);
  for(int i = 0; i <= n; i++){
    line(-sidelength / 2, -r, sidelength / 2, -r);
    rotate(TWO_PI / n);
  }
  popMatrix();
  textSize(16);
  fill(255, 0, 0);
  text(n + "-gon", 560, 20);
}

void keyPressed(){
  if(key == '+'){
    n++;
  } else if(key == '-' && n > 3){
    n--;
  } else if(key == 'r'){
    n = 3;
  }
}