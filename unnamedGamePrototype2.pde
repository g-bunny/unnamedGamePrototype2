Frame3D baseFrame;
Player player;
boolean flipUp;
boolean flipDown;
boolean flipRight;
boolean flipLeft;
boolean moveUp;
boolean moveDown;
boolean moveRight;
boolean moveLeft;
boolean jump;
boolean justJumped;
boolean upPressed;
boolean downPressed;
boolean leftPressed;
boolean rightPressed;
color purple = color(176,183,255);
color blue = color(178,255,233);
color red = color(242,105,105);
int smallNumber = -150;
int bigNumber = 150;

void setup() {
  frameRate(8);
  size(1000, 800, OPENGL);
  baseFrame = new Frame3D(purple, blue, red, smallNumber, bigNumber, smallNumber, bigNumber, smallNumber, bigNumber);
  player = new Player(0,0,0);
}

void draw() {
  background(250);
  baseFrame.display();
  baseFrame.rotateMe();
  player.display();
  player.move();
  player.jump();
  
  // println("jump is " + jump);
  // println("flipLeft is " + flipLeft);
}
