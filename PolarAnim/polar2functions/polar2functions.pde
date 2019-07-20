import com.hamoid.*;

float[] limits = {-5, 5, -5, 5};
float[] domain = {0, 50};
float x; float y; float t = 0; boolean forw = true; float a = 0.005; int w = 50;
PVector[] points;
PVector[] cart;
PVector[] polar;
PVector[] cart2; PVector[] polar2; PVector[] points2;

PVector c;
PVector d;

int rind = 0;
VideoExport ve;

void setup(){
  size(600, 600); // w = 600, h = round(w*(limits[3]-limits[2])/(limits[1]-limits[0]))
  
  cart = new PVector[round(map(domain[1]-domain[0], 0, limits[1]-limits[0], 0, width))];
  polar = new PVector[cart.length];
  points = new PVector[cart.length];
  cart2 = new PVector[cart.length]; polar2 = new PVector[cart.length];
  points2 = new PVector[cart.length];
  c = new PVector(width/2, height/2);
  
  // Calculating function in cartesian coordinate plane
  for(int i = 0; i < cart.length; i++){
    x = map(i+round(map(domain[0], limits[0], limits[1], 0, width)), 0, width, limits[0], limits[1]);
    if(f(x) >= limits[2] && f(x) <= limits[3]){
      y = map(f(x), limits[2], limits[3], height, 0);
      cart[i] = new PVector(i+round(map(domain[0], limits[0], limits[1], 0, width)), y);
      y = map(-f(x), limits[2], limits[3], height, 0);
      cart2[i] = new PVector(i+round(map(domain[0], limits[0], limits[1], 0, width)), y);
    } else { cart[i] = null; cart2[i] = null;}
  }
  
  // Calculating function in polar coordinate plane
  for(int i = 0; i < polar.length; i++){
    PVector p = new PVector(1, 0);
    x = map(i+round(map(domain[0], limits[0], limits[1], 0, width)), 0, width, limits[0], limits[1]);
    p.rotate(-x);
    if(f(x) >= -sqrt(limits[1]*limits[3]) && f(x) <= sqrt(limits[0]*limits[2])){
      y = map(f(x), -sqrt(limits[0]*limits[0] + limits[2]*limits[2]), sqrt(limits[1]*limits[1] + limits[3]*limits[3]), -c.mag(), c.mag());
      p.setMag(y);
      polar[i] = c.copy().add(p);
      p.mult(-1);
      polar2[i] = c.copy().add(p);
    } else { polar[i] = null; polar2[i] = null; }
  }
  
  ve = new VideoExport(this);
  ve.startMovie();
  
  noFill();
}

void draw(){
  background(255);
  strokeWeight(1);
  stroke(0, 0, 0, 100);
  for(int xi = ceil(limits[0]); xi <= limits[1]; xi++){
    line(map(xi, limits[0], limits[1], 0, width), 0, map(xi, limits[0], limits[1], 0, width), height);
  }
  for(int yi = ceil(limits[2]); yi < limits[3]; yi++){
    line(0, map(yi, limits[2], limits[3], height, 0), width, map(yi, limits[2], limits[3], height, 0));
  }
  strokeWeight(2);
  stroke(0);
  line(0, height/2, width, height/2); line(width/2, 0, width/2, height);
  stroke(100, 200, 0);
  
  for(int i = 0; i < points.length; i++){
    if(cart[i] != null || polar[i] != null){
      d = polar[i].copy().sub(cart[i].copy());
      points[i] = cart[i].copy().add(d.mult(t));
      d = polar2[i].copy().sub(cart2[i].copy());
      points2[i] = cart2[i].copy().add(d.mult(t));
    } else {
      points[i] = null;
      points2[i] = null;
    }
  }
  
  for(int i = 0; i < points.length-1; i++){
    if(points[i] != null && points[i+1] != null){
      line(points[i].x, points[i].y, points[i+1].x, points[i+1].y);
      line(points2[i].x, points2[i].y, points2[i+1].x, points2[i+1].y);
    }
  }
  
  if(w > -1){
    w++;
    if(w > 100){w=-1;}
  } else if(forw){
    t += a;
    if(t >= 1){
      t = 1;
      w++;
      forw = false;
    }
  } else {
    t -= a;
    if(t <= 0){
      t = 0;
      w++;
      forw = true;
      rind = -1;
    }
  }
  
  
  if(rind > -1){
    //save("frames/" + rind + ".png"); rind++;
    ve.saveFrame(); rind++;
  } else { ve.endMovie(); }
  
}

float f(float x){
  return sqrt(x);
}