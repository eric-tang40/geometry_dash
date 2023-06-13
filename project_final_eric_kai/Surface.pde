class Surface extends Block {
  
  float sizeX;
  float sizeY;
  
  Surface(int x, int y, float sX, float sY) {
    super(x, y);
    bSize = sX * 2.25;
    sizeX = sX;
    sizeY = sY;
  }
  
  void display() {
    rect(position.x, 579.5 - sizeY*1.5, sizeX * 1.0, sizeY * 1.5);
  }
  
  void displayShip() {
    rect(position.x, position.y, sizeX, sizeY);
  }
}
