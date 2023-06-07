class Cube extends Player {

  PShape c;
  boolean canJump;

  Cube(int x, int y, float s) {
    super(x, y, s);
    c = create();
    canJump = true;
  }

  PShape create() {
    PShape c = createShape(GROUP);
    strokeWeight(4);
    fill(#FFFF00);
    PShape body = createShape(RECT, position.x, position.y, size, size);
    strokeWeight(2);
    fill(#00FFFF);
    PShape eye1 = createShape(RECT, position.x + size/5,
      position.y + size/4, size/5, size/5);
    PShape eye2 = createShape(RECT, position.x + (size/5 * 3),
      position.y + size/4, size/5, size/5);
    strokeWeight(3);
    PShape mouth = createShape(RECT, position.x + (size*0.15),
      position.y + (size*0.65), size * 0.7, size * 0.15);

    c.addChild(body);
    c.addChild(eye1);
    c.addChild(eye2);
    c.addChild(mouth);
    return c;
  } //creates the unique shape

  void display() {
    shape(c);
  } //method to display

  void run() {
    display(); //to display the object

    // methods to deal with changing position
    velocity.add(acceleration);
    position.x += velocity.x;
    position.y += velocity.y;
    c.translate(velocity.x, velocity.y);
    acceleration.mult(0);

    // if the object is on the ground
    if (position.y >= ground) {
      velocity.mult(0);
      canJump = true;
    }

    // if the object is "jumping"
    if (position.y < ground) {
      applyForce(new PVector(0, jumpGravity));
      canJump = false;
    }
  }

  void jump() {
    applyForce(new PVector(0, jumpStrength * -1));
  }

  void applyForce(PVector f) {
    PVector d = f.copy();
    acceleration.add(d);
  }

  boolean spikeCollisionCheck(Spike spike) {
    float playerLeft = position.x;
    float playerRight = position.x + size;

    float playerBottom = position.y + size;

    float spikeLeft = spike.position.x - spike.bSize/2;
    float spikeRight = spike.position.x + spike.bSize/2;
    float spikeTop = spike.position.y - spike.bSize/2;

    if (playerRight < spikeLeft || playerLeft > spikeRight || playerBottom < spikeTop) {
      return false;
    } else {
      return true;
    }
  }

  boolean surfCollisionCheck(Surface surf) {
    for(int i=0; i<surf.bSize; i++) {
      for(int j=0; j<this.size; j++) {
        if(this.position.x + j == surf.position.x + i) {
          return true;
        }
      }
    }
    return false;
  }
  
  boolean surfDeathCheck(Surface surf) {
    for(int i=0; i<surf.bSize; i++) {
      for(int j=0; j<this.size; j++) {
        if(this.position.x + size == surf.position.x) {
          if(this.position.y + j == surf.position.y + i) {
            return true;
          }
        }
      }
    }
    return false;
  }
  
  
  
  
  
}
