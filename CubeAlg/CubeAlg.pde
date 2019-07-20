import peasy.*;

public int cubeSize = 300;
Face face[][][] = new Face[6][3][3]; //URFDLB
String alg = "";

PeasyCam cam;

AlgParser ap = new AlgParser();
ArrayList<Integer> parsed = new ArrayList<Integer>();

Executer e = new Executer();

boolean typeCommand;
boolean keyDown;

Cube c = new Cube();

void setup(){
  size(600, 600, P3D);
  cam = new PeasyCam(this, 700);
  textSize(24);
  
  face = c.clearCube(face);
}

void draw(){
  background(0);
  stroke(100);
  ambientLight(255, 255, 255);
  rectMode(CENTER);
  
  for(int i = 0; i < 6; i++){
    for(int j = 0; j < 3; j++){
      for(int k = 0; k < 3; k++){
        face[i][j][k].drawFace();
      }
    }
  }
  
  if(keyPressed && keyCode == TAB && !keyDown){
    typeCommand = !typeCommand;
    keyDown = true;
  }
  
  if(keyPressed && typeCommand && keyCode == ENTER && !keyDown){
    parsed = ap.parseAlg(alg);
    face = e.execute(face, parsed);
    alg = "";
    keyDown = true;
  }
  
  if(!keyPressed){
    keyDown = false;
  }
  
  if(keyPressed){
    if(key == 'c'){
      face = c.clearCube(face);
    } else if(key == 'e'){
      exit();
    }
  }
  
  cam.beginHUD();
  if(typeCommand){ // Draw Commandline
    fill(255, 255, 255, 150);
    noStroke();
    rectMode(CORNER);
    rect(0, 0, width, 25);
    fill(40, 120, 180);
    text(alg, 0, 22);
  }
  cam.endHUD();
}

void keyPressed(){
  switch(Character.toString(key).toUpperCase()){
    case "B":
      alg += "B";
      break;
    case "D":
      alg += "D";
      break;
    case "F":
      alg += "F";
      break;
    case "L":
      alg += "L";
      break;
    case "R":
      alg += "R";
      break;
    case "U":
      alg += "U";
      break;
    case " ":
      alg += " ";
      break;
    case "'":
      alg += "'";
      break;
    case "2":
      alg += "2";
      break;
  }
  
  if(keyCode == BACKSPACE && alg != null && alg.length() > 0){
    alg = alg.substring(0, alg.length()-1);
  }
}