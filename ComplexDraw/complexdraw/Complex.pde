class Complex{

float x; float y;
int infty = 10;
final float e = 2.7182818284;

  Complex(float x, float y){
    this.x = x; this.y = y;
  }
  
  Complex addd(float a){ // z + a
    return new Complex(x+a, y);
  }
  Complex addd(Complex a){ // z + a
    return new Complex(x+a.x, y+a.y);
  }
  
  Complex multi(float a){ // z * a
    return new Complex(a*x, a*y);
  }
  Complex multi(Complex a){ // z * a
    return new Complex(x*a.x-y*a.y, x*a.y+y*a.x);
  }
  
  Complex power(int n){ // z^n
    Complex out = new Complex(1, 0);
    for(int i = 0; i < n; i++){
      out = out.multi(this);
    }
    return out;
  }
  
  Complex exponent(float a){ // a^z
    if(a == 1){
      return new Complex(1, 0);
    } else if(a >= 0){
      return new Complex(pow(a, x)*cos(log(a)*y), pow(a, x)*sin(log(a)*y));
    } else {
      return null;
    }
  }
  
  Complex recip(){ // 1 / z
    return new Complex(x/(x*x+y*y), -y/(x*x+y*y));
  }
  
  Complex sinn(){ // sin(z)
    Complex i = new Complex(0, 1);
    Complex out = this.multi(i);
    out = out.exponent(e).addd(out.multi(-1).exponent(e).multi(-1));
    out = out.multi(i.multi(2).recip());
    return out;
  }
  
  Complex coss(){ // cos(z)
    Complex i = new Complex(0, 1);
    Complex out = this.multi(i);
    out = out.exponent(e).addd(out.multi(-1).exponent(e));
    out = out.multi(0.5);
    return out;
  }
  
  void show(){ println(x + " + " + y + "i"); }
  
  int fact(int a){ // a!
    int out = 1;
    for(int i = 1; i <= a; i++){
      out *= i;
    }
    return out;
  }

}
