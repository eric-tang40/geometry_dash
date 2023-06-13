class Course {

  //test


  Spike[] c;
  Surface[] b;
  Portal[] p;

  Spike[] shipC;
  Portal[] shipP;
  Surface[] shipB;
  int bCurIndex;
  int cCurIndex;
  int pCurIndex;
  int bShipCur, cShipCur, pShipCur;
  int curX, curShipX;
  int spikeOffset, portalOffset, surfYOffset;

  Course(int num) {
    c = new Spike[num];
    b = new Surface[num];
    p = new Portal[num];

    shipB = new Surface[num];
    shipP = new Portal[num];
    shipC = new Spike[num];
    
    bCurIndex = 0;
    cCurIndex = 0;
    pCurIndex = 0;

    bShipCur = 0;
    cShipCur = 0;
    pShipCur = 0;

    curX = 550;
    curShipX = 550;
    makeLevelOne();
    makeLevelTwo();
    portalOffset = 1000;
  }

  void addSpike(int spacing) {
    if (c[cCurIndex] == null) {
      curX += spacing;
      c[cCurIndex] = new Spike(curX, 560, 15);
      curX += 15;
      cCurIndex++;
    }
  }

  void addSurface(int spacing, float sizeX, float sizeY) {
    if (b[bCurIndex] == null) {
      curX += spacing;
      b[bCurIndex] = new Surface(curX, 542, sizeX, sizeY);
      curX += sizeX;
      bCurIndex++;
    }
  }

  void addPortal(int spacing) {
    if (p[pCurIndex] == null) {
      curX += spacing;
      p[pCurIndex] = new Portal(curX, 325, 300, 300);
      curX += 300;
      pCurIndex++;
    }
  }

  void makeLevelOne() {
    addSpike(300);
    addSpike(300);
    addSpike(25);
    addSpike(350);
    addSpike(25);
    addSurface(10, 70, 25);
    addSpike(30);
    addSpike(30);
    addSurface(20, 70, 40);
    addSpike(30);
    addSpike(30);
    addSurface(20, 70, 60);
    addSpike(350);
    addSpike(25);
    addSurface(125, 150, 25);
    addSpike(75);
    addSpike(25);
    addSurface(30, 150, 25);
    addSpike(75);
    addSpike(25);
    addSurface(30, 150, 40);
    addPortal(200);
  }
  void addShipSpike(int spacing, int y, float size, boolean shouldRotate) {
    if (shipC[cShipCur] == null) {
      curShipX += spacing;
      if(shouldRotate) {
        size += 0.01;
      }
      shipC[cShipCur] = new Spike(curShipX, y, size);
      curShipX += 15;
      cShipCur++;
    }
  }

  void addShipSurface(int spacing, int varY, float sizeX, float sizeY) {
    if (shipB[bShipCur] == null) {
      curShipX += spacing;
      shipB[bShipCur] = new Surface(curShipX, varY, sizeX, sizeY);
      curShipX += sizeX;
      bShipCur++;
    }
  }

  void addShipPortal(int spacing) {
    if (p[pShipCur] == null) {
      curShipX += spacing;
      p[pShipCur] = new Portal(curShipX, 325, 300, 300);
      pShipCur++;
    }
  }

  void makeLevelTwo() {
    int spikeXSpacing = -20;
    
    //addShipSurface(0, 0, 20000, 100); //ideally this and the line below will be last, but need to fix collisions.
    
    //addShipSurface(0, height-100, 20000, 100);
    addShipSurface(500, height-200, 40, 215); //bottom surf
    addShipSpike(spikeXSpacing, height-200 + spikeXSpacing + 1, 16, false); //bottom spike
    addShipSurface(0, 0, 40, 215); //top surface
    addShipSpike(spikeXSpacing, 215 - spikeXSpacing - 1, 16, true); //top spike
    addShipSurface(200, height-200, 40, 315);
    addShipSurface(0, 0, 40, 315);
    addShipSurface(200, height-200, 40, 215);
    addShipSurface(0, 0, 40, 215);
    addShipPortal(2000);
  }

  void displayLevelOne() {
    for (int i=0; i<b.length; i++) {
      if (c[i] != null) {
        c[i].display();
      }
      if (b[i] != null) {
        b[i].display();
      }
      if (p[i] != null) {
        p[i].display();
      }
    }
  }

  void runLevelOne(Cube s) {
    for (int i=0; i<c.length; i++) {
      if (c[i] != null) {
        c[i].display();
        c[i].move();
      }
      if (b[i] != null) {
        b[i].display();
        b[i].move();
      }
      if (p[i] != null) {
        p[i].display();
        p[i].move();
      }
    }
  }

  void displayLevelTwo() {
    for (int i=0; i<b.length; i++) {
      //if(c[i] != null) {
      //  c[i].display();
      //}
      if (shipB[i] != null) {
        shipB[i].displayShip();
      }
      if (shipP[i] != null) {
        shipP[i].display();
      }
    }
  }

  void runLevelTwo(Ship s) {
    for (int i=0; i<c.length; i++) {
      if(shipC[i] != null) {
        if(shipC[i].bSize % 1 == 0) {
          shipC[i].display();
        }
        else {
          shipC[i].display(true);
        }
        shipC[i].move();
      }
      if (shipB[i] != null) {
        shipB[i].displayShip();
        shipB[i].move();
      }
      if (shipP[i] != null) {
        shipP[i].display();
        shipP[i].move();
      }
    }
  }

  //void addSpike(int num) {
  //  for(int i=0; i<num; i++) {
  //    if(c[curIndex] == null) {
  //      c[curIndex] = new Spike(curX, 560, 15);
  //      curIndex++;
  //      curX += 300;
  //    }
  //  }
  //}
}
