class Stage {
  int score = 0;
  float ulx, uly;
  float urx, ury;
  float llx, lly;
  float lrx, lry;
  float gameoverx = -450; // coordinates for the "Game Over" text.
  float gameovery = -50;
  boolean game_over_status = false;


  Stage(float sw, float sh) {
    this.ulx = -sw/2;
    this.uly = sh/2;
    this.urx = sw/2;
    this.ury = sh/2;
    this.llx = -sw/2;
    this.lly = -sh/2;
    this.lrx = sw/2;
    this.lry = -sh/2;
  }

  void game_over(Ball b) {
    // Draw game over message, restrict movement of paddles, and wait for restart command.
    if (this.game_over_status) {
      draw_game_over_message();
      paddle_upper.spd = 0;
      paddle_lower.spd = 0;
      b.xd = 0;
      b.yd = 0;
      if (keyR) {
        this.restart();
      }
    }
  }

  void restart() {
    // Restart the game.
    this.game_over_status = false;
    this.score = 0;
    reset_bricks();
    paddle_lower.spd = 10;
    paddle_upper.spd = -10;
    ball.xd = 4;
    ball.yd = 3.2;
    ball.x = 80;
    ball.y = -300;
  }

  void draw_game_over_message() {
    // Draw "Game Over" message. Should be run after draw_bricks() in draw() loop so message appears on top.
    textSize(160);
    fill(#CECCCC);
    text("GAME OVER", cx(gameoverx-2), cy(gameovery-2));
    text("GAME OVER", cx(gameoverx+2), cy(gameovery+2));
    text("GAME OVER", cx(gameoverx-2), cy(gameovery+2));
    text("GAME OVER", cx(gameoverx+2), cy(gameovery-2));
    fill(#FFFFFF);
    text("GAME OVER", cx(gameoverx), cy(gameovery));
  }

  void draw_score() {
    // Draw the current score with some transparency.
    textSize(50);
    fill(255, 255, 255, 150);
    text("Score: " + this.score, cx(-screen_width/2 + 50), cy(screen_height/2 - 100));
  }
}