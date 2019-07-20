class AlgParser{
  
  ArrayList<Integer> alg = new ArrayList<Integer>(); //[1-6] - URFDLB; [1-3] - null, ', 2
  
  ArrayList<Integer> parseAlg(String in){
    alg.clear();
    
    for(int i = 0; i < in.length(); i++){
      switch(Character.toString(in.charAt(i)).toUpperCase()){
        case "U":
          addToAlg(in, i, 1);
          break;
        case "R":
          addToAlg(in, i, 2);
          break;
        case "F":
          addToAlg(in, i, 3);
          break;
        case "D":
          addToAlg(in, i, 4);
          break;
        case "L":
          addToAlg(in, i, 5);
          break;
        case "B":
          addToAlg(in, i, 6);
          break;
        default:
          break;
      }
    }
    
    return alg;
  }
  
  void addToAlg(String in , int i, int face){
    try{
      switch(Character.toString(in.charAt(i+1)).toUpperCase()){
        case "2":
          alg.add(face*10+2);
          break;
        case "'":
          alg.add(face*10+3);
          break;
        default:
          alg.add(face*10+1);
          break;
      }
    } catch(Exception e){
      alg.add(face*10+1);
    }
  }
}