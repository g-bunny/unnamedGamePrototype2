int insideLength = 10;
Frame3D baseFrame;
Frame3D[] insideFrame = new Frame3D[insideLength];
float eyeX;
float eyeY;
float eyeZ;
float centerX;
float centerY;
float centerZ;
float upX;
float upY;
float upZ;
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
int offsetBig = 130;
int offsetSmall = 1;

void setup() {
  frameRate(8);
  size(1000, 800, OPENGL);
  eyeX = width/2.0;
  eyeY = height/2.0;
  eyeZ = (height/2.0)/tan(PI*30.0/180.0);
  centerX = width/2.0;
  centerY = height/2.0;
  centerZ = 0;
  upX = 0;
  upY = 1;
  upZ = 0;
  baseFrame = new Frame3D(purple, blue, red, smallNumber, bigNumber, smallNumber, bigNumber, smallNumber, bigNumber);
  for (int i = 0; i < insideLength; i++){
    insideFrame[i] = new Frame3D(red, purple, blue, 10 + i*10, bigNumber - offsetBig + 10*i, 10 + i * 10, bigNumber - offsetBig + 10* i, 10 + i * 10, bigNumber-offsetBig + 10 * i);
  }
  player = new Player(0,0,0);
}

void draw() {
  background(250);
    camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ);

  baseFrame.display();
  baseFrame.rotateMe();
  for (int i = 0; i < insideLength; i++){
    insideFrame[i].display();
    insideFrame[i].rotateMe();
  }
  player.display();
  player.move();
  player.jump();
  
  // println("jump is " + jump);
  // println("flipLeft is " + flipLeft);
}