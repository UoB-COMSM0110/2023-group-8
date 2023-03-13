PImage img_Map;
PImage playerImg;

void setup() {
  size(1920, 1080);
  background(0);
  playerImg = loadImage("R.png");
  img_Map = loadImage("back.jpg");
  setHeart();
  playerX = width / 2;
  playerY = height / 2;
  PVector firstTrap = new PVector(random(trapSize, width - trapSize), random(trapSize, height - trapSize), trapSize);
  traps.add(firstTrap);
  endTime = millis()+ minutes * 60 * 1000;
}
