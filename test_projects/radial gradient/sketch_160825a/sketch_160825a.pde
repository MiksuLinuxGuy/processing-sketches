float n = 0;
int x;
int y;
int i;
int j;

void setup(){
  //size(640, 480);
  size(400, 400);
  //colorMode(HSB, 255);
}

void draw(){
  background(51);
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      i = x - (width / 2);
      j = y - (height / 2);
      n = map(sqrt(i*i+j*j), 0, sqrt((width-(width / 2))*(width-(width / 2)) + (height-(height / 2))*(height-(height / 2))), 0, 255);
      stroke(n);
      point(x, y);
    }
  }
}

//void draw(){
//  background(51);
//  loadPixels();
//  for(int i = 0; i < height*width; i++){
//    y = floor(i / width) + 1;
//    x = floor((i - ((y - 1) * width)) + 1);
//    n = map(sqrt(x^2+y^2), 0 , sqrt(width*width+height*height), 0, 255);
//    pixels[i] = color(n);
//  }
//  updatePixels();
//  noLoop();
//}

//0   1   2   3   4
//5   6   7   8   9
//10  11  12  13  14
//15  16  17  18  19
//20  21  22  23  24