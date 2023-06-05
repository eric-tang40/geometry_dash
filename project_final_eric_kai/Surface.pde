class Surface extends Block {
  
  Surface(int x, int y, float size) {
    super(x, y, size);
  }
  
  void display() {
    float surfSize = bSize * 1.5;
    float surfX = position.x;
    float surfY = position.y;
    
    square(surfX,surfY,surfSize);
  }
}
