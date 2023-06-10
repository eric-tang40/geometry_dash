class Course {
  
  Spike[] c;
  int curIndex;
  int curX;
  
  Course(int num) {
    c = new Spike[num];
    curIndex = 0;
    curX = 850;
    addSpike(num);
  }
  
  void addSpike() {
    if(c[curIndex] == null) {
      c[curIndex] = new Spike(curX, 560, 15);
      curIndex++;
      curX += 300;
    }
  }
  
  void addSpike(int num) {
    for(int i=0; i<num; i++) {
      if(c[curIndex] == null) {
        c[curIndex] = new Spike(curX, 560, 15);
        curIndex++;
        curX += 300;
      }
    }
  }
  
  void display() {
    for(int i=0; i<c.length; i++) {
      if(c[i] != null) {
        c[i].display();
      }
    }
  }
  
  void run() {
    display();
    for(int i=0; i<c.length; i++) { 
      if(c[i] != null) {
        c[i].move();
      }
    }
  }
  
}
