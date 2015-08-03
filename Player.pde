class Player
{
  float x;
  float y;
  float z;
  PImage pushfez;
  PImage[] walkLeft;
  PVector normalGravity = new PVector(0, 70.0, 0);
  PVector reverseGravity = new PVector(0, -3.0, 0);
  PVector rightGravity = new PVector(3, 0, 0);
  PVector leftGravity = new PVector(-3, 0, 0);
  PVector acceleration;
  PVector velocity;

  float variable;
  PVector playerStandingForce = new PVector(0, variable, 0);
  int maxImages = 8;
  int imageIndex = 0;

  PImage[] walkRight = new PImage[maxImages];
  PImage jumpingBunny;
  PImage idle;
  float playerWidth = 50.0;
  float playerHeight = 100.0;

  float displacementX = 0;
  float displacementY = 0;
  float displacementZ = 0;

  float movementSpeed = 4;
  // float jumpForce = -60;

  //0 is down, 1 is up, 2 is right, 3 is left;
  int gravityDirection;

  boolean lastMovedRight;
  boolean lastMovedLeft;
  boolean afterJump;
  float startingXpos = smallNumber + playerWidth/2;
  float startingYpos = bigNumber - playerHeight/2;
  float currentYpos = startingYpos;
  float startingZpos = bigNumber;
  PVector location = new PVector(startingXpos, startingYpos, startingZpos);
  float jumpForce = -20;
  Timer timer;

  float angle;

  Player(float x, float y, float z) {
    for (int i = 0; i < walkRight.length; i++) {
      walkRight[i] = loadImage("bunnySprite" + i + ".png");
    }
    jumpingBunny = loadImage("jumpingBunny.png");
    timer = new Timer();
  }

  void display() {
    timer.jumpedTime();
    imageMode(CENTER);
    imageIndex = (imageIndex + 1) % walkRight.length;
    translate(width/2 + displacementX, height/2 + displacementY, startingZpos + displacementZ);

    if (flipUp == true) {
      angle = -PI/4;
      println("I FLIPPED");
    }
    if (flipDown == true) {
    }
    if (flipLeft == true) {
    }
    if (flipRight == true) {
    }

    if (moveRight == true) {
      rotateX(angle);

      if (justJumped == false) {
        image(walkRight[imageIndex], location.x, location.y, playerWidth, playerHeight);
        lastMovedRight = true;
        lastMovedLeft = false;
      }
      if (justJumped == true) {
        afterJump = false;
        image(jumpingBunny, location.x, location.y, playerWidth + 15, playerHeight - 10);
        location.y = location.y + jumpForce +(normalGravity.y)*(timer.jumpTimer*timer.jumpTimer);
        println(location.y);
        if (location.y >= startingYpos) {
          justJumped = false;
          afterJump = true;
        }
      }
    }
    if (moveLeft == true) {
      rotateX(angle);
      scale(-1, 1);
      // translate();
      image(walkRight[imageIndex], -location.x, location.y, playerWidth, playerHeight);
      lastMovedRight = false;
      lastMovedLeft = true;
    }
    if (moveRight == false && moveLeft == false && moveUp == false && moveDown == false && justJumped == false && lastMovedRight == true) {
      rotateX(angle);
      image(walkRight[0], location.x, location.y, playerWidth, playerHeight);
    }
    if (moveRight == false && moveLeft == false && moveUp == false && moveDown == false && lastMovedRight == false && lastMovedLeft == false) {
      rotateX(angle);
      image(walkRight[0], location.x, location.y, playerWidth, playerHeight);
    }
    if (moveUp == true) {
      rotateX(angle);
      image(walkRight[0], location.x, startingYpos, playerWidth, playerHeight);
    }
    if (moveRight == false && moveLeft == false && moveUp == false && moveDown == false && justJumped == false && lastMovedLeft == true) {
      rotateX(angle);
      scale(-1, 1);
      image(walkRight[0], -location.x, startingYpos, playerWidth, playerHeight);
    }
    if (justJumped == true && jump == true) {
      jump = false;
    }
    if (justJumped == true && lastMovedRight == true && moveRight == false) {
      rotateX(angle);
      afterJump = false;
      image(jumpingBunny, location.x, location.y, playerWidth + 15, playerHeight - 10);
      // location.add(normalGravity);
      location.y = location.y + jumpForce +(normalGravity.y)*(timer.jumpTimer*timer.jumpTimer);
      println(location.y);
      if (location.y >= startingYpos) {
        justJumped = false;
        afterJump = true;
      }
    }
    if (justJumped == true && lastMovedLeft == true && lastMovedRight == false) {
      afterJump = false;
      scale(-1, 1);
      image(jumpingBunny, -location.x, location.y, playerWidth + 15, playerHeight - 10);
      // location.add(normalGravity);
      location.y = location.y + jumpForce +(normalGravity.y)*(timer.jumpTimer*timer.jumpTimer);
      println(location.y);
      if (location.y >= startingYpos) {
        justJumped = false;
        afterJump = true;
      }
    }

    if (afterJump == true) {
      location.y = startingYpos;
      image(walkRight[0], location.x, location.y, playerWidth, playerHeight);
      afterJump = false;
    }
//    println("location.y = " + location.y);
//    println("currentYpos = " + currentYpos);
    if (currentYpos > startingYpos) {
      currentYpos = startingYpos;
    }
  }

  void move() {
    if (moveRight == true) {
      displacementX += movementSpeed;
    }
    if (moveLeft == true) {
      displacementX -= movementSpeed;
    }
    if (moveUp == true) {
      displacementY -= movementSpeed;
    }
    if (moveDown == true) {
      displacementY += movementSpeed;
    }
  } 

  void jump() {
    if (jump == true) {
      // location.y = location.y + jumpForce +(normalGravity.y/2)*(time0*time0);;
      justJumped = true;
      jump = false;
      if (location.y >= startingYpos) {
        location.y = startingYpos;
      }
    }
  }
}
