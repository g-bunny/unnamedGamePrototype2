public class Frame3D
{
  float smallX, smallY, smallZ, bigX, bigY, bigZ;
  color frontColor;
  color sideColor;
  color topColor;
  float rotatex;
  float rotatey;
  int xRotateState = 0; //0 to 3
  int yRotateState = 0;
  int zRotateState;
  
  Frame3D(color frontColor, color sideColor, color topColor, float smallX, float bigX, float smallY, float bigY, float smallZ, float bigZ) {
    this.frontColor = frontColor;
    this.sideColor = sideColor;
    this.topColor = topColor;
    this.smallX = smallX;
    this.bigX = bigX;
    this.smallY = smallY;
    this.bigY = bigY;
    this.smallZ = smallZ;
    this.bigZ = bigZ;
  }
  
  void display() {
        pushMatrix();
    translate(width/2.0, height/2.0);

    rotateX(rotatex);
    rotateY(rotatey);
    // scale(3);

    //front
    beginShape(QUADS);
    fill(frontColor);
    vertex(smallX, bigY, bigZ);
    vertex(bigX, bigY, bigZ);
    vertex(bigX, smallY, bigZ);
    vertex(smallX, smallY, bigZ);
    endShape();
    //right
    beginShape(QUADS);
    fill(sideColor);
    vertex(bigX, bigY, bigZ);
    vertex(bigX, bigY, smallZ);
    vertex(bigX, smallY, smallZ);
    vertex(bigX, smallY, bigZ);
    endShape();
    //back
    beginShape(QUADS);
    fill(frontColor);
    vertex(bigX, bigY, smallZ);
    vertex(smallX, bigY, smallZ);
    vertex(smallX, smallY, smallZ);
    vertex(bigX, smallY, smallZ);
    endShape();
    //left
    beginShape(QUADS);
    fill(sideColor);
    vertex(smallX, bigY, smallZ);
    vertex(smallX, bigY, bigZ);
    vertex(smallX, smallY, bigZ);
    vertex(smallX, smallY, smallZ);
    endShape();
    //top
    beginShape(QUADS);
    fill(topColor);
    vertex(smallX, bigY, smallZ);
    vertex(bigX, bigY, smallZ);
    vertex(bigX, bigY, bigZ);
    vertex(smallX, bigY, bigZ);
    endShape();
    //bot
    beginShape(QUADS);
    fill(topColor);
    vertex(smallX, smallY, smallZ);
    vertex(bigX, smallY, smallZ);
    vertex(bigX, smallY, bigZ);
    vertex(smallX, smallY, bigZ);
    endShape();

    popMatrix();
    println("xRotateState = " + xRotateState);
  }
  
  void rotateMe(){
    if (flipUp == true){
      if (xRotateState == 0){
        rotatex -= PI/16;
        if (rotatex <= -PI/2){
          rotatex = -PI/2;
          flipUp = false;
          xRotateState = 1;
        }
      }
      else if (xRotateState == 1){
        rotatex -= PI/16;
        if (rotatex <= -PI){
          rotatex = -PI;
          flipUp = false;
          xRotateState = 2;
        }
      }
      else if (xRotateState == 2){
        rotatex -= PI/16;
        if (rotatex <= -PI * 1.5){
          rotatex = -PI * 1.5;
          flipUp = false;
          xRotateState = 3;
        }
      }
      else if (xRotateState == 3){
        rotatex -= PI/16;
        if (rotatex <= -2*PI){
          rotatex = 0;
          flipUp = false;
          xRotateState = 0;
        }
      }
    }
    if (flipDown == true){
      if (xRotateState ==0){
        rotatex += PI/16;
        if(rotatex >=PI/2){
          rotatex = -PI * 1.5;
          flipDown = false;
          xRotateState = 3;
        }
      }
      else if(xRotateState == 3){
        rotatex += PI/16;
        if(rotatex >= -PI){
          rotatex = -PI;
          flipDown = false;
          xRotateState = 2;
        }
      }
      else if(xRotateState == 2){
        rotatex += PI/16;
        if (rotatex >= -PI/2){
          rotatex = -PI/2;
          flipDown = false;
          xRotateState = 1;
        }
      }
      else if(xRotateState == 1){
        rotatex +=PI/16;
        if (rotatex >=0){
          rotatex = 0;
          flipDown = false;
          xRotateState = 0;
        }
      }
    }
    if (flipLeft == true){
      if (yRotateState ==0){
        rotatey += PI/16;
        if(rotatey >=PI/2){
          rotatey = -PI * 1.5;
          flipLeft = false;
          yRotateState = 3;
        }
      }
      else if(yRotateState == 3){
        rotatey += PI/16;
        if(rotatey >= -PI){
          rotatey = -PI;
          flipLeft = false;
          yRotateState = 2;
        }
      }
      else if(yRotateState == 2){
        rotatey += PI/16;
        if (rotatey >= -PI/2){
          rotatey = -PI/2;
          flipLeft = false;
          yRotateState = 1;
        }
      }
      else if(yRotateState == 1){
        rotatey +=PI/16;
        if (rotatey >=0){
          rotatey = 0;
          flipLeft = false;
          yRotateState = 0;
        }
      }
    }
    if (flipRight == true){
      if (yRotateState == 0){
        rotatey -= PI/16;
        if (rotatey <= -PI/2){
          rotatey = -PI/2;
          flipRight = false;
          yRotateState = 1;
        }
      }
      else if (yRotateState == 1){
        rotatey -= PI/16;
        if (rotatey <= -PI){
          rotatey = -PI;
          flipRight = false;
          yRotateState = 2;
        }
      }
      else if (yRotateState == 2){
        rotatey -= PI/16;
        if (rotatey <= -PI * 1.5){
          rotatey = -PI * 1.5;
          flipRight = false;
          yRotateState = 3;
        }
      }
      else if (yRotateState == 3){
        rotatey -= PI/16;
        if (rotatey <= -2*PI){
          rotatey = 0;
          flipRight = false;
          yRotateState = 0;
        }
      }
    }
  }
}
