float playerX, playerY;
float playerWidth = 50, playerHeight = 50;
float playerAngle = PI;
boolean isJumping = false;
int jumpStartTime = 0;
float jumpSize = 0;
float playerJumpHeight = 20;
float playerJumpSize = 20;

void movePlayer() {
  if (keyPressed) {
   if (key == ' ') {
      if (!isJumping) {
        isJumping = true;
        jumpStartTime = millis(); // record the period of jumping 
        jumpSize = playerJumpSize; // record the range of jumping
      }
    } else if (key == 'a') {
      playerAngle -= 0.1;
    } else if (key == 'd') {
      playerAngle += 0.1;
    } else if (key == 'w') {
      float dx = cos(playerAngle + PI/2) * 5;
      float dy = sin(playerAngle + PI/2) * 5;
      playerX += dx;
      playerY += dy;
    } else if (key == 's') {
      float dx = cos(playerAngle + PI/2) * -5;
      float dy = sin(playerAngle + PI/2) * -5;
      playerX += dx;
      playerY += dy;
    }
  }
}

void drawPlayer(float jumpSize) {
  pushMatrix();
  translate(playerX, playerY);
  rotate(playerAngle);
  image(playerImg, -playerWidth/2, -playerHeight/2, playerWidth, playerHeight+jumpSize);
  popMatrix();
}
