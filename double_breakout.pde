float screen_width = 1200; // Screen width in pixels
float screen_height = 1000; // Screen height in pixels

ArrayList<Brick> bricks = new ArrayList<Brick>(); 
boolean keyA = false;
boolean keyD = false;
boolean keyR = false;


Ball ball = new Ball(80, -300);
Paddle paddle_lower = new Paddle(-65, -screen_height/2+20, 10); 
Paddle paddle_upper = new Paddle(-65, screen_height/2-20, -10); 
Stage stage = new Stage(screen_width, screen_height);


void setup() {
  size(1200, 1000); // Set window dimensions.
  pixelDensity(2); // Turn on retina mode for retina screens. Doesn't work with Processing.js
  create_bricks();
}

void draw() {
  background(#000000);
  fill(#FFFFFF);
  ball.move();
  paddle_lower._draw();
  paddle_upper._draw();
  draw_bricks();
  paddle_lower.move();
  paddle_upper.move();
  stage.draw_score();
  ball._draw();
  ball.bounce_ball(stage, bricks);
  stage.game_over(ball);
  }

// allow user to hold down key for repetitive actions
void keyPressed()
{
  if (key == 'a') { keyA = true; }
  if (key == 'd') { keyD = true; }  
  if (key == 'r') { keyR = true; }
}

void keyReleased(){
  if (key == 'a') { keyA = false; }
  if (key == 'd') { keyD = false; }
  if (key == 'r') { keyR = false; }
}