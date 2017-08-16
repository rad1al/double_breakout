float screen_height = 1000;
float screen_width = 1000;

ArrayList<Brick> bricks = new ArrayList<Brick>(); 

Brick b = new Brick(10, 20);
Ball ball = new Ball(80, -450);

void setup() {
  size(1000, 1000); // Set window dimensions.
  pixelDensity(2); // Turn on retina mode for retina screens. Doesn't work with Processing.js
  create_bricks();
  
}

void draw() {
  background(#000000);
  fill(#FFF755);
  //ellipse(cx(0), cy(0), 50, 50);
  //ssystem.run();
  //b._draw();
  draw_bricks();
  ball.move();
  ball._draw();
}