class Paddle {
  float w = 130;
  float h = 10;
  float x, y;
  float ulx, uly; //Corners of the paddle. 
  float urx, ury;
  float llx, lly;
  float lrx, lry;
  float spd = 10;

  Paddle(float x, float y, float spd) {
    this.x = x;
    this.y = y;
    this.ulx = x;
    this.uly = y;
    this.urx = x+w;
    this.ury = y;
    this.llx = x;
    this.lly = y-h;
    this.lrx = x+w;
    this.lry = y-h;
    this.spd = spd;
  }

  void _draw()
  {
    rect(cx(x), cy(y), w, h);
  }
  void move()
  {
    if (keyA) {
      move_paddle(-this.spd);
    }
    if (keyD) {
      move_paddle(this.spd);
    }
  }

  void move_paddle(float n) {
    this.x += n;
    this.ulx += n;
    this.urx += n;
    this.llx += n;
    this.lrx += n;

  }
}