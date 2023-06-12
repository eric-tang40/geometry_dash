//course1, add a course2 for the ship commands
class Course {

  //test



  Spike[] c;
  //Block[] b;
  int curIndex;
  int curX;
  int courseEnd;
  int spikeOffset, portalOffset;

  Course(int num) {
    c = new Spike[num];
    curIndex = 0;
    curX = 850;
    addSpike(num);
    portalOffset = 1000;
    courseEnd = (num*300) + portalOffset;
  }

  void addSpike() {
    if (c[curIndex] == null) {
      c[curIndex] = new Spike(curX, 560, 15);
      curIndex++;
      curX += 300;  
    }
  }

  void addSpike(int num) {
    for (int i=0; i<num; i++) {
      if (c[curIndex] == null) {
        c[curIndex] = new Spike(curX, 560, 15);
        curIndex++;
        curX += 300;
        
      }
    }
  }

  void display() {
    for (int i=0; i<c.length; i++) {
      if (c[i] != null) {
        c[i].display();
      }
    }
  }

  void run() {
    display();
    for (int i=0; i<c.length; i++) {
      if (c[i] != null) {
        c[i].move();
      }
    }
  }
}
