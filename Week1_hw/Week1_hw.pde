
PImage plane;
PImage[] cloud = new PImage[5];

float x;
float y;

int N = 150;
int value =0;

float c_x = -100;
float c_y = 200;
int c_r = (int)random(4);

void setup() {
  size(300, 250);
  background(106, 216, 255);

  smooth();

  plane = loadImage("plane03.png");
  for (int i = 0;i < 5;i++) {
    cloud[i] = loadImage("cloud" + i + ".png");
  }
  imageMode(CENTER);
}


void draw() {
  background(106, 216, 255);

  float planemove = random(-1, 1);

  pushMatrix();
  translate(x, y+planemove);
  noStroke();
  fill(255, 150);
  for (int i = 50; i < N;i++) {
    ellipse(mouseX+i, mouseY+random(-10, 10)+planemove, 15, 15);
  }
  image(plane, mouseX, mouseY);
  popMatrix();

  pushMatrix();
  translate(0, 0);
  image(cloud[c_r], c_x, c_y);
  c_x+=3;

  if (c_x > width + 80) {
    c_y = random(height);
    c_x = -100;
    c_r = (int)random(4);
  }
  popMatrix();
}


