int rotations = 31;
int lineWidth = 5;
float speed = 0.005;
color lineColor = color(0, 150, 100);

PVector p = new PVector(0, 0);
PVector line[] = new PVector[100];
PVector reflections[][] = new PVector[rotations][line.length];
float t = 0;
float gt = 0;

PVector path[] = new PVector[4];

void setup(){
  size(600, 600);
  path[0] = new PVector(0, 0);
  for(int i = 1; i < 4; i++){
    path[i] = new PVector(random(width)-width/2, random(height)-height/2);
  }
  for(int i = 0; i < line.length; i++){
    line[i] = new PVector(0, 0);
    for(int j = 0; j < rotations; j++){
      reflections[j][i] = new PVector(0, 0);
    }
  }
}

void draw(){
  background(255);
  strokeWeight(lineWidth);
  translate(width/2, height/2);
  strokeWeight(lineWidth);
  lineColor = color(127*(cos(gt)+1), 127*(sin(gt*0.5)+1), 127*(cos(gt+2)+1));
  line = shift(line);
  line[0] = bezierPoint(path, t);
  for(int i = 0; i < rotations; i++){
    reflections[i] = shift(reflections[i]);
    reflections[i][0] = bezierPoint(path, t).rotate((i+1)*TWO_PI/(rotations+1));
  }
  for(int i = 0; i < line.length-2; i++){
    stroke(lerp(lineColor, i/(float)line.length));
    line(line[i].x, line[i].y, line[i+1].x, line[i+1].y);
    for(int j = 0; j < rotations; j++){
      line(reflections[j][i].x, reflections[j][i].y, reflections[j][i+1].x, reflections[j][i+1].y);
    }
  }
  t += speed;
  gt += speed;
  if(t >= 1){
    path = genPath(path);
    t = 0;
  }
  //saveFrame("anim/anim####.png");
}

PVector[] genPath(PVector p[]){
  PVector r[] = new PVector[4];
  r[0] = p[3];
  PVector l = p[3].copy().sub(p[2]);
  r[1] = p[3].copy().add(l.setMag(random(100)+90));
  r[2] = new PVector(random(width)-width/2, random(height)-height/2);
  r[3] = new PVector(random(width)-width/2, random(height)-height/2);
  return r;
}

PVector[] shift(PVector p[]){
  PVector r[] = new PVector[p.length];
  r[0] = p[0];
  for(int i = 1; i < p.length-1; i++){
    r[i] = p[i-1];
  }
  return r;
}

void bezier(PVector p[]){
  bezier(p[0].x, p[0].y, p[1].x, p[1].y, p[2].x, p[2].y, p[3].x, p[3].y);
}

PVector bezierPoint(PVector p[], float t){
  PVector r = new PVector();
  r.x = bezierPoint(p[0].x, p[1].x, p[2].x, p[3].x, t);
  r.y = bezierPoint(p[0].y, p[1].y, p[2].y, p[3].y, t);
  return r;
}

color lerp(color c, float t){
  color r = color(
      (255-red(c))*t+red(c),
      (255-green(c))*t+green(c),
      (255-blue(c))*t+blue(c)
      );
  return r;
}
