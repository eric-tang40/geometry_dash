class Spike extends Block {
  
  Spike(int x, int y, float size) {
    super(x, y, size);
  }
  
  void display() {
    stroke(225);
    float spikeHeight = bSize * 2.5; 
    float spikeWidth = bSize * 2.5; 
    
    float spikeTopX = position.x - spikeWidth / 2;
    float spikeTopY = position.y - spikeHeight / 2;
    float spikeBottomX = position.x + spikeWidth / 2;
    float spikeBottomY = position.y + spikeHeight / 2;

    triangle(position.x, spikeTopY, spikeTopX, spikeBottomY, spikeBottomX, spikeBottomY);

  }
  
  void display(boolean rotate) {

    float spikeHeight = bSize * 2.5; 
    float spikeWidth = bSize * 2.5; 
    
    float spikeTopX = position.x - spikeWidth / 2;
    float spikeTopY = position.y - spikeHeight / 2;
    float spikeBottomX = position.x + spikeWidth / 2;
    float spikeBottomY = position.y + spikeHeight / 2;

    triangle(position.x, spikeBottomY, spikeTopX, spikeTopY, spikeBottomX, spikeTopY);

  }
  


}
