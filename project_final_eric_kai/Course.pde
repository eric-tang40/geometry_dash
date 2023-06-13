class Course {
  
  //test
  
  
  Spike[] c;
  Surface[] b;
  int bCurIndex;
  int cCurIndex;
  int curX;
  int courseEnd;
  int spikeOffset, portalOffset;
  
  Course(int num) {
    c = new Spike[num];
    b = new Surface[num];
    bCurIndex = 0;
    cCurIndex = 0;
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
  
  void makeLevelOne() {
    //addSpike(300);
    //addSpike(300);
    //addSpike(25);
    //addSpike(350);
    //addSpike(25);
    //addSurface(10, 50, 25);
    //addSpike(40);
    //addSurface(10, 50, 40);
    //addSpike(40);
    //addSurface(20, 50, 60);
    //addSpike(350);
    //addSpike(25);
    //addSurface(125, 150, 25);
    //addSpike(125);
    //addSpike(25);
    //addSurface(50, 150, 25);
    //addSpike(125);
    //addSpike(25);
    //addSurface(50, 150, 40);
    addSurface(100, 50, 25);
    addSurface(130, 50, 40);
    addSurface(160, 50, 60);
  }
  
  void displayLevelOne() {
    for(int i=0; i<c.length; i++) { 
      if(c[i] != null) {
        c[i].display();
      }
      if(b[i] != null) {
        b[i].display();
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
