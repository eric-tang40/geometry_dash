
//NOTE TO KAI:
//If you want to run the program, go to draw and
//either use c.run() or s.run()

//Also I haven't figured out mouse commands for the ship
//only space bar works for ship


Cube c;
Ship s;
Spike spike;
Surface surf;
float jumpGravity = 0.5;
float shipGravity = 0.075;
float jumpStrength = 7.5;
float jetStrength = 1;

PImage img;

boolean playing;
boolean lost;
boolean glideEnabled;



void setup() {
  img = loadImage("geo_dash.png");
  img.resize(1000, 800);
  background(255);
  size(1000, 800);
  c = new Cube(100, 525, 50);
  s = new Ship(500, 300, 50);
  spike = new Spike(650, 560, 25);
  surf = new Surface(450, 542, 25);
  playing = true;
  lost = false;
  glideEnabled = false;
}

void draw() {
  image(img, 0, 0);
  //background(255);
  c.run();
  // s.run();
  spike.display();
  surf.display();
  //println(c.position.y);
  if (playing) {
    spike.move();
    surf.move();
  }
  if (c.spikeCollisionCheck(spike)) {
    playing = false;
    lost = true;
    c.canJump = false;
  }
  if (c.surfCollisionCheck(surf)) {
    c.velocity.y = 0;
    c.position.y = surf.position.y - c.size;
  }
  if (c.position.x > surf.position.x + surf.bSize) {
      
    }
}

void keyPressed() {
  if (key == ' ') {
    if (c.canJump) {
      c.jump();
      c.canJump = false;
    }

    s.fly();
  }
}

void mousePressed() {
  if (c.canJump) {
    c.jump();
    c.canJump = false;
  }

  s.fly();
}
