
//Git Commands
//Access Repo: cd ~/5_p02_final-kai-eric


Cube c;
Ship s;
Surface surf;
Course co;
float jumpGravity = 0.9;
float shipGravity = 0.075;
float jumpStrength = 12;
float jetStrength = 1;
float screenVelocity = 7.5;

PImage img;

boolean playing;
boolean lost;
boolean glideEnabled;
float ground = 535;

//menu booleans
PFont logo;
boolean menuActive = true;
boolean gameActive = false;


void setup() {
  img = loadImage("geo_dash.png");
  img.resize(1000, 800);
  background(255);
  size(1000, 800);
  c = new Cube(100, 535, 40);
  s = new Ship(500, 300, 50);
  //spike = new Spike(850, 560, 15);
  surf = new Surface(450, 542, 25);
  co = new Course(10);
  playing = true;
  lost = false;
  glideEnabled = false;
  logo = createFont("Chalkboard", 50);
}

void draw() {
  if(menuActive) {
    frameRate(20);
    image(img, 0, 0);
    fill(154, 242, 57);
    textFont(logo);
    textSize(100);
    text("Geometry Dash", width/4-60, height/4+100);
    textSize(30);
    text("Click Anywhere to Play", width/4+120, height/2+120);
    fill(0); //reset fill of other stuff
  }
  
  else if(gameActive) {
    frameRate(60);
    image(img, 0, 0);
    c.run();
    surf.display();
    co.display();
    if (playing) {
      //spike.move();
      surf.move();
      co.run();
    }
    if (c.spikeCollisionCheck(co)) {
      playing = false;
      lost = true;
      c.canJump = false;
    }
    if(c.surfDeathCheck(surf) == false) { 
      if (c.surfCollisionCheck(surf)) {
        ground = 495;
      }
      if(c.surfCollisionCheck(surf) == false) {
        ground = 535;
      }
    }
    else {
      playing = false;
      lost = true;
      c.canJump = false;
    }
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
  if (c.canJump && gameActive) {
    c.jump();
    c.canJump = false;
  }
  
  if(gameActive) {
    s.fly();
  }
  
  if(menuActive && gameActive == false) {
    menuActive = !menuActive;
    gameActive = !gameActive;
  }
}
