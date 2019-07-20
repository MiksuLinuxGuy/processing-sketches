int tri[][] = new int[3][2];
int r = 200;
int a;
float s = 0.0; float v = 0.0; float acc = 0.25;

float t = 1.0;
float t2 = 0.0;

float angl = 0.0;
float angl2;

int d[][]  =new int[2][2];

void setup(){

  a = floor(2*pow(r, 2) - 2*pow(r,2)*cos(TWO_PI/3));
  
  size(600, 600);
  
  tri[0][0] = 0; tri[0][1] = -r;  // Define triangle
  tri[1][0] = floor(-r*cos(PI/6)); tri[1][1] = floor(r*sin(PI/6));
  tri[2][0] = floor(r*cos(PI/6)); tri[2][1] = floor(r*sin(PI/6));
  
  
}

void draw(){
  
  translate(width/2, height/2);
  
  background(255);  // Set graphics
  strokeWeight(3);
  noFill();
  strokeCap(ROUND);
  strokeJoin(ROUND);
  
  v += acc;
  s += v;
  
  pushMatrix();
  
  rotate(s/r);
  if(v < 80){
    beginShape();  // Draw trianlge
    for(int i = 0; i < 3; i++){
      stroke(0);
      vertex(tri[i][0], tri[i][1]);
    }
    endShape(CLOSE);
  } else if(t > 0){
    for(int i = 0; i < 3; i++){
      stroke(0);
      beginShape();
      d[0][0] = (tri[i][0]+tri[(i+2)%3][0])/2; d[0][1] = (tri[i][1]+tri[(i+2)%3][1])/2;
      vertex(tri[i][0] + t*d[0][0] - t*tri[i][0], tri[i][1] + t*d[0][1] - t*tri[i][1]);
      vertex(tri[i][0], tri[i][1]);
      d[1][0] = (tri[i][0]+tri[(i+1)%3][0])/2; d[1][1] = (tri[i][1]+tri[(i+1)%3][1])/2;
      vertex(tri[i][0] + t*d[1][0] - t*tri[i][0], tri[i][1] + t*d[1][1] - t*tri[i][1]);
      endShape();
      t -= 0.005;
    }
  } else if(t2 < 2.5){
    stroke(0);
    angl2 = atan(tri[0][1]/(tri[0][0]+0.00001));
    arc(0, 0, 2*r, 2*r, angl2 - t2, angl2 + t2);
    arc(0, 0, 2*r, 2*r, angl2 - TWO_PI/3 - t2, angl2 - TWO_PI/3 + t2);
    arc(0, 0, 2*r, 2*r, angl2 + TWO_PI/3 - t2, angl2 + TWO_PI/3 + t2);
    t2 += 0.01;
  } else {
    a = 0; v= 0; s = 0;
    t = 1; t2 = 0;
    angl = 0;
  }
  
  popMatrix();
}