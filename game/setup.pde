float playerX, playerY;
float playerWidth = 5, playerHeight = 5;
PImage img_Map;


void setup() {
  size(1920, 1080);
  background(0);
  img_Map = loadImage("back.jpg");
  playerX = width / 2;
  playerY = height / 2;
  PVector firstTrap = new PVector(random(trapSize, width - trapSize), random(trapSize, height - trapSize), trapSize);
  traps.add(firstTrap);
  endTime = millis()+ minutes * 60 * 1000;
}


void drawPlayer(float jumpSize) {
  pushMatrix();
  translate(playerX, playerY);
  rotate(-HALF_PI);
  fill(0, 255, 0);
  noStroke();
  beginShape();
  vertex(-playerWidth / 2, playerHeight / 2);
  vertex(playerWidth / 2, playerHeight / 2);
  vertex(0, -jumpSize);
  endShape(CLOSE);
  popMatrix();
}
