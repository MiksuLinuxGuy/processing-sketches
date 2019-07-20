float n = 13;
int[] fibs;
float bs = 1; //for base scaling
int z = 50;

//zoomed-out: n = 13, bs = 1
//zoomed-in: n = 3, bs = 115
//bs = 1.14 * z + 1
//n = -0.1 * z + 13

void setup(){
  size(640, 480);
}

void draw(){
  background(51);
  translate(width / 2, height / 2);
  noFill();
  stroke(255);
  
  bs = 1.14 * z + 1;
  n = -0.1 * z + 13;
  
  fibs = new int[(int)ceil(n)];
  fibs[0] = 1;
  fibs[1] = 1;
  for(int i = 2; i < n; i++){
    fibs[i] = fibs[i - 1] + fibs[i - 2];
  }
  
  rect(0, -fibs[0] * bs, fibs[0] * bs, fibs[0] * bs);
  translate(0, -fibs[0] * bs);
  arc(0, 0, fibs[0] * bs * 2, fibs[0] * bs * 2, 0, HALF_PI);
  rect(0, -fibs[1] * bs, fibs[1] * bs, fibs[1] * bs);
  arc(0, 0, fibs[0] * bs * 2, fibs[0] * bs * 2, -HALF_PI, 0);
  translate(0, -fibs[1] * bs);
  rotate(PI);
  for(int i = 2; i < n; i++){
    rect(0, -fibs[i] * bs, fibs[i] * bs, fibs[i] * bs);
    translate(0, -fibs[i] * bs);
    rotate(HALF_PI);
    arc(0, 0, fibs[i] * bs * 2, fibs[i] * bs * 2, -HALF_PI, 0);
    translate(0, -fibs[i] * bs);
    rotate(PI);
  }
}

void keyPressed(){
  if(key == '+' && z <= 95){
    z += 5;
  } else if(key == '-' && z >= 5){
    z -= 5;
  }
}