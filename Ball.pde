class Ball {
  float x, y; 
  float w = 50; 
  float d = 50;
  float xd = 1;
  float yd = 2;
  color c = #FFFFFF;

  Ball(float x, float y) {
    this.x = x;
    this.y = y;
  } 

  void move() {
    this.x += this.xd;
    this.y += this.yd;
  }
  
  void _draw() {
    fill(c);
    ellipse(cx(x), cy(y), w, d);
  }
}