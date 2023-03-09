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
