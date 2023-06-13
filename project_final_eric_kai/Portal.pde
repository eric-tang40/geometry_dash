class Portal {
  
  int pX, pY, pW, pH;
  PImage portal;
  
  Portal (int portalX, int portalY, int portalW, int portalH) {
    pX = portalX;
    pY = portalY;
    pW = portalW;
    pH = portalH;
    }
    
   void display() {
       portal = loadImage("geoDashP1.png");
       image(portal, pX, pY, pW, pH);
   }
   
   void move() {
     pX-=screenVelocity;
   }

  }
