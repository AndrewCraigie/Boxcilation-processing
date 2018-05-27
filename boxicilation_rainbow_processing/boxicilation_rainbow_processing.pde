// Andrew Craigie
// boxcilation_rainbow_processing.pde

// Boxcilation Rainbow 01

int w = 800;
int h = 800;

color leftColor;
color topColor;
color frontColor;

int areaWidth = 500;
int areaDepth = 500;
int shapeCount = 101;

float increment = 0.01;
float increment2 = 0.0;
float colorIncrement = 0.01;

float bw = 4;
float bd = 4;
float bh = 20.0;
float minH = 0.0;
float maxH = 200.0;

void setup() {
  size(600, 720, P3D);

  colorMode(HSB, 1.0, 1.0, 1.0, 1.0);
  leftColor = color(0.0, 1.0, 1.0, 1.0);
  topColor = color(0.333, 1.0, 1.0, 1.0);
  frontColor = color(0.666, 1.0, 1.0, 1.0);

  ortho();
  camera(-width, -width, width, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);

}


void drawShape(float sW, float sH, float sD, float x, float y, float z) {

  noStroke();
  fill(hue(topColor), saturation(topColor), brightness(topColor));

  pushMatrix();
  translate(x, sH-100, z);
  rect(0.0, 0.0, sW, sD);
  popMatrix();

  pushMatrix();
  translate(x, -sH+100, z);
  rect(0.0, 0.0, sW, sD);
  popMatrix();
}

void draw() {
  background(0);

  int shapeStart = -(floor(shapeCount / 2));
  int shapeEnd = (floor(shapeCount / 2)) + 1;

  for (int z = shapeStart; z < shapeEnd; z++) {
    for (int x = shapeStart; x < shapeEnd; x++) {

      float locX = x * (areaWidth / shapeCount);
      float locY = 0.0;
      float locZ = z * (areaWidth / shapeCount);

      float shapeDistance = dist(0, 0, 0, locX, locY, locZ);
      float normDistance = map(shapeDistance, 0, areaWidth, 0, 1);
      float d = normDistance * TWO_PI * sin(increment * 0.1);
      bh = map(sin(d + increment), -1, 1, minH, maxH);

      leftColor = color(((normDistance + colorIncrement) % 1), 1.0, 1.0, 1.0);
      topColor = color(((normDistance + colorIncrement) % 1), 1.0, 1.0, 1.0);
      frontColor = color(((normDistance + colorIncrement) % 1), 1.0, 1.0, 1.0);

      drawShape(bw, bh, bd, locX, locY, locZ);
    }
  }

  increment += 0.05;
  colorIncrement += 0.01;
   
}
