class Paper {
  int x;
  int y;
  int w;
  int h;

  int paper;

PImage paper0;
PImage paper1;

  Paper(int startingX, int startingY, int startingW, int startingH, int startingPaper) {

    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;

    paper = startingPaper;
    
    paper0 = loadImage("paper0.png"); 
    paper1 = loadImage("paper1.png");
  }


  void PaperSprite() {
    rectMode(CENTER);

    if (paper == 0) {
      image(paper0, x, y);
    }
    if (paper == 1) {
      image(paper1, x, y);
    }
    if (paper == 2) {
      image(paper0, x, y);
    }

    if (paper == 3) {
      image(paper1, x, y);
    }
  }
}
