class Complex{

float x; float y;
int infty = 10;

  Complex(float x, float y){
    this.x = x; this.y = y;
  }
  
  Complex add(float a){
    return new Complex(x+a, y);
  }
  Complex add(Complex a){
    return new Complex(x+a.x, y+a.y);
  }
  
  Complex mult(float a){
    return new Complex(a*x, a*y);
  }
  Complex mult(Complex a){
    return new Complex(x*a.x-y*a.y, x*a.y+y*a.x);
  }
  
  Complex pow(int n){
    Complex out = new Complex(1, 0);
    for(int i = 0; i < n; i++){
      out = out.mult(this);
    }
    return out;
  }
  
  /*
  Complex exponent(int n){
    Complex sum = new Complex(0, 0);
    for(int i = 0; i < infty; i++){
      sum = sum.addd(this.power(i).multi(pow(log(n), i)/fact(i)));
    }
    return sum;
  }
  */
  Complex exp(int n){
    if(n == 1){
      return new Complex(1, 0);
    }
    return new Complex((float)Math.pow(n, x)*cos(log(n)*y), (float)Math.pow(n, x)*sin(log(n)*y));
  }
  
  Complex recip(){
    return new Complex(x/(x*x+y*y), -y/(x*x+y*y));
  }
  
  void show(){ println(x + " + " + y + "i"); }
  
  int fact(int a){
    int out = 1;
    for(int i = 1; i <= a; i++){
      out *= i;
    }
    return out;
  }

}