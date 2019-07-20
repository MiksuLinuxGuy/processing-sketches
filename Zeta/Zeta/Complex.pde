class Complex{

float x; float y;
int infty = 10;

  Complex(float x, float y){
    this.x = x; this.y = y;
  }
  
  Complex addd(float a){
    return new Complex(x+a, y);
  }
  Complex addd(Complex a){
    return new Complex(x+a.x, y+a.y);
  }
  
  Complex multi(float a){
    return new Complex(a*x, a*y);
  }
  Complex multi(Complex a){
    return new Complex(x*a.x-y*a.y, x*a.y+y*a.x);
  }
  
  Complex power(int n){
    Complex out = new Complex(1, 0);
    for(int i = 0; i < n; i++){
      out = out.multi(this);
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
  Complex exponent(int n){
    if(n == 1){
      return new Complex(1, 0);
    }
    return new Complex(pow(n, x)*cos(log(n)*y), pow(n, x)*sin(log(n)*y));
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