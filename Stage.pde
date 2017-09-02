class Stage {
  float ulx, uly;
  float urx, ury;
  float llx, lly;
  float lrx, lry;
  
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
}