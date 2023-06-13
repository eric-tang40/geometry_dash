
//Git Commands
//Access Repo: cd ~/5_p02_final-kai-eric

//test if it works


Cube c;
Ship s;
Course co;
Portal portal;
float jumpGravity = 1.05;
float shipGravity = 0.1;
float jumpStrength = 11;
float jetStrength = 1.5;
float screenVelocity = 7.5;

PImage img;
PImage img2;
PImage imgMenu;
PImage imgStart;

boolean playing;
boolean lost;
boolean glideEnabled;
float ground;

//menu booleans
PFont logo;
boolean menuActive = true;
boolean blockActive = false;
boolean shipActive = false;

int curBlock;


void setup() {
  img = loadImage("geo_dash.png");
  img.resize(1000, 800);
  img2 = loadImage("geo_dash_ship.png");
  img2.resize(1000, 800);
  imgStart = loadImage("geoDashStart.png");
  imgStart.resize(150, 150);
  imgMenu = loadImage("geoDashMenu.png");
  imgMenu.resize(1000, 800);
  background(255);
  size(1000, 800);
  c = new Cube(100, 535, 40);
  s = new Ship(500, 300, 50);
  co = new Course(20);
  portal = new Portal(co.courseEnd*1000, 325, 300, 300);
  ground = 535;
  playing = true;
  lost = false;
  glideEnabled = false;
  curBlock = 0;
  logo = createFont("Comic Sans MS", 50);
}

void draw() {
  if (c.position.x > portal.pX + portal.pW - 150) {
    blockActive = false;
    shipActive = true;
  } // if its in the portal, turns into a ship
  if(menuActive) {
    frameRate(20);
    image(imgMenu, 0, 0);
    image(imgStart, 400, 500);
    //fill(154, 242, 57);
    //textFont(logo);
    //textSize(100);
    //text("Geometry Dash", width/4-60, height/4+100);
    //textSize(30);
    //text("Click Anywhere to Play", width/4+120, height/2+120);
    fill(0); //reset fill of other stuff
  }
  
  else if(blockActive) {
    frameRate(60);
    image(img, 0, 0);
    c.run();
    co.displayLevelOne();
    if (playing) {
      portal.display();
      portal.move();
      co.runLevelOne(c);
    }
    for(int i=0; i<co.c.length; i++) {
      if(c.spikeCollisionCheck(co.c[i])) {
        playing = false;
        lost = true;
        c.canJump = false;
      }
    }
    if(co.b[curBlock] != null) {
      if(c.position.x > co.b[curBlock].position.x + co.b[curBlock].sizeX) { 
        curBlock++;
      }
      else {
        if(c.surfDeathCheck(co.b[curBlock]) == false) {
          if(c.position.x + c.size > co.b[curBlock].position.x && c.position.x < co.b[curBlock].position.x + co.b[curBlock].sizeX * 2) {
            if(co.b[curBlock].sizeY == 25) {
              ground = 495;
            }
            if(co.b[curBlock].sizeY == 40) {
              ground = 470;
            }          
            if(co.b[curBlock].sizeY == 60) {
              ground = 445;
            }
          }
          else {
            ground = 535;
          }
        }
        else if(c.surfDeathCheck(co.b[curBlock])) {
          playing = false;
          lost = true;
          c.canJump = false;
        }
      }
    }
    else {
      ground = 535;
    }
  }
  
  
  else if(shipActive) {
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
