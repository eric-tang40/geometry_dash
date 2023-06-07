
//Git Commands
//Access Repo: cd ~/5_p02_final-kai-eric


Cube c;
Ship s;
Spike spike;
Surface surf;
float jumpGravity = 0.5;
float shipGravity = 0.075;
float jumpStrength = 8;
float jetStrength = 1;
float screenVelocity = 5;

PImage img;

boolean playing;
boolean lost;
boolean glideEnabled;
float ground = 525;



void setup() {
  img = loadImage("geo_dash.png");
  img.resize(1000, 800);
  background(255);
  size(1000, 800);
  c = new Cube(100, 525, 50);
  s = new Ship(500, 300, 50);
  spike = new Spike(850, 560, 25);
  surf = new Surface(450, 542, 25);
  playing = true;
  lost = false;
  glideEnabled = false;
}

void draw() {
  image(img, 0, 0);
  c.run();
  // s.run();
  spike.display();
  surf.display();
  if (playing) {
    spike.move();
    surf.move();
  }
  if (c.spikeCollisionCheck(spike)) {
    playing = false;
    lost = true;
    c.canJump = false;
  }
  if(c.surfDeathCheck(surf) == false) { 
    if (c.surfCollisionCheck(surf)) {
      ground = 485;
    }
    if(c.surfCollisionCheck(surf) == false) {
      ground = 525;
    }
  }
  else {
    playing = false;
    lost = true;
    c.canJump = false;
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
