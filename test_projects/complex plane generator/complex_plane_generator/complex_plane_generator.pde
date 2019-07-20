int m = 20;   //Margin
int s = 30;   //Spacing
int a_w = 8;  //Arrow width
int a_h = 19;  //Arrow height

void setup(){
  size(700, 700);
  background(255);
}

void draw(){
  int r = floor((height / 2 - (m + a_h)) / s);
  int c = floor((width / 2 - (m + a_h)) / s);
  
  stroke(164);
  strokeWeight(1);
  
  textSize(16);
  fill(96);
  
  for(int i = 1; i <= r; i++){              //Numbering on the imaginary axis
    textAlign(RIGHT);
    line(m, height / 2 - s*i, width - m, height / 2 - s*i);
    text(i + "i", width / 2 - a_w, height / 2 - s*i + 5);
    line(m, height / 2 + s*i, width - m, height / 2 + s*i);
    text("-" + i + "i", width / 2 - a_w, height / 2 + s*i + 5);
  }
  
  for(int i = 1; i <= c; i++){
    textAlign(CENTER, BOTTOM);
    line(width / 2 + s*i, m, width / 2 + s*i, height - m);
    text(i, width / 2 + s*i, height / 2);
    line(width / 2 - s*i, m, width / 2 - s*i, height - m);
    text("-" + i, width / 2 - s*i, height / 2);
  }
  
  stroke(43);
  strokeWeight(2);
  
  line(m, height / 2, width - m, height / 2);                            //The x-axis
  line(width / 2 - a_w, m + a_h, width / 2, m);                          //The arrow
  line(width / 2, m, width / 2 + a_w, m + a_h);                          //The arrow
  line(width / 2 - a_w, height - m, width / 2 + a_w, height - m);        //The line in the other end
  
  line(width / 2, m, width / 2, height - m);                             //The y-axis
  line(width - (m + a_h), height / 2 - a_w, width - m, height / 2);      //The arrow
  line(width - m, height / 2, width - (m + a_h), height / 2 + a_w);      //The arrow
  line(m, height / 2 - a_w, m, height / 2 + a_w);                        //The line in the other end
  
  textSize(21);
  fill(96);
  text("Im", width / 2 + 2 * a_w, a_h * 2);
  text("Re", width - (m + a_h + a_h / 5), height / 2 - a_w * 2);
  
  save("plane.png");
}