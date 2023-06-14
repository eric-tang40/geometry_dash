class Course {

  //test


  Spike[] c;
  Surface[] b;
  Portal[] p;

  Spike[] shipC;
  Portal[] shipP;
  Surface[] shipB;

  //level 3 arrays
  Spike[] c3;
  Surface[] b3;
  Portal[] p3;

  int bCurIndex;
  int cCurIndex;
  int pCurIndex;
  int bShipCur, cShipCur, pShipCur;
  int c3CurIndex, b3CurIndex, p3CurIndex;
  int curX, curShipX, curX3;
  int spikeOffset, portalOffset, surfYOffset;

  Course(int num) {
    c = new Spike[num];
    b = new Surface[num];
    p = new Portal[num];

    shipB = new Surface[num];
    shipP = new Portal[num];
    shipC = new Spike[num];

    c3 = new Spike[num];
    b3 = new Surface[num];
    p3 = new Portal[num];

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
    makeLevelThree();
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
    addSurface(150, 150, 25);
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
      if (shouldRotate) {
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
    if (shipP[0] == null) {
      curShipX += spacing;
      shipP[0] = new Portal(curShipX, 255, 300, 300);
      curShipX += 300;
      pShipCur++;
    }
  }

  void makeLevelTwo() {
    int spikeXSpacing = 20;

    //addShipSurface(0, 0, 20000, 100); //ideally this and the line below will be last, but need to fix collisions.

    //addShipSurface(0, height-100, 20000, 100);
    addShipSpike(300-spikeXSpacing, height - spikeXSpacing, 16, false);
    addShipSpike(-spikeXSpacing, spikeXSpacing, 16, true);
    addShipSpike(-spikeXSpacing*3, height - spikeXSpacing, 16, false);
    addShipSpike(-spikeXSpacing, spikeXSpacing, 16, true);
    addShipSpike(-spikeXSpacing*3, height - spikeXSpacing, 16, false);
    addShipSpike(-spikeXSpacing, spikeXSpacing, 16, true);
    addShipSpike(-spikeXSpacing*3, height - spikeXSpacing, 16, false);
    addShipSpike(-spikeXSpacing, spikeXSpacing, 16, true);
    addShipSpike(-spikeXSpacing*3, height - spikeXSpacing, 16, false);
    addShipSpike(-spikeXSpacing, spikeXSpacing, 16, true);
    addShipSpike(-spikeXSpacing*3, height - spikeXSpacing, 16, false);
    addShipSpike(-spikeXSpacing, spikeXSpacing, 16, true);
    addShipSpike(-spikeXSpacing*3, height - spikeXSpacing, 16, false);
    addShipSpike(-spikeXSpacing, spikeXSpacing, 16, true);
    addShipSpike(-spikeXSpacing*3, height - spikeXSpacing, 16, false);
    addShipSpike(-spikeXSpacing, spikeXSpacing, 16, true);
    addShipSpike(-spikeXSpacing*3, height - spikeXSpacing, 16, false);
    addShipSpike(-spikeXSpacing, spikeXSpacing, 16, true);
    addShipSpike(-spikeXSpacing, spikeXSpacing, 16, true);
    addShipSpike(-spikeXSpacing, spikeXSpacing, 16, true);
    addShipSpike(-spikeXSpacing*3, spikeXSpacing, 16, true);


    addShipSurface(500, height-175, 40, 175); //bottom surf
    addShipSpike(-spikeXSpacing, height- 175 - spikeXSpacing + 1, 16, false); //bottom spike
    addShipSurface(0, 0, 40, 175); //top surface
    addShipSpike(-spikeXSpacing, 175 + spikeXSpacing - 1, 16, true); //top spike

    addShipSurface(200, height-200, 40, 315);
    addShipSpike(-spikeXSpacing, height-200 - spikeXSpacing + 1, 16, false); //bottom spike
    addShipSurface(0, 0, 40, 215);
    addShipSpike(-spikeXSpacing, 215 + spikeXSpacing - 1, 16, true); //top spike

    addShipSurface(200, height-250, 40, 265);
    addShipSpike(-spikeXSpacing, height-250 - spikeXSpacing + 1, 16, false); //bottom spike
    addShipSurface(0, 0, 40, 265);
    addShipSpike(-spikeXSpacing, 265 + spikeXSpacing - 1, 16, true); //top spike

    addShipSurface(200, height-250, 40, 265);
    addShipSpike(-spikeXSpacing, height-250 - spikeXSpacing + 1, 16, false); //bottom spike
    addShipSurface(0, 0, 40, 265);
    addShipSpike(-spikeXSpacing, 265 + spikeXSpacing - 1, 16, true); //top spike

    addShipSurface(200, height-200, 40, 315);
    addShipSpike(-spikeXSpacing, height-200 - spikeXSpacing + 1, 16, false); //bottom spike
    addShipSurface(0, 0, 40, 215);
    addShipSpike(-spikeXSpacing, 215 + spikeXSpacing - 1, 16, true); //top spike

    addShipSurface(300, height-200, 40, 215); //bottom surf
    addShipSpike(-spikeXSpacing, height-200 - spikeXSpacing + 1, 16, false); //bottom spike
    addShipSurface(0, 0, 40, 215); //top surface
    addShipSpike(-spikeXSpacing, 215 + spikeXSpacing - 1, 16, true); //top spike
    addShipSurface(-spikeXSpacing, height-200, 40, 215); //bottom surf
    addShipSpike(-spikeXSpacing, height-200 - spikeXSpacing + 1, 16, false); //bottom spike
    addShipSurface(0, 0, 40, 215); //top surface
    addShipSpike(-spikeXSpacing, 215 + spikeXSpacing - 1, 16, true); //top spike

    addShipSurface(300,0,2000,300);
    addShipSurface(-2000,height-300,2000,300);
    addShipPortal(-1800);
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
      if (c[i] != null) {
        c[i].display();
      }
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
      if (shipC[i] != null) {
        if (shipC[i].bSize % 1 == 0) {
          shipC[i].display();
        } else {
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

  void addSpike3(int spacing) {
    if (c3[c3CurIndex] == null) {
      curX3 += spacing;
      c3[c3CurIndex] = new Spike(curX3, 560, 15);
      curX3 += 15;
      c3CurIndex++;
    }
  }

  void addSpike3(int spacing, int y) {
    if (c3[c3CurIndex] == null) {
      curX3 += spacing;
      c3[c3CurIndex] = new Spike(curX3, y, 15);
      curX3 += 15;
      c3CurIndex++;
    }
  }

  void addSurface3(int spacing, float sizeX, float sizeY) {
    if (b3[b3CurIndex] == null) {
      curX3 += spacing;
      b3[b3CurIndex] = new Surface(curX3, 542, sizeX, sizeY);
      curX3 += sizeX;
      b3CurIndex++;
    }
  }

  void addPortal3(int spacing) {
    if (p3[p3CurIndex] == null) {
      curX3 += spacing;
      p3[p3CurIndex] = new Portal(curX3, 1025, 300, 300);
      curX3 += 300;
      p3CurIndex++;
    }
  }

  void makeLevelThree() {
    addSpike3(550);
    addSpike3(275);
    addSpike3(25);
    addSpike3(275);
    addSpike3(20);
    addSpike3(20);
    addSurface3(800, 70, 25);
    addSurface3(115, 70, 50);
    addSpike3(-50, 535);
    addSurface3(130, 70, 75);
    addSpike3(-50, 495);
    addSurface3(130, 70, 100);
    addSpike3(-50, 470);
    addSurface3(130, 70, 125);
    addSpike3(-50, 450);
    addSurface3(70, 70, 100);
    addSurface3(70, 70, 75);
    addSurface3(70, 70, 50);
    addSurface3(70, 70, 25);
    addPortal3(200);
  }

  void displayLevelThree() {
    for (int i=0; i<b.length; i++) {
      if (c3[i] != null) {
        if (c3[i].position.y == 560) {
          c3[i].display();
        }
      }
      if (b3[i] != null) {
        b3[i].displayFloat();
      }
    }
  }

  void runLevelThree(Cube c) {
    for (int i=0; i<c3.length; i++) {
      if (c3[i] != null) {
        if (c3[i].position.y == 560) {
          c3[i].display();
        }
        c3[i].move();
      }
      if (b3[i] != null) {
        b3[i].displayFloat();
        b3[i].move();
      }
      if (p3[i] != null) {
        p3[i].display();
        p3[i].move();
      }
    }
  }
}
