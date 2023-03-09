int lastTime = 0;
int interval = 180; // 60 frames is 1 second
int minutes = 5;
int seconds = 0;
int endTime;
int frontSize = 32;

void draw() {
  image(img_Map, 0, 0);
  TimeCounter();
  //setHeart();
  drawHeart();
  if (isJumping) {
    float elapsedTime = millis() - jumpStartTime; // jumping time setting
    if (elapsedTime < 1000) { // jumping less than 1 sec
      float jumpProgress = map(elapsedTime, 0, 1000, 0, 1); // jumping progress
      jumpSize = lerp(playerJumpSize, playerJumpSize + playerJumpHeight, jumpProgress); // calculate jumping range
      drawPlayer(jumpSize); // present the player is jumping
    } else {
      isJumping = false; // jumping end
      jumpSize = 0; // reset the player into normal mode
    }
  } else {
    drawPlayer(playerJumpSize); // present the player normal size when he isn't jumping
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
  if (!isJumping) { // when player is not jumping, the collision detection wouldn't be used
    checkCollision();
  }
}

void TimeCounter(){
  int remainingTime = endTime - millis();
  if(remainingTime > 0){
    minutes = (remainingTime / 1000) / 60;
    seconds = (remainingTime / 1000) % 60;
    textSize(frontSize);
    fill(255,0,0);
    text(String.format("%02d:%02d", minutes, seconds), width/2, 50);
  }else{
    textSize(frontSize);
    fill(255,255,0);
    text ("Win!", width/2, height/2);
  }
}
