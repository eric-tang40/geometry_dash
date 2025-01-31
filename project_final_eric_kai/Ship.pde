class Ship extends Player{
  
  PShape p;
  ArrayList<PVector> history;
  
  Ship(int x, int y, float s) {
    super(x, y, s);
    p = create();
    history = new ArrayList<PVector>();
  }
  
  PShape create() {
    PShape p = createShape(GROUP);
    stroke(0);
    strokeWeight(4);
    fill(#FFFF00);
    PShape body = createShape(RECT, position.x, position.y, size, size);
    strokeWeight(2);
    fill(#00FFFF);
    PShape eye1 = createShape(RECT, position.x + size/5, 
      position.y + size/4, size/5, size/5);
    PShape eye2 = createShape(RECT, position.x + (size/5 * 3), 
      position.y + size/4, size/5, size/5);
    strokeWeight(2);
    PShape mouth = createShape(RECT, position.x + (size*0.15), 
      position.y + (size*0.65), size * 0.7, size * 0.15);
    fill(#FFBE00);
    PShape seat = createShape(RECT, position.x - (size*0.1), 
      position.y + (size * 1), size * 1.25, size * 0.1);
    PShape seat2 = createShape(RECT, position.x - (size*0.1), 
      position.y + (size*0.5), size * 0.1, size * 0.6);
    PShape bottom = createShape(RECT, position.x + (size*0.15), 
      position.y + size, size*0.7, size * 0.5);
    PShape front = createShape(TRIANGLE, position.x + (size*0.85), 
      position.y + size, position.x + (size*0.85), 
      position.y + (size * 1.5), position.x + (size * 1.25), 
      position.y + (size * 1.25));
    PShape back = createShape(QUAD, position.x + (size*0.15), 
      position.y + size, position.x + (size*0.15), position.y + (size*1.5), 
      position.x - (size * 0.3), position.y + (size * 1.7), 
      position.x - (size * 0.3), position.y + (size*0.8));
    PShape engine = createShape(RECT, position.x - (size * 0.5), 
      position.y + (size * 1), size/2, size * 0.45);
    
    p.addChild(engine);
    p.addChild(back);
    p.addChild(bottom);
    p.addChild(front);
    p.addChild(body);
    p.addChild(eye1);
    p.addChild(eye2);
    p.addChild(mouth);
    p.addChild(seat);
    p.addChild(seat2);
    
    return p;
  }
  
  void display() {
    shape(p);
    for(int i=0; i<history.size(); i++) {
      PVector current = history.get(i);
      color c = color(255, 175, 0);
      noStroke();
      fill(c, i*5);
      circle(current.x - (size*0.5), current.y + (size*1.25), (size*0.45)-5);
          
      //reset fill and stroke for other stuff
      fill(0);
      stroke(225);
    }
  }
  
  void run() {
    display();
    
    applyForce(new PVector(0, shipGravity)); //constantly apply gravity
    
   // methods to deal with changing position
    velocity.limit(4.75);
    velocity.add(acceleration);
    position.x += velocity.x;
    position.y += velocity.y;
    p.translate(velocity.x, velocity.y);
    acceleration.mult(0);
    
    //ship doesn't go off screen
    if(this.position.y < 0 || this.position.y + (size * 1.25) > height) {
      playing = false;
      lost = true;
    }
  }
  
  void applyForce(PVector f) {
    PVector d = f.copy();
    acceleration.add(d);
    
    PVector v = position.copy();
    history.add(v);
    if(history.size() > 25) {
      history.remove(0);
    }
  }
  
  void fly() {
    applyForce(new PVector(0, jetStrength * -1));
  }
  
  boolean spikeCollisionCheck(Spike spike) {
    if(spike == null) {
      return false;
    }
    float playerTop = this.position.y;
    float playerBottom = position.y + (size * 1.45);
    float playerFront = position.x + (size * 1.20);
    
    float spikeLeft = spike.position.x - spike.bSize/2;
    float spikeRight = spike.position.x + spike.bSize/2;
    float spikeTop = spike.position.y - spike.bSize;
    float spikeBottom = spike.position.y + spike.bSize * 1.25;
    
    if(playerFront >= spikeLeft && position.x < spikeRight) {
      if(playerTop > spikeBottom || playerBottom < spikeTop) {
        return false;
      }
      else {
        return true;
      }
    }
    return false;
  }
  
  boolean surfDeathCheck(Surface surf) {
    if(surf == null) {
      return false;
    }
    
    float playerTop = this.position.y;
    float playerBottom = position.y + (size * 1.65);
    float playerFront = position.x + (size * 1.20);
    
    float surfLeft = surf.position.x;
    float surfRight = surf.position.x + surf.sizeX;
    float surfTop = surf.position.y;
    float surfBottom = surf.position.y + (surf.sizeY);
    
    if(playerFront >= surfLeft && position.x < surfRight) {
      if(playerTop > surfBottom || playerBottom < surfTop) {
        return false;
      }
      else if(playerTop - 5 == surfBottom) {
        return true;
      }
      else {
        return true;
      }
    }
    
    return false;
  }
 
}
