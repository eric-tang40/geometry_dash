
//Git Commands
//Access Repo: cd ~/5_p02_final-kai-eric


Cube c;
Ship s;
Surface surf;
Course co;
Portal portal;

float jumpGravity = 0.9;
float shipGravity = 0.1;
float jumpStrength = 12;
float jetStrength = 1.5;
float screenVelocity = 7.5;

PImage img;
PImage img2;
PImage imgMenu;
PImage imgStart;

boolean playing;
boolean lost;
boolean glideEnabled;
float ground = 535;

//menu booleans
PFont logo;
boolean menuActive = true;
boolean blockActive = false;
boolean shipActive = false;


void setup() {
  img = loadImage("geo_dash.png");
  img.resize(1000, 800);
  img2 = loadImage("geo_dash_ship.png");
  img2.resize(1000, 800);
  imgStart = loadImage("geoDashStart.png");
  imgStart.resize(150, 150);

  background(255);
  size(1000, 800);
  c = new Cube(75, 535, 40);
  s = new Ship(100, 500, 50);
  //spike = new Spike(850, 560, 15);
  surf = new Surface(450, 542, 25);
  co = new Course(10);
  portal = new Portal(co.courseEnd, 325, 300, 300);
  playing = true;
  lost = false;
  glideEnabled = false;
  logo = createFont("Comic Sans MS", 50);
}

void draw() {
  if (c.position.x > portal.pX + portal.pW - 150) {
    blockActive = false;
    shipActive = true;
  }
  if (menuActive) {
    frameRate(20);
    image(img2, 0, 0);
    image(imgStart, 400, 500);
    fill(154, 242, 57);
    textFont(logo);
    textSize(100);
    text("Geometry Dash", width/4-100, height/4+100);
    textSize(30);
    //text("Click Below to Play", width/4+120, height/2+120);
    fill(0); //reset fill of other stuff
  } else if (blockActive) {
    frameRate(60);
    image(img, 0, 0);
    c.run();
    surf.display();
    co.display();
    if (playing) {
      surf.move();
      co.run();

      portal.display();
      portal.move();
    }

    for (int i=0; i<co.c.length; i++) {
      if (c.spikeCollisionCheck(co.c[i])) {
        playing = false;
        lost = true;
        c.canJump = false;
      } else {
        ground = 535;
      }
    }
    if (c.surfDeathCheck(surf) == false) {
      if (c.surfCollisionCheck(surf)) {
        ground = 495;
      }
      if (c.surfCollisionCheck(surf) == false) {
        ground = 535;
      }
    } else if (c.surfDeathCheck(surf)) {
      println(true);
      playing = false;
      lost = true;
      c.canJump = false;
    }
  } else if (shipActive) {
    frameRate(60);
    image(img2, 0, 0);
    s.display();
    s.run();
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
  if (c.canJump && blockActive) {
    c.jump();
    c.canJump = false;
  }

  if (shipActive) {
    s.fly();
  }
  if (mouseX > 410 && mouseX < 540 && mouseY > 510 && mouseY < 640) {
    if (menuActive && blockActive == false) {
      menuActive = !menuActive;
       blockActive = !blockActive;
      //shipActive = !shipActive;
    }
  }
}
