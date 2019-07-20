class Cube{

  Face[][][] clearCube(Face[][][] f){
    
    for(int i = 0; i < 6; i++){
      for(int j = 0; j < 3; j++){
        for(int k = 0; k < 3; k++){
          f[i][j][k] = new Face(i, j, k);
          switch(i){
            case 0:
              f[i][j][k].faceC = color(255);
              break;
            case 1:
              f[i][j][k].faceC = color(255, 0, 0);
              break;
            case 2:
              f[i][j][k].faceC = color(0, 255, 0);
              break;
            case 3:
              f[i][j][k].faceC = color(255, 255, 0);
              break;
            case 4:
              f[i][j][k].faceC = color(255, 122, 0);
              break;
            case 5:
              f[i][j][k].faceC = color(0, 0, 255);
              break;
          }
        }
      }
    }
    
    return f;
  }

}