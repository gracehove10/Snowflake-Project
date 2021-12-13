class Flake {
  float x, y;
  boolean stopped;
  Flake(float x_, float y_) {
    x = x_;
    y = y_;
    stopped = false;
  }
  void move() {
    // random movement
    x -= speed;
    y += (int)(Math.random()*spread)-spread/2;
    if (isReached()|| isTouched()) {
      stopped = true;
    }
  }
  void show() {
    fill(255);
    ellipse(x, y, 2*radius, 2*radius);
  }
  boolean isReached() {
    return x < 0;
  }
  boolean isTouched() {
    boolean touched = false;
    for (Flake f : fl) {
      if (this != f) {
        if (dist (x, y, f.x, f.y)<= 2*radius) {
          touched=true;
          break;
        }
      }
    }
    return touched;
  }
}
