public class Timer{
  float jumpTimer;
  float gameTimer;
  float levelTimer;
  float itemTimer;
  
  float initialTime;
  float elapsedTime;
  
  Timer(){
    initialTime = millis()/1000.0;
  }

  void jumpedTime(){
    jumpTimer = millis()/1000.0 - initialTime;
    if (justJumped == false){
      initialTime = millis()/1000.0;
    }
//    println("jumpTimer = " + jumpTimer);
//    println("initialTime = " + initialTime);
  }
}
