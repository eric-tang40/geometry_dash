class Course {
  
  //test
  
  
  Spike[] c;
  Surface[] b;
  Portal[] p;
  int bCurIndex;
  int cCurIndex;
  int pCurIndex;
  int curX;
  int courseEnd;
  int spikeOffset, portalOffset;
  
  Course(int num) {
    c = new Spike[num];
    b = new Surface[num];
    p = new Portal[num];
    bCurIndex = 0;
    cCurIndex = 0;
    pCurIndex = 0;
    curX = 550;
    makeLevelOne();
    portalOffset = 1000;
    courseEnd = (num*300) + portalOffset;
  }
  
  void addSpike(int spacing) {
    if(c[cCurIndex] == null) {
      curX += spacing;
      c[cCurIndex] = new Spike(curX, 560, 15);
      curX += 15;
      cCurIndex++;
    }
  }
  
  void addSurface(int spacing, float sizeX, float sizeY) {
    if(b[bCurIndex] == null) {
      curX += spacing;
      b[bCurIndex] = new Surface(curX, 542, sizeX, sizeY);
      curX += sizeX;
      bCurIndex++;
    }
  }
  
  void addPortal(int spacing) {
    if(p[pCurIndex] == null) {
      curX += spacing;
      p[pCurIndex] = new Portal(curX, 325, 300, 300);
      curX += 300;
      pCurIndex++;
    }
  }
  
  void makeLevelOne() {
    //addSpike(300);
    //addSpike(300);
    //addSpike(25);
    //addSpike(350);
    //addSpike(25);
    //addSurface(10, 70, 25);
    //addSpike(30);
    //addSpike(30);
    //addSurface(20, 70, 40);
    //addSpike(30);
    //addSpike(30);
    //addSurface(20, 70, 60);
    //addSpike(350);
    //addSpike(25);
    //addSurface(125, 150, 25);
    //addSpike(75);
    //addSpike(25);
    //addSurface(30, 150, 25);
    //addSpike(75);
    //addSpike(25);
    //addSurface(30, 150, 40);
    addPortal(200);
  }
  
  void displayLevelOne() {
    for(int i=0; i<c.length; i++) { 
      if(c[i] != null) {
        c[i].display();
      }
      if(b[i] != null) {
        b[i].display();
      }
      if(p[i] != null) {
        p[i].display();
      }
    }
  }
  
  void runLevelOne(Cube s) {
    for(int i=0; i<c.length; i++) { 
      if(c[i] != null) {
        c[i].display();
        c[i].move();
      }
      if(b[i] != null) {
        b[i].display();
        b[i].move();
      }
      if(p[i] != null) {
        p[i].display();
        p[i].move();
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
