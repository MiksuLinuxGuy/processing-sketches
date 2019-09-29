import com.hamoid.*;

int bmargin = 30;
int hmargin = 30;
int tickH = 8; // The height of the ticks on the coordinate axis

PVector[] path = new PVector[10000]; // The perimeter of the circle

PVector[] bc1 = new PVector[100]; // c = -0.05
PVector[] bc2 = new PVector[100]; // c = -3
PVector[] bc3 = new PVector[100]; // c = -0.2
PVector[] bc4 = new PVector[100]; // c = -0.1

Ball b1;
Ball b2;
Ball b3;
Ball b4;

float dt = 0.00001;
float time = 0;

VideoExport vE;

void setup(){
  size(700,700);
  // Generate the points of the fourth of the cicle
  /*{{{*/
  float c;
  for(int i = 0; i < path.length/2; i++){
    path[i] = new PVector(0, 0);
    c = map(i, 0, ceil(path.length/2-1), -0.0001, -0.03);
    path[i].x = c*(sin(1/sqrt(-c))-1/sqrt(-c));
    path[i].y = c*(1-cos(1/sqrt(-c)));
  }
  for(int i = ceil(path.length/2-1); i < 0.75*path.length; i++){
    path[i] = new PVector(0, 0);
    c = map(i, ceil(path.length/2-1), ceil(0.75*path.length-1), -0.03, -10);
    path[i].x = c*(sin(1/sqrt(-c))-1/sqrt(-c));
    path[i].y = c*(1-cos(1/sqrt(-c)));
  }
  for(int i = ceil(0.75*path.length-1); i < path.length; i++){
    path[i] = new PVector(0, 0);
    c = map(i, ceil(0.75*path.length-1), path.length-1, -10, -1000);
    path[i].x = c*(sin(1/sqrt(-c))-1/sqrt(-c));
    path[i].y = c*(1-cos(1/sqrt(-c)));
  }
  /*}}}*/

  // Generate the points of the brachistochromes
  /*{{{*/
  float th;
  for(int i = 0; i < bc1.length; i++){
    th = map(i, 0, bc1.length-1, -1/sqrt(0.05), -0.1); // The last argument is offset from zero so that the derivative won't be the zero vector
    bc1[i] = new PVector(-0.05*(th-sin(th)), -0.05*(1-cos(th)));
  }
  for(int i = 0; i < bc2.length; i++){
    th = map(i, 0, bc2.length-1, -1/sqrt(3), -0.1);
    bc2[i] = new PVector(3*(th-sin(th)), -3*(1-cos(th)));
  }
  for(int i = 0; i < bc3.length; i++){
    th = map(i, 0, bc3.length-1, -1/sqrt(0.2), -0.1);
    bc3[i] = new PVector(0.2*(th-sin(th)),-0.2*(1-cos(th)));
    bc3[i].sub(new PVector(0.2*(-1/sqrt(0.2)-sin(-1/sqrt(0.2))), -0.2*(1-cos(-1/sqrt(0.2))))); // Translate br.chrone
  }
  for(int i = 0; i < bc4.length; i++){
    th = map(i, 0, bc4.length-1, -1/sqrt(0.1), -0.1);
    bc4[i] = new PVector(-0.1*(th-sin(th)), -0.1*(1-cos(th)));
    bc4[i].sub(new PVector(-0.1*(-1/sqrt(0.1)-sin(-1/sqrt(0.1))), -0.1*(1-cos(-1/sqrt(0.1)))));
  }
  /*}}}*/

  // Initialize balls
  /*{{{*/
  b1 = new Ball(bc1[99].x, bc1[99].y);
  b1.c = -0.05;
  b1.cInd = 1;

  b2 = new Ball(bc2[99].x, bc2[99].y);
  b2.c = -3;
  b2.cInd = 2;

  b3 = new Ball(bc3[99].x, bc3[99].y);
  b3.c = -0.2;
  b3.cInd = 3;

  b4 = new Ball(bc4[99].x, bc4[99].y);
  b4.c = -0.1;
  b4.cInd = 4;
  /*}}}*/

  // Calculate derivatives
  /*{{{*/
  for(int i = 0; i < bc1.length; i++){
    th = map(i, 0, bc1.length-1, -1/sqrt(0.05), -0.1); // The last argument is offset from zero so that the derivative won't be the zero vector
    b1.dbc[i] = new PVector(0.05*(1-cos(th)), 0.05*(sin(th)));
  }
  for(int i = 0; i < bc2.length; i++){
    th = map(i, 0, bc2.length-1, -1/sqrt(3), -0.1);
    b2.dbc[i] = new PVector(3*(1-cos(th)), -3*(sin(th)));
  }
  for(int i = 0; i < bc3.length; i++){
    th = map(i, 0, bc3.length-1, -1/sqrt(0.2), -0.1);
    b3.dbc[i] = new PVector(0.2*(1-cos(th)), -0.2*(sin(th)));
  }
  for(int i = 0; i < bc4.length; i++){
    th = map(i, 0, bc4.length-1, -1/sqrt(0.1), -0.1);
    b4.dbc[i] = new PVector(-0.1*(1-cos(th)), -0.1*(sin(th)));
  }
  /*}}}*/
  
  vE = new VideoExport(this, "circle.mp4");
  vE.startMovie();
}

void draw(){
  background(255);
  noFill();

  // Draw the coordinate plane
  /*{{{*/
  stroke(170);
  strokeWeight(1);
  for(int i = 0; i < 7; i++){
    line(bmargin+hmargin+i*(width-2*(bmargin+hmargin))/6, bmargin, bmargin+hmargin+i*(width-2*(bmargin+hmargin))/6, height-bmargin);
    line(bmargin, bmargin+hmargin+i*(height-2*(bmargin+hmargin))/6, width-bmargin, bmargin+hmargin+i*(height-2*(bmargin+hmargin))/6);
  }

  stroke(0);
  strokeWeight(3);
  square(bmargin, bmargin, width-2*bmargin);

  strokeWeight(2);
  line(width/2, bmargin, width/2, height-bmargin);
  line(bmargin, height/2, width-bmargin, height/2);

  line(width-bmargin-hmargin, height/2-tickH, width-bmargin-hmargin, height/2+tickH);
  line(bmargin+hmargin, height/2-tickH, bmargin+hmargin, height/2+tickH);
  fill(0);
  textSize(16);
  textAlign(CENTER, BOTTOM);
  text("1/2", width-bmargin-hmargin, height/2-tickH-1);
  text("-1/2", bmargin+hmargin, height/2-tickH-1);
  /*}}}*/

  noFill();
  // Draw the circle
  /*{{{*/
  PVector tmpV = new PVector(0,0);
  stroke(10, 210, 50);
  beginShape(); // Draw the fourth of the circle
  vertex(width/2, height/2);
  for(int i = 0; i < path.length; i++){
    vertex(pointToScreen(path[i]).x, pointToScreen(path[i]).y);
  }
  vertex(pointToScreen(new PVector(0,-0.5)).x, pointToScreen(new PVector(0,-0.5)).y);
  endShape();
  beginShape(); // Draw the reflection along x axis
  vertex(width/2, height/2);
  for(int i = 0; i < path.length; i++){
    tmpV = path[i].copy();
    tmpV.x = -tmpV.x;
    vertex(pointToScreen(tmpV).x, pointToScreen(tmpV).y);
  }
  vertex(pointToScreen(new PVector(0,-0.5)).x, pointToScreen(new PVector(0,-0.5)).y);
  endShape();
  beginShape(); // Draw the reflection along y axis
  vertex(width/2, height/2);
  for(int i = 0; i < path.length; i++){
    tmpV = path[i].copy();
    tmpV.y = -tmpV.y;
    vertex(pointToScreen(tmpV).x, pointToScreen(tmpV).y);
  }
  vertex(pointToScreen(new PVector(0,0.5)).x, pointToScreen(new PVector(0,0.5)).y);
  endShape();
  beginShape(); // Draw the reflection along both b and y axis
  vertex(width/2, height/2);
  for(int i = 0; i < path.length; i++){
    tmpV = path[i].copy();
    tmpV.x = -tmpV.x;
    tmpV.y = -tmpV.y;
    vertex(pointToScreen(tmpV).x, pointToScreen(tmpV).y);
  }
  vertex(pointToScreen(new PVector(0,0.5)).x, pointToScreen(new PVector(0,0.5)).y);
  endShape();
  /*}}}*/

  // Draw the brachistochromes
  /*{{{*/
  stroke(255, 0, 0);
  beginShape();
  for(int i = 0; i < bc1.length; i++){
    vertex(pointToScreen(bc1[i]).x, pointToScreen(bc1[i]).y);
  }
  endShape();
  beginShape();
  for(int i = 0; i < bc2.length; i++){
    vertex(pointToScreen(bc2[i]).x, pointToScreen(bc2[i]).y);
  }
  endShape();
  beginShape();
  for(int i = 0; i < bc3.length; i++){
    vertex(pointToScreen(bc3[i]).x, pointToScreen(bc3[i]).y);
  }
  endShape();
  beginShape();
  for(int i = 0; i < bc4.length; i++){
    vertex(pointToScreen(bc4[i]).x, pointToScreen(bc4[i]).y);
  }
  endShape();
  /*}}}*/

  // Animate
  /*{{{*/
  if(0.0002 < time && time <= 0.0003){
    // Fade in the balls
    float fadeAlpha = map(time, 0.0002, 0.0003, 0, 255);
    b1.draw(bc1, fadeAlpha);
    b2.draw(bc2, fadeAlpha);
    b3.draw(bc3, fadeAlpha);
    b4.draw(bc4, fadeAlpha);
    // Fade in the timer
    textSize(28);
    textAlign(LEFT, TOP);
    noFill();
    stroke(0, 50, 80, fadeAlpha);
    rect(65, 90, 88, 32);
    fill(0, 0, 0, fadeAlpha);
    text(0.000, 60, 90);
  } else if (0.0003 < time){
    // Draw the balls and move if not finished
    b1.draw(bc1);
    b2.draw(bc2);
    b3.draw(bc3);
    b4.draw(bc4);
    if(b1.ind > 0){b1.move(bc1);}
    if(b2.ind > 0){b2.move(bc2);}
    if(b3.ind > 0){b3.move(bc3);}
    if(b4.ind > 0){b4.move(bc4);}

    // Draw the timer
    if(time <= 0.0013){
      textSize(28);
      textAlign(LEFT, TOP);
      noFill();
      stroke(0, 50, 80);
      rect(65, 90, 88, 32);
      fill(0);
      text(1000*(time-0.0003), 60, 90);
    } else {
      textSize(28);
      textAlign(LEFT, TOP);
      noFill();
      stroke(0, 50, 80);
      rect(65, 90, 88, 32);
      fill(0);
      text(1.000, 60, 90);
    }
  }

  time += dt;
  vE.saveFrame();
  if(time > 0.0025){vE.endMovie(); exit();}
  /*}}}*/
}

int iOfPoint(int cInd, PVector p){ // Gives the index of a point on the br.chrone.
  /*{{{*/
  int i = 99; float dotVal = -1;
  PVector cToP;
  do{
    switch(cInd){
      case 1:
        cToP = PVector.sub(p, bc1[i]);
        dotVal = -PVector.dot(b1.dbc[i], cToP);
        break;
      case 2:
        cToP = PVector.sub(p, bc2[i]);
        dotVal = PVector.dot(b2.dbc[i], cToP);
        break;
      case 3:
        cToP = PVector.sub(p, bc3[i]);
        dotVal = PVector.dot(b3.dbc[i], cToP);
        break;
      case 4:
        cToP = PVector.sub(p, bc4[i]);
        dotVal = PVector.dot(b4.dbc[i], cToP);
        break;
    }
    i--;
  }while(dotVal < 0 && i > 0);
  return constrain(i+1, 0, bc1.length-1);
  /*}}}*/
}

PVector pointToScreen(PVector p){
  /*{{{*/
  PVector s = new PVector(0,0);
  s.x = map(p.x, -0.5, 0.5, bmargin+hmargin, width-(bmargin+hmargin));
  s.y = map(p.y, -0.5, 0.5, width-(bmargin+hmargin), bmargin+hmargin);
  return s;
  /*}}}*/
}
void pLine(PVector a, PVector b){
  /*{{{*/
  line(pointToScreen(a).x, pointToScreen(a).y, pointToScreen(b).x, pointToScreen(b).y);
  /*}}}*/
}

class Ball{
  /*{{{*/
  PVector s = new PVector(0, 0);
  PVector v = new PVector(0, 0);
  float c;
  int cInd;
  int ind = 99;

  PVector[] dbc = new PVector[100];

  PVector circCenter = new PVector(0,0);

  Ball(float x, float y){
    s.x = x;
    s.y = y;
  }

  void draw(PVector[] bc, float bAlpha){
    pushStyle();
    noFill();
    stroke(0, 0, 0, bAlpha);
    strokeWeight(1);
    PVector n = dbc[ind].copy().rotate(HALF_PI*sign(dbc[ind].x));
    n.setMag(0.01);
    circCenter = bc[ind].copy().add(n);
    ellipse(pointToScreen(circCenter).x, pointToScreen(circCenter).y, 10, 10);
    popStyle();
  }
  void draw(PVector[] bc){
    pushStyle();
    noFill();
    stroke(0);
    strokeWeight(1);
    PVector n = dbc[ind].copy().rotate(HALF_PI*sign(dbc[ind].x));
    n.setMag(0.01);
    circCenter = bc[ind].copy().add(n);
    ellipse(pointToScreen(circCenter).x, pointToScreen(circCenter).y, 10, 10);
    popStyle();
  }

  void move(PVector[] bc){
    v = dbc[ind].copy().setMag(sqrt(2*(s.y-2*c))); // The velocity is sqrt(2gy) because of the conservation of energy
    if(cInd != 1){v.mult(-1);}
    s.add(PVector.mult(v, dt)); // ds/dt = v <=> ds=v*dt
    ind = iOfPoint(cInd, s);
    s = bc[ind].copy();
  }
  /*}}}*/
}

int sign(float x){if(x>=0){return 1;}else{return -1;}}
