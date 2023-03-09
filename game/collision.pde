
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
