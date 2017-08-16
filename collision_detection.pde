/* 
 RECT/BALL COLLISION FUNCTION
 By Jeff Thompson // www.jeffreythompson.org
 
 Takes 7 arguments:
 + x,y position of the first ball - in this case "you"
 + width and height of rect
 + x,y position of the second ball
 + diameter of second ball
 */

boolean rectBall(int rx, int ry, int rw, int rh, int bx, int by, int d) {

  // first test the edges (this is necessary if the rectangle is larger
  // than the ball) - do this with the Pythagorean theorem

  // if ball entire width position is between rect L/R sides
  if (bx+d/2 >= rx-rw/2 && bx-d/2 <= rx+rw/2 && abs(ry-by) <= d/2) {
    return true;
  }
  // if not, check if ball's entire height is between top/bottom of the rect
  else if (by+d/2 >= ry-rh/2 && by-d/2 <= ry+rh/2 && abs(rx-bx) <= d/2) {
    return true;
  }

  // if that doesn't return a hit, find closest corner
  // this is really just a point, so we can test if we've hit it 
  // upper-left
  float xDist = (rx-rw/2) - bx;  // same as ball/ball, but first value defines point, not center
  float yDist = (ry-rh/2) - by;
  float shortestDist = sqrt((xDist*xDist) + (yDist * yDist));

  // upper-right
  xDist = (rx+rw/2) - bx;
  yDist = (ry-rh/2) - by;
  float distanceUR = sqrt((xDist*xDist) + (yDist * yDist));
  if (distanceUR < shortestDist) {  // if this new distance is shorter...
    shortestDist = distanceUR;      // ... update
  }

  // lower-right
  xDist = (rx+rw/2) - bx;
  yDist = (ry+rh/2) - by;
  float distanceLR = sqrt((xDist*xDist) + (yDist * yDist));
  if (distanceLR < shortestDist) {
    shortestDist = distanceLR;
  }

  // lower-left
  xDist = (rx-rw/2) - bx;
  yDist = (ry+rh/2) - by;
  float distanceLL = sqrt((xDist*xDist) + (yDist * yDist));
  if (distanceLL < shortestDist) {
    shortestDist = distanceLL;
  }

  // test for collision
  if (shortestDist < d/2) {  // if less than radius
    return true;             // return true
  }
  else {                     // otherwise, return false
    return false;
  }
}

/* 
 BALL/LINE COLLISION FUNCTION
 By Jeff Thompson // www.jeffreythompson.org
 
 Takes 7 arguments:
 + x,y position of the point
 + diameter of ball (assumes a circle - ellipse collision is REALLY hard)
 + start x,y and end x,y of the line
 
 Note: all values must be floats, otherwise rounding from ints will cause
 errors on one side of the line
 */

boolean ballLine(float bx, float by, int d, float lx1, float ly1, float lx2, float ly2) {

  // first get the length of the line using the Pythagorean theorem
  float distX = lx1-lx2;
  float distY = ly1-ly2;
  float lineLength = sqrt((distX*distX) + (distY*distY));

  // then solve for r
  float r = (((bx-lx1)*(lx2-lx1))+((by-ly1)*(ly2-ly1)))/pow(lineLength, 2);

  // get x,y points of the closest point
  float closestX = lx1 + r*(lx2-lx1);
  float closestY = ly1 + r*(ly2-ly1);

  // to get the length of the line, use the Pythagorean theorem again
  float distToPointX = closestX - bx;
  float distToPointY = closestY - by;
  float distToPoint = sqrt(pow(distToPointX, 2) + pow(distToPointY, 2));

  // for explanation purposes, draw a line to the ball from the closest point
  strokeWeight(1);
  stroke(255,0,0);
  line(closestX, closestY, bx, by);
  strokeWeight(3);

  // if that distance is less than the radius of the ball: collision
  if (distToPoint <= d/2) {
    return true;
  }
  else {
    return false;
  }
}