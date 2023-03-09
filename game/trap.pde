float trapX, trapY;
float trapSize = 20;
float trapMaxSize = 100;
float trapGrowthRate = 2;
ArrayList<PVector> traps = new ArrayList<PVector>();

void drawTrap(float x, float y, float size) {
  noFill();
  stroke(255, 0, 0);
  ellipse(x, y, size, size);
}


void addTrap() {
  PVector newTrap = new PVector(random(trapSize, width - trapSize), random(trapSize, height - trapSize), trapSize);
  traps.add(newTrap);
}
