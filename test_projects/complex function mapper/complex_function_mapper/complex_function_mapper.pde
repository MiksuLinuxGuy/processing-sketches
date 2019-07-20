int x_low = -10;
int x_up = 10;
int y_low = -10;
int y_up = 10;
int f = 0; // 0 - e^z; 1 - z^z; 2 - 1/z;
float n;
float m;
float r;
float theta;
float e = 2.71828;
float x;
float y;
float z;
float w;

void setup(){
  
  for(int j = y_low; j <= y_up; j++){
    for(int i = x_low; i <= x_up; i++){
      println("(" + i + ", " + j + ")" + " -> " + "(" + functionRe(i, j) + ", " + functionIm(i, j) + ")");
    }
  }
}

float functionRe(float a, float b){
  if(f == 0){
    n = pow(e, a);
    m = cos(b);
    return n*m;
  } else if(f == 1) {
    r = sqrt(pow(a, 2) + pow(b, 2));
    theta = atan(b / a);
    x = cos(theta * a);
    y = sin(theta * a);
    z = cos(b * log(r));
    w = sin(b * log(r));
    n = pow(r, a) * pow(e,  -atan(b / a) * b);
    return n * (x*z - y*w);
  } else if(f == 2){
    n = pow(a, 2) + pow(b, 2);
    return a / n;
  } else {
    return a;
  }
}

float functionIm(float a, float b){
  if(f == 0){
    n = pow(e, a);
    m = sin(b);
    return n*m;
  } else if(f == 1) {
    r = sqrt(pow(a, 2) + pow(b, 2));
    theta = atan(b / a);
    x = cos(theta * a);
    y = sin(theta * a);
    z = cos(b * log(r));
    w = sin(b * log(r));
    n = pow(r, a) * pow(e,  -atan(b / a) * b);
    return n * (x*w + y*z);
  } else if(f == 2){
    n = pow(a, 2) + pow(b, 2);
    return - b / n;
  } else {
    return b;
  }
}