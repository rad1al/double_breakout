float cx (float x) {
  //convert processing y coors to cartesian coors
  return (screen_width/2 + x);
}
  
float cy(float y){
  //convert processing x coors to cartesian coors
  return (screen_height/2 - y);
}

float ucx(float x){
  //convert y coors to from cartesian to processing coors
  return (x - screen_width/2);
}

float ucy(float y){
  //convert y coors from cartesian to processing coors
  return (screen_height/2 - y);
}