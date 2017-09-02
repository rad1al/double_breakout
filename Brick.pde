class Brick {
  float x, y; 
  float w = 100; 
  float h = 50;
  color c;
  float ulx, uly; //Corners of the brick. 
  float urx, ury;
  float llx, lly;
  float lrx, lry;
  boolean visible = true;

  Brick(float x, float y, color c) {
    this.x = x;
    this.y = y; // x = 0, y = 0  
    this.ulx = x;
    this.uly = y;
    this.urx = x+w;
    this.ury = y;
    this.llx = x;
    this.lly = y-h;
    this.lrx = x+w;
    this.lry = y-h;
    this.c = c;
  } 

  void _draw() {
    if (visible) {
      fill(this.c);
      rect(cx(x), cy(y), w, h);
      //ellipse(cx(lrx), cy(lry), 20, 20);
    }
  }

  void highlight_corners() {
    // draw circles on the corners of the brick to help with debugging.
    fill(#FF6C6C);
    ellipse(cx(ulx), cy(uly), 20, 20);
    ellipse(cx(urx), cy(ury), 20, 20);
    ellipse(cx(llx), cy(lly), 20, 20);
    ellipse(cx(lrx), cy(lry), 20, 20);
  }
}

void create_bricks() {
  // initialize bricks with different color for each layer.
  for (int i = -6; i < 5; i++) { //creates 7
    bricks.add(new Brick(i*100+50, -50, #ffb3ba)); //Pastel red
    bricks.add(new Brick(i*100+50, 0, #ffdfba)); //Pastel orange
    bricks.add(new Brick(i*100+50, 50, #ffffba)); //Pastel yellow
    bricks.add(new Brick(i*100+50, 100, #baffc9)); //Pastel green
    bricks.add(new Brick(i*100+50, 150, #bae1ff)); //Pastel blue

  }
}

void draw_bricks() {
  for (int i = 0; i < bricks.size(); i++) {
    bricks.get(i)._draw();
  }
}