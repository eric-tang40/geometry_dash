
//NOTE TO KAI:
//If you want to run the program, go to draw and
//either use c.run() or s.run()

//Also I haven't figured out mouse commands for the ship 
//only space bar works for ship


Cube c;
Ship s;
float jumpGravity = 0.5;
float shipGravity = 0.075;
float jumpStrength = 7.5;
float jetStrength = 1;


void setup() {
  background(255);
  size(1000,800);
  c = new Cube(50, 600, 50);
  s = new Ship(500, 300, 50);
}

void draw() {
  background(255);
  //c.run();
  s.run();
}

void keyPressed() {
  if(key == ' ') {
    if(c.canJump) {
      c.jump();
      c.canJump = false;
    }
    
    s.fly();
  }
}

void mousePressed() {
  if(c.canJump) {
    c.jump();
    c.canJump = false;
  }
  
  s.fly();
}
