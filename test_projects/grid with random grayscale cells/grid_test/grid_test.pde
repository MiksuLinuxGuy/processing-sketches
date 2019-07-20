
int x = 0;
int y = 0;
int cellsize = 50;
int cols;
int rows;
boolean done = false;
int r_scale;
int[][] cells;

void setup(){
  size(500, 500);
  background(51);
  
  cols = width / cellsize;
  rows = height / cellsize;
  
  cells = new int[cols][rows];
}

void draw(){
  if(!done){
    r_scale = (int)random(0, 255);
    
    if(x >= cols){
      x = 0;
      y++;
    } else if(y >= rows - 1 && x >= cols - 1){
      done = true;
    }
    
    stroke(0);
    fill(r_scale);
    rect(x * cellsize, y * cellsize, cellsize, cellsize);
    cells[x][y] = r_scale;
    
    x++;
  }
  
  
}