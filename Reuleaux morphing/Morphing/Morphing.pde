int tri[][] = new int[3][2];
int a = 200;
float t = 0.075;
float g = 9.81;
float s[] = new float[3]; float v[] = {0.0, 0.0, 0.0}; float acc[] = {0.0, 0.0, 0.0};

float angl[] = {0.0, PI, -PI/3};
float k = 0.01;
float m = 1;

float slide = 0.0;

int tric = 0;

void setup(){

  size(600, 600);
  tri[0][0] = width / 2; tri[0][1] = 25;  // Define triangle
  tri[1][0] = floor(tri[0][0] + a*sin(PI/6)); tri[1][1] = floor(tri[0][1] + a*cos(PI/6));
  tri[2][0] = floor(tri[0][0] - a*sin(PI/6)); tri[2][1] = floor(tri[0][1] + a*cos(PI/6));
  
  for(int i = 1; i < 3; i++){
    s[i] = angl[i]*a;
  }
  
}

void draw(){
  
  background(255);  // Set graphics
  strokeWeight(2);
  noFill();
  strokeCap(ROUND);
  strokeJoin(ROUND);
  
  beginShape();  // Draw trianlge
  for(int i = 0; i < 3; i++){
    stroke(tric);
    vertex(tri[i][0], tri[i][1]);
  }
  endShape(CLOSE);
  
  stroke(0);
  
  if(angl[0] <= PI/3){
    
    acc[0] = t*(g*cos(s[0]/a)-(sgn(acc[0]))*(k*pow(v[0], 2))/m);
    v[0] += acc[0];
    s[0] += v[0];
    
    angl[0] = s[0] / a;
    
    tri[1][0] = floor(tri[2][0] + a*cos( angl[0] ));
    tri[1][1] = floor(tri[2][1] + a*sin( angl[0] ));
    
    tri[0][0] = floor(tri[2][0] + a*cos( angl[0] - PI/3 ));
    tri[0][1] = floor(tri[2][1] + a*sin( angl[0] - PI/3 ));
    
    arc(tri[2][0], tri[2][1], 2*a, 2*a, 0, angl[0]);
    
  } else if(angl[1] >= TWO_PI/3){
    
    acc[1] = t*(g*cos(s[1]/a)-(sgn(acc[1]))*(k*pow(v[1], 2))/m);
    v[1] += acc[1];
    s[1] += v[1];
    
    angl[1] = s[1] / a;
    
    tri[1][0] = floor(tri[0][0] + a*cos( angl[1] - PI/3 ));
    tri[1][1] = floor(tri[0][1] + a*sin( angl[1] - PI/3 ));
    
    tri[2][0] = floor(tri[0][0] + a*cos( angl[1] ));
    tri[2][1] = floor(tri[0][1] + a*sin( angl[1] ));
    
    arc(tri[2][0], tri[2][1], 2*a, 2*a, angl[1]-PI, angl[1] + PI/3 - PI);
    arc(tri[0][0], tri[0][1], 2*a, 2*a, angl[1]-PI/3, TWO_PI/3);
    
  } else if(angl[2] <= PI){
    
    acc[2] = t*(g*cos(s[2]/a)-(sgn(acc[2]))*(k*pow(v[2], 2))/m);
    v[2] += acc[2];
    s[2] += v[2];
    
    angl[2] = s[2] / a;
    
    tri[0][0] = floor(tri[2][0] + a*cos( angl[2] ));
    tri[0][1] = floor(tri[2][1] + a*sin( angl[2] ));
    
    tri[1][0] = floor(tri[2][0] + a*cos( angl[2] + PI/3 ));
    tri[1][1] = floor(tri[2][1] + a*sin( angl[2] + PI/3 ));
    
    arc(tri[2][0], tri[2][1], 2*a, 2*a, angl[2], angl[2] + PI/3);
    arc(tri[0][0], tri[0][1], 2*a, 2*a, PI + angl[2] - PI/3, PI + angl[2]);
  
  } else if(slide <= PI/6){
    
    tri[0][0] = tri[2][0] - a;
    tri[0][1] = tri[2][1];
    
    tri[1][0] = tri[2][0] - a/2;
    tri[1][1] = floor(tri[2][1] - a*sin( PI/3 ));
    
    arc(tri[2][0], tri[2][1], 2*a, 2*a, PI, PI + PI/3);
    arc(tri[0][0], tri[0][1], 2*a, 2*a, -PI/3, 0);
    
    arc(tri[1][0], tri[1][1], 2*a, 2*a, PI/2 - slide, PI/2 + slide);
    
    slide += 0.01;
  
  } else {//if(tric <= 350){
    arc(tri[2][0], tri[2][1], 2*a, 2*a, PI, PI + PI/3);
    arc(tri[0][0], tri[0][1], 2*a, 2*a, -PI/3, 0);
    arc(tri[1][0], tri[1][1], 2*a, 2*a, PI/3, TWO_PI/3);
    
    tric += 4;
  }
  //else {
  //  tri[0][0] = width / 2; tri[0][1] = 25;  // Define triangle
  //  tri[1][0] = floor(tri[0][0] + a*sin(PI/6)); tri[1][1] = floor(tri[0][1] + a*cos(PI/6));
  //  tri[2][0] = floor(tri[0][0] - a*sin(PI/6)); tri[2][1] = floor(tri[0][1] + a*cos(PI/6));
    
  //  angl[0] = 0.0;
  //  angl[1] = PI;
  //  angl[2] = -PI/3;
    
  //  for(int i = 1; i < 3; i++){
  //    acc[i] = 0.0;
  //    v[i] = 0.0;
  //    s[i] = angl[i]*a;
  //  }
    
  //  slide = 0.0; tric = 0;
    
  //}

  //drawIndicators();
}

int sgn(float a){

  if(a >= 0){
    return 1;
  } else {
    return -1;
  }

}

void drawIndicators(){

  strokeWeight(10);
  
  stroke(255, 0, 0);
  point(tri[0][0], tri[0][1]);
  
  stroke(0, 255, 0);
  point(tri[1][0], tri[1][1]);
  
  stroke(0, 0, 255);
  point(tri[2][0], tri[2][1]);

}
