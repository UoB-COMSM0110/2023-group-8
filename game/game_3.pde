float playerX, playerY;
float playerWidth = 5, playerHeight = 5;
float playerJumpHeight = 20;
float playerJumpSize = 20;
ArrayList<PVector> traps = new ArrayList<PVector>();
float trapX, trapY;
float trapSize = 20;
float trapMaxSize = 100;
float trapGrowthRate = 2;
int lastTime = 0;
int interval = 180; // 60帧为1秒
PImage img_Map;
boolean isJumping = false;
int jumpStartTime = 0;
float jumpSize = 0;
int minutes = 5;
int seconds = 0;
int endTime;

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

void draw() {
  image(img_Map, 0, 0);
  int remainingTime = endTime - millis();
  if(remainingTime > 0){
    minutes = (remainingTime / 1000) / 60;
    seconds = (remainingTime / 1000) % 60;
    text(String.format("%02d:%02d", minutes, seconds), width/2, height/2);
  }else{
    text ("Win!", width/2, height/2);
  }
  if (isJumping) {
    float elapsedTime = millis() - jumpStartTime; // 跳跃已经进行的时间
    if (elapsedTime < 1000) { // 跳跃时间不超过1秒
      float jumpProgress = map(elapsedTime, 0, 1000, 0, 1); // 跳跃进度（0-1）
      jumpSize = lerp(playerJumpSize, playerJumpSize + playerJumpHeight, jumpProgress); // 计算当前的跳跃大小
      drawPlayer(jumpSize); // 画出跳跃的形状
    } else {
      isJumping = false; // 跳跃结束
      jumpSize = 0; // 重置跳跃的大小
    }
  } else {
    drawPlayer(playerJumpSize); // 画出普通的形状
  }
  for (int i = traps.size()-1; i >= 0; i--) {
    PVector trap = traps.get(i);
    drawTrap(trap.x, trap.y, trap.z);
    trap.z += trapGrowthRate;
    if (trap.z > width*2) {
      traps.remove(i);
    }
  }
  int currentTime = frameCount / interval;
  if (currentTime > lastTime) {
    lastTime = currentTime;
    addTrap();
  }
  movePlayer();
  if (!isJumping) { // 在跳跃期间，玩家不能被检测碰撞
    checkCollision();
  }
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

void drawTrap(float x, float y, float size) {
  noFill();
  stroke(255, 0, 0);
  ellipse(x, y, size, size);
}

void movePlayer() {
  if (keyPressed) {
   if (key == ' ') {
      if (!isJumping) {
        isJumping = true;
        jumpStartTime = millis(); // 记录跳跃的开始时间
        jumpSize = playerJumpSize; // 记录跳跃的大小
      }
    } else if (key == 'a') {
      playerX -= 5;
    } else if (key == 'd') {
      playerX += 5;
    } else if (key == 'w') {
      playerY -= 5;
    } else if (key == 's') {
      playerY += 5;
    }
  }
}

void addTrap() {
  PVector newTrap = new PVector(random(trapSize, width - trapSize), random(trapSize, height - trapSize), trapSize);
  traps.add(newTrap);
}

void checkCollision() {
  for (PVector trap : traps) {
    float distance = dist(playerX, playerY, trap.x, trap.y);
    if (distance <= (trap.z / 2 + playerWidth / 2) && jumpSize <= trap.z / 2) {
      float angle = atan2(playerY - trap.y, playerX - trap.x);
      float edgeX = trap.x + cos(angle) * trap.z / 2;
      float edgeY = trap.y + sin(angle) * trap.z / 2;
      float distanceToEdge = dist(playerX, playerY, edgeX, edgeY);
      if (distanceToEdge <= playerWidth / 2) {
        textSize(50);
        textAlign(CENTER, CENTER);
        text("Game Over!", width / 2, height / 2);
        noLoop();
      }
    }
  }
}
