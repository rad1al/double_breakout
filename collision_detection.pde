boolean ball_line(float bx, float by, float r, float lx1, float ly1, float lx2, float ly2) {
  // Circle-line segment collision detection algorithm by bobobobo on StackOverflow: https://stackoverflow.com/a/1084899
  float dx = lx2 - lx1;
  float dy = ly2 - ly1;
  float fx = lx1 - bx;
  float fy = ly1 - by;
  float a = dx*dx + dy*dy;
  float b = 2*(fx*dx + fy*dy);
  float c = (fx*fx + fy*fy) - r*r;
  float discriminant = b*b-4*a*c;
  
  if (discriminant < 0)
    {
      // no intersection
    }
  else
  {
    discriminant = sqrt(discriminant);
    float t1 = (-b - discriminant)/(2*a);
    float t2 = (-b + discriminant)/(2*a);
    
    if (t1 >= 0 && t1 <= 1){
      return true;
    }
    if (t2 >= 0 && t2 <= 1)
    {
      return true;
    }
  }
  return false;
}