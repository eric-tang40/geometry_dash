
//Git Commands
//Access Repo: cd ~/5_p02_final-kai-eric

Cube z, c;
Ship s;
Course co;

//variables for player movement 
float jumpGravity = 1.05;
float shipGravity = 0.15;
float jumpStrength = 12;
float jetStrength = 3.5;
float screenVelocity = 7.5;

PImage img;
PImage img2;
PImage imgMenu;
PImage imgStart;
PImage title;
PImage gameOver;

boolean playing;
boolean lost;
boolean glideEnabled;
float ground;

//menu booleans
PFont logo;
boolean menuActive = true;
boolean blockActive = false;
boolean shipActive = false;
boolean finalActive = false;
boolean runOnce = false;
boolean ranOnce = true;

int curBlock; //keeps track of current block being called for "Cube" course


void setup() {
  stroke(0);
  img = loadImage("geo_dash.png");
  img.resize(1000, 800);
  img2 = loadImage("geo_dash_ship.png");
  img2.resize(1000, 800);
  imgStart = loadImage("geoDashStart.png");
  imgStart.resize(150, 150);
  imgMenu = loadImage("geoDashMenu.png");
  imgMenu.resize(1000, 800);
  title = loadImage("geoDashLogo.png");
  title.resize(800,100);
  gameOver = loadImage("gameOver.jpeg");
  gameOver.resize(1000, 800);
  background(255);
  size(1000, 800);
  z = new Cube(100, 535, 40);
  c = new Cube(100, 535, 40);
  s = new Ship(100, 300, 35);
  co = new Course(60);
  ground = 535;
  playing = true;
  lost = false;
  glideEnabled = false;
  curBlock = 0;
  logo = createFont("Comic Sans MS", 50);
}

void draw() {
  for (int q=0; q<co.p.length; q++) {
    if (co.p[q] != null) {
      if (c.position.x > co.p[q].pX + co.p[q].pW - 150) {
        blockActive = false;
        shipActive = true;
      } // if its in the portal, turns into a ship
    }
  }
  if (menuActive) {
    frameRate(60);                     
    image(img, 0, 0);
    image(title, 125, 100);
    image(imgStart, 400, 300);
    z.run();
    z.move(screenVelocity); 
    if(millis() % 17 == 0) {
      if(runOnce == false) {
        z.jump();
        runOnce = true;
      }
    }
    fill(0); //reset fill of other stuff
  } 
  else if (blockActive) {
    frameRate(60);
    image(img, 0, 0);
    c.run();
    co.displayLevelOne();
    if (playing) {
      co.runLevelOne(c);
    }
    for (int i=0; i<co.c.length; i++) {
      if (c.spikeCollisionCheck(co.c[i])) {
        playing = false;
        lost = true;
        c.canJump = false;
      }
    }
    if (co.b[curBlock] != null) {
      if (c.position.x > co.b[curBlock].position.x + co.b[curBlock].sizeX) {
        curBlock++;
      } 
      else {
        if (c.surfDeathCheck(co.b[curBlock]) == false) {
          if (c.position.x + c.size > co.b[curBlock].position.x && c.position.x < co.b[curBlock].position.x + co.b[curBlock].sizeX * 2) {
            if (co.b[curBlock].sizeY == 25) {
              ground = 495;
            }
            if (co.b[curBlock].sizeY == 40) {
              ground = 470;
            }
            if (co.b[curBlock].sizeY == 60) {
              ground = 445;
            }
          } else {
            ground = 535;
          }
        } else if (c.surfDeathCheck(co.b[curBlock])) {
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
  else if (shipActive) {
    frameRate(60);
    for (int i=0; i<co.p.length; i++) {
      if (co.shipP[i] != null) {
        if (s.position.x > co.shipP[i].pX + co.p[i].pW - 150) {
          shipActive = false;
          finalActive = true;
        } 
      }
    }
    image(img2, 0, 0);
    s.display();
    co.displayLevelTwo();
    if (playing) {
      co.runLevelTwo(s);
      s.run();
    }
    
    for(int i=0; i<co.shipC.length; i++) {
      if (s.spikeCollisionCheck(co.shipC[i])) {
        println("died to spike");
        playing = false;
        lost = true;
      }
      }
    for (int i=0; i<co.shipB.length; i++) {
      if (s.surfDeathCheck(co.shipB[i])) {
        println("died to surf");
        playing = false;
        lost = true;
      }
    }
    if (co.shipB[curBlock] != null && c.surfDeathCheck(co.shipB[curBlock]) == false) {
      curBlock++;
    }
  }
  else if(finalActive) {
    frameRate(60);
    image(img, 0, 0);
    c.display();
    co.displayLevelThree();
    if(playing) {
      c.run();
      co.runLevelThree();
    }
    for (int i=0; i<co.c3.length; i++) {
      if (c.spikeCollisionCheck(co.c3[i])) {
        playing = false;
        lost = true;
        c.canJump = false;
      }
    }
    if (co.b3[curBlock] != null) {
      if (c.position.x > co.b3[curBlock].position.x + co.b3[curBlock].sizeX) {
        curBlock++;
      } 
      else {
        if (c.surfDeathCheck(co.b3[curBlock]) == false) {
          if (c.position.x + c.size > co.b3[curBlock].position.x && c.position.x < co.b3[curBlock].position.x + co.b3[curBlock].sizeX * 2) {
            if (co.b3[curBlock].sizeY == 25) {
              ground = 497;
            }
            if (co.b3[curBlock].sizeY == 50) {
              ground = 460;
            }
            if (co.b3[curBlock].sizeY == 75) {
              ground = 423;
            }
            if (co.b3[curBlock].sizeY == 100) {
              ground = 385;
            }
            if (co.b3[curBlock].sizeY == 125) {
              ground = 351;
            }
          } 
          else {
            ground = 535;
          }
        } 
        else if (c.surfDeathCheck(co.b3[curBlock])) {
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
  if (lost) {
    image(gameOver, 0, 0);

    fill(255);
    textSize(50);
    text("Press Spacebar to Play Again", width/5+10, height/2+350);
  }
}

void reset() {
  menuActive = true;
  blockActive = false;
  shipActive = false;
  finalActive = false;
  runOnce = false;
  ranOnce = true;
  lost = false;
  setup();
}

void keyPressed() {
  if (key == ' ') {
    if (c.canJump) {
      c.jump();
      c.canJump = false;
    }

    if (shipActive) {
      s.fly();
    }
    if (lost) {
      reset();
    }
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
  if (mouseX > 410 && mouseX < 540 && mouseY > 310 && mouseY < 440) {
    if (menuActive && blockActive == false) {
      curBlock = 0;
      menuActive = !menuActive;
      blockActive = !blockActive;
      c.jump();
      //shipActive = !shipActive;
      //finalActive = !finalActive;
    }
  }
}
