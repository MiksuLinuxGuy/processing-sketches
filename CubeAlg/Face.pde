class Face{

  int colors[][][];
  int side;
  int xi;
  int yi;
  color faceC;
  
  Face(int side, int xi, int yi){
    this.side = side;
    this.xi = xi;
    this.yi = yi;
  }
  
  void drawFace(){
    pushMatrix();
    switch(side){
      case 0:
        translate((xi-1)*cubeSize/3, -cubeSize/2, (yi-1)*cubeSize/3);
        rotateX(PI/2);
        fill(faceC);
        rect(0, 0, cubeSize/3, cubeSize/3);
        break;
      case 1:
        translate(cubeSize/2, (xi-1)*cubeSize/3, -(yi-1)*cubeSize/3);
        rotateY(PI/2);
        fill(faceC);
        rect(0, 0, cubeSize/3, cubeSize/3);
        break;
      case 2:
        translate((xi-1)*cubeSize/3, (yi-1)*cubeSize/3, cubeSize/2);
        fill(faceC);
        rect(0, 0, cubeSize/3, cubeSize/3);
        break;
      case 3:
        translate((xi-1)*cubeSize/3, cubeSize/2, (yi-1)*cubeSize/3);
        rotateX(PI/2);
        fill(faceC);
        rect(0, 0, cubeSize/3, cubeSize/3);
        break;
      case 4:
        translate(-cubeSize/2, (xi-1)*cubeSize/3, -(yi-1)*cubeSize/3);
        rotateY(PI/2);
        fill(faceC);
        rect(0, 0, cubeSize/3, cubeSize/3);
        break;
      case 5:
        translate((xi-1)*cubeSize/3, (yi-1)*cubeSize/3, -cubeSize/2);
        fill(faceC);
        rect(0, 0, cubeSize/3, cubeSize/3);
        break;
    }
    popMatrix();
  }

}