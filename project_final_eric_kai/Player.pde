class Player { 
  
  float size;
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  Player(int x, int y, float s) {
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    size = s;
  }
  
}
