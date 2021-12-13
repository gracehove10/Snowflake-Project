float radius = 4;
int spread = 3;
float speed = 1;
int numFlakes = 10;
int count = 0;
ArrayList <Flake> fl;
boolean running = true;

Flake flake;

void setup() {
  size(700, 700);
  fl = new ArrayList <Flake> ();
  flake = new Flake(width/2, 0);
  frameRate(30);
}

void draw() {
  translate(width/2, height/2);
  rotate(PI/6);
  background(0);
  if (running) {
    while (!flake.stopped) {
      flake.move();
      count++;
    }

    if (flake.x >= width/2 - 10) {
      println("snowflake is constructed");
      noLoop();
    }

    fl.add(flake);
    flake = new Flake(width/2, 0);

    for (int i = 0; i < 6; i++) {
      rotate(PI/3);
      showSpoke();
      pushMatrix();
      scale(1, -1);  // Reflect across x axis
      showSpoke();
      popMatrix();
    }
  } else reset();
}

void showSpoke() {
  for (Flake f : fl) {
    f.show();
  }
}

void mousePressed() {
  running = !running;
}

void reset() {
  fl = new ArrayList <Flake> ();
  flake = new Flake(width/2, 0);
  count = 0;
}
