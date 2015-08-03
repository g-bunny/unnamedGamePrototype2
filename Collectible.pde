public class Collectible {
  int typeOfItem;
  float xPos;
  float yPos;
  float zPos;
  
  Collectible(int typeOfItem, float xPos, float yPos, float zPos){
    this.typeOfItem = typeOfItem;
    this.xPos = xPos;
    this.yPos = yPos;
    this.zPos = zPos;
  }
  
  void display(){
    ellipse(xPos,yPos,10,10);
  }
}
