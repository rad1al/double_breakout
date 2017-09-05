class Ball {
  float x, y; 
  float w = 30; 
  float h = 30;
  float r;
  float xd = 4;
  float yd = 3.2;
  color c = #FFFFFF;


  Ball(float x, float y) {
    this.x = x;
    this.y = y;
    this.r = h/2;
  } 


  void move() {
    // Move the ball by (xd,yd) on the cartesian plane.
    this.x += this.xd;
    this.y += this.yd;
  }

  void _draw() {
    fill(c);
    ellipse(cx(x), cy(y), w, h);
  }

  void bounce_ball(Stage s, ArrayList<Brick> bs) {
    // Have the ball bounce off bricks and walls.
    h_wall_bounce(s);
    v_wall_bounce(s);
    paddle_bounce(paddle_lower);
    paddle_bounce(paddle_upper);
    for (int i = 0; i < bs.size(); i++) {
      h_brick_wall_bounce(bs.get(i));
      v_brick_wall_bounce(bs.get(i));
    }
  }

  void h_wall_bounce(Stage s) {
    // Detect if ball has collided with any horizontal wall. If so, call game_over function.
    boolean hit_ceiling = ball_line(this.x, this.y, this.r, s.ulx, s.uly, s.urx, s.ury);
    boolean hit_floor = ball_line(this.x, this.y, this.r, s.llx, s.lly, s.lrx, s.lry);
    if (stage.game_over_status == false) {
      if (hit_ceiling || hit_floor) {
        stage.game_over_status = true;
      }
    }
  }

  void v_wall_bounce(Stage s) {
    // Detect if ball has collided with any vertical wall.
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
        //b.toggle_visible(false);
        b.hit_brick(stage);
      }
    }
  }

  void v_brick_wall_bounce(Brick b) {
    if (b.visible) {
      boolean hit_left_wall = ball_line(this.x, this.y, this.r, b.ulx, b.uly, b.llx, b.lly);
      boolean hit_right_wall = ball_line(this.x, this.y, this.r, b.urx, b.ury, b.lrx, b.lry);

      if (hit_left_wall || hit_right_wall) {
        this.xd = this.xd * -1;
        //b.toggle_visible(false);
        b.hit_brick(stage);
      }
    }
  }

  void paddle_bounce(Paddle p) {
    // Detect if ball has collided with a paddle.
    boolean hit_top_wall = ball_line(this.x, this.y, this.r, p.ulx, p.uly, p.urx, p.ury);
    boolean hit_bottom_wall = ball_line(this.x, this.y, this.r, p.llx, p.lly, p.lrx, p.lry);
    if (hit_top_wall || hit_bottom_wall) {
      this.yd = this.yd * -1;
    }
  }
}