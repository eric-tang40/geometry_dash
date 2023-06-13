class Block {
  float bSize;
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  Block(int x, int y, float size) {
    stroke(225);
    strokeWeight(3);
    fill(0);
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    bSize = size;
  }
  
  Block(int x, int y) {
    stroke(225);
    strokeWeight(3);
    fill(0);
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void move() {
      position.x = position.x - screenVelocity;
  }
  
  
}
