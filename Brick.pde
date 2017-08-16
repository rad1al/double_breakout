class Brick {
  float x, y; 
  float w = 100; 
  float d = 50;
  color c;
  float vtx1, vtx2, vtx3, vtx4; //Corners of the brick. 

  Brick(float x, float y) {
    this.x = x;
    this.y = y;
  } 

  void _draw() {
    rect(cx(x), cy(y), w, d);
  }
}

void create_bricks() {
  for (int i = -3; i < 4; i++) {
    bricks.add(new Brick(i*110, 50));
  }
}

void draw_bricks() {
  for (int i = 0; i < bricks.size(); i++) {
    bricks.get(i)._draw();
  }
}