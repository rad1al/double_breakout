float screen_width = 1200;
float screen_height = 1000;

ArrayList<Brick> bricks = new ArrayList<Brick>(); 
boolean keyA = false;
boolean keyD = false;
//Brick b = new Brick(10, 20);
Ball ball = new Ball(80, -300);
Paddle paddle = new Paddle(-65, -screen_height/2+20); 
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
  paddle._draw();
  draw_bricks();
  //move_paddle();
  paddle.move();

  
  ball._draw();
  ball.bounce_ball(stage, bricks);
  }

// allow user to hold down key for repetitive actions
void keyPressed()
{
  if (key == 'a') { keyA = true; }   //paddle.move(-10);
  if (key == 'd') { keyD = true; }  
  
}

void keyReleased(){
  if (key == 'a') { keyA = false; }
  if (key == 'd') { keyD = false; }
}

//void move_paddle(){
//  paddle.move();
//}