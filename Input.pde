void keyPressed(){
  if (key == 'w'){
    moveUp = true;
  }
  if (key == 'a'){
    moveLeft = true;
  }
  if (key == 's'){
    moveDown = true;
  }
  if (key == 'd'){
    moveRight = true;
  }
  if(key == ' '){
    jump = true;
  }
  if (key == '1'){
    eyeZ -= 10;
  }
  if (key == '2'){
    eyeZ += 10;
  }
}

void keyReleased(){
  if (key == CODED){
    if (keyCode == UP) {
      flipUp = true;
    }
    if (keyCode == DOWN) {
      flipDown = true;
    }
    if (keyCode == RIGHT) {
      flipRight = true;
    }
    if (keyCode == LEFT) {
      flipLeft = true;
    }
  }
  if(key == 'w'){
    if (moveUp){
      moveUp = false;
    }
  }
  if (key == 'a'){
    if (moveLeft){
      moveLeft = false;
    }
  }
  if (key == 's'){
    if (moveDown){
      moveDown = false;
    }
  }
  if (key == 'd'){
    if (moveRight){
      moveRight = false;
    }
  }
}