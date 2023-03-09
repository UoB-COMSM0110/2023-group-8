int live = 5;
PImage heart;

void setHeart(){
  heart = loadImage("heart.png");
}

void drawHeart(){
  for(int i = 0; i < live; i++){
    int x = width - 40 * (i+1);
    image(heart, x, 40, 30, 30);
  }
}
