class Executer{
  
  color tmp[][] = new color[6][3];
  color facetmp[][] = new color[3][3];
  
  Face[][][] execute(Face[][][] f, ArrayList<Integer> alg){
    
    for(int i = 0; i < alg.size(); i++){
      switch(alg.get(i)/10){
        case 1:
          for(int j = 0; j < alg.get(i) % 10; j++){
            f = rotateU(f);
          }
          break;
        case 2:
          for(int j = 0; j < alg.get(i) % 10; j++){
            f = rotateR(f);
          }
          break;
        case 3:
          for(int j = 0; j < alg.get(i) % 10; j++){
            f = rotateF(f);
          }
          break;
        case 4:
          for(int j = 0; j < alg.get(i) % 10; j++){
            f = rotateD(f);
          }
          break;
        case 5:
          for(int j = 0; j < alg.get(i) % 10; j++){
            f = rotateL(f);
          }
          break;
        case 6:
          for(int j = 0; j < alg.get(i) % 10; j++){
            f = rotateB(f);
          }
          break;
      }
    }
    
    return f;
  }
  
  Face[][][] rotateU(Face[][][] f){
    
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        facetmp[i][j] = f[0][i][j].faceC;
      }
    }
    
    for(int i = 0; i < 3; i++){
      tmp[1][i] = f[1][0][i].faceC;
      tmp[2][i] = f[2][i][0].faceC;
      tmp[4][i] = f[4][0][i].faceC;
      tmp[5][i] = f[5][i][0].faceC;
    }
    
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        f[0][i][j].faceC = facetmp[j][2-i];
      }
    }
    
    for(int i = 0; i < 3; i++){
      f[5][i][0].faceC = tmp[4][i];
      f[4][0][i].faceC = tmp[2][2-i];
      f[2][i][0].faceC = tmp[1][i];
      f[1][0][i].faceC = tmp[5][2-i];
    }
    
    return f;
  }
  
  Face[][][] rotateR(Face[][][] f){
    
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        facetmp[i][j] = f[1][i][j].faceC;
      }
    }
    
    for(int i = 0; i < 3; i++){
      tmp[0][i] = f[0][2][i].faceC;
      tmp[5][i] = f[5][2][i].faceC;
      tmp[3][i] = f[3][2][i].faceC;
      tmp[2][i] = f[2][2][i].faceC;
    }
    
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        f[1][i][j].faceC = facetmp[2-j][i];
      }
    }
    
    for(int i = 0; i < 3; i++){
      f[0][2][i].faceC = tmp[2][i];
      f[2][2][i].faceC = tmp[3][2-i];
      f[3][2][i].faceC = tmp[5][i];
      f[5][2][i].faceC = tmp[0][2-i];
    }
    
    return face;
  }
  
  Face[][][] rotateF(Face[][][] f){
    
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        facetmp[i][j] = f[2][i][j].faceC;
      }
    }
    
    for(int i = 0; i < 3; i++){
      tmp[0][i] = f[0][i][2].faceC;
      tmp[1][i] = f[1][i][0].faceC;
      tmp[3][i] = f[3][i][2].faceC;
      tmp[4][i] = f[4][i][0].faceC;
    }
    
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        f[2][i][j].faceC = facetmp[j][2-i];
      }
    }
    
    for(int i = 0; i < 3; i++){
      f[0][i][2].faceC = tmp[4][2-i];
      f[1][i][0].faceC = tmp[0][i];
      f[3][i][2].faceC = tmp[1][2-i];
      f[4][i][0].faceC = tmp[3][i];
    }
    
    return face;
  }
  
  Face[][][] rotateD(Face[][][] f){
    
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        facetmp[i][j] = f[3][i][j].faceC;
      }
    }
    
    for(int i = 0; i < 3; i++){
      tmp[2][i] = f[2][i][2].faceC;
      tmp[1][i] = f[1][2][i].faceC;
      tmp[5][i] = f[5][i][2].faceC;
      tmp[4][i] = f[4][2][i].faceC;
    }
    
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        f[3][i][j].faceC = facetmp[2-j][i];
      }
    }
    
    for(int i = 0; i < 3; i++){
      f[2][i][2].faceC = tmp[4][2-i];
      f[1][2][i].faceC = tmp[2][i];
      f[5][i][2].faceC = tmp[1][2-i];
      f[4][2][i].faceC = tmp[5][i];
    }
    
    return face;
  }
  
  Face[][][] rotateL(Face[][][] f){
    
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        facetmp[i][j] = f[4][i][j].faceC;
      }
    }
    
    for(int i = 0; i < 3; i++){
      tmp[0][i] = f[0][0][i].faceC;
      tmp[2][i] = f[2][0][i].faceC;
      tmp[3][i] = f[3][0][i].faceC;
      tmp[5][i] = f[5][0][i].faceC;
    }
    
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        f[4][i][j].faceC = facetmp[j][2-i];
      }
    }
    
    for(int i = 0; i < 3; i++){
      f[0][0][i].faceC = tmp[5][2-i];
      f[2][0][i].faceC = tmp[0][i];
      f[3][0][i].faceC = tmp[2][2-i];
      f[5][0][i].faceC = tmp[3][i];
    }
    
    return face;
  }
  
  Face[][][] rotateB(Face[][][] f){
    
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        facetmp[i][j] = f[5][i][j].faceC;
      }
    }
    
    for(int i = 0; i < 3; i++){
      tmp[0][i] = f[0][i][0].faceC;
      tmp[1][i] = f[1][i][2].faceC;
      tmp[3][i] = f[3][i][0].faceC;
      tmp[4][i] = f[4][i][2].faceC;
    }
    
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        f[5][i][j].faceC = facetmp[2-j][i];
      }
    }
    
    for(int i = 0; i < 3; i++){
      f[0][i][0].faceC = tmp[1][i];
      f[1][i][2].faceC = tmp[3][2-i];
      f[3][i][0].faceC = tmp[4][i];
      f[4][i][2].faceC = tmp[0][2-i];
    }
    
    return face;
  }

}