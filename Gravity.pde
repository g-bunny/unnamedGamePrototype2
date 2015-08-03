public class Gravity
{
  // if gravity is -y, state 1 (default)
  // if gravity is y, state 2
  // if -x, state 3
  // if x, state 4
  int state = 1;
  // if is an earth, type 1
  // if is a player, type 2
  // if is an obstruction, type 3
  int type;
  // gravity as -3px/s
  // distance = gravity/2 * t^2
  int gravity = -3;
  PVector normalGravity = new PVector(0,3);
  PVector reverseGravity = new PVector(0,-3);
  PVector rightGravity = new PVector(3,0);
  PVector leftGravity = new PVector(-3,0);
  PVector acceleration;
  PVector velocity;
}
