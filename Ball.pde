class Ball {
  float x, y; 
  float w = 30; 
  float h = 30;
  float r;
  float xd = 4;
  float yd = 3.2;
  color c = #FFFFFF;
  float gameoverx = -450; // coordinates for the "Game Over" text.
  float gameovery = -50;

  Ball(float x, float y) {
    this.x = x;
    this.y = y;
    this.r = h/2;
  } 

  void move() {
    this.x += this.xd;
    this.y += this.yd;
  }

  void _draw() {
    fill(c);
    ellipse(cx(x), cy(y), w, h);
  }

  void detect_hline(float y) {
    if (y < this.y) {
      this.yd = this.yd * -1;
    }
  }

  void bounce_ball(Stage s, ArrayList<Brick> bs) {
    h_wall_bounce(s);
    v_wall_bounce(s);
    paddle_bounce(paddle);
    for (int i = 0; i < bs.size(); i++) {
      h_brick_wall_bounce(bs.get(i));
      v_brick_wall_bounce(bs.get(i));
    }
  }

  void h_wall_bounce(Stage s) {
    boolean hit_ceiling = ball_line(this.x, this.y, this.r, s.ulx, s.uly, s.urx, s.ury);
    boolean hit_floor = ball_line(this.x, this.y, this.r, s.llx, s.lly, s.lrx, s.lry);

    if (hit_ceiling || hit_floor) {
      this.yd = this.yd * -1;
      game_over();
    }
  }

  void v_wall_bounce(Stage s) {
    boolean hit_leftwall = ball_line(this.x, this.y, this.r, s.ulx, s.uly, s.llx, s.lly);
    boolean hit_rightwall = ball_line(this.x, this.y, this.r, s.urx, s.ury, s.lrx, s.lry);

    if (hit_leftwall || hit_rightwall) {
      this.xd = this.xd * -1;
    }
  }

  void h_brick_wall_bounce(Brick b) {
    if (b.visible) {
      boolean hit_top_wall = ball_line(this.x, this.y, this.r, b.ulx, b.uly, b.urx, b.ury);
      boolean hit_bottom_wall = ball_line(this.x, this.y, this.r, b.llx, b.lly, b.lrx, b.lry);

      if (hit_top_wall || hit_bottom_wall) {
        this.yd = this.yd * -1;
        b.visible = false;
      }
    }
  }

  void v_brick_wall_bounce(Brick b) {
    if (b.visible) {
      boolean hit_left_wall = ball_line(this.x, this.y, this.r, b.ulx, b.uly, b.llx, b.lly);
      boolean hit_right_wall = ball_line(this.x, this.y, this.r, b.urx, b.ury, b.lrx, b.lry);

      if (hit_left_wall || hit_right_wall) {
        this.xd = this.xd * -1;
        b.visible = false;
      }
    }
  }

  void paddle_bounce(Paddle p) {

    boolean hit_top_wall = ball_line(this.x, this.y, this.r, p.ulx, p.uly, p.urx, p.ury);

    if (hit_top_wall) {
      this.yd = this.yd * -1;
    }
  }

  void game_over() {
    textSize(160);
    fill(#CECCCC);
    text("GAME OVER", cx(gameoverx-2), cy(gameovery-2));
    text("GAME OVER", cx(gameoverx+2), cy(gameovery+2));
    text("GAME OVER", cx(gameoverx-2), cy(gameovery+2));
    text("GAME OVER", cx(gameoverx+2), cy(gameovery-2));
    fill(#FFFFFF);
    text("GAME OVER", cx(gameoverx), cy(gameovery));
    paddle.spd = 0;
    xd = 0;
    yd = 0;
  }
}