float playerX, playerY;
float playerWidth = 5, playerHeight = 5;
float playerAngle;
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
      float dx = cos(playerAngle) * 5;
      float dy = sin(playerAngle) * 5;
      playerX += dx;
      playerY += dy;
    } else if (key == 's') {
      float dx = cos(playerAngle) * -5;
      float dy = sin(playerAngle) * -5;
      playerX += dx;
      playerY += dy;
    }
  }
}

void drawPlayer(float jumpSize) {
  pushMatrix();
  translate(playerX, playerY);
  rotate(playerAngle);
  fill(0, 255, 0);
  noStroke();
  beginShape();
  vertex(-playerWidth / 2, playerHeight / 2);
  vertex(playerWidth / 2, playerHeight / 2);
  vertex(0, -jumpSize);
  endShape(CLOSE);
  popMatrix();
}
