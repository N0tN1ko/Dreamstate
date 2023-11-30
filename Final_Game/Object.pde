class Object {
  int x;
  int y;
  int w;
  int h;

  int left;
  int right;
  int top;
  int bottom;
  

  Object(int startingX, int startingY, int startingW, int startingH) {

    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;

    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
    
  }


  void render() {
    rectMode(CENTER);
    rect(x, y, w, h);
  }



  //////////////////////////////////////////////////////////////
  //Collisionsetup/////////////////////////////////////////////

  void Collision(Player aPlayer) {

    if (aPlayer.top < bottom &&
      aPlayer.bottom > top &&
      aPlayer.right >= left &&
      aPlayer.left < left) {

      aPlayer.isMovingRight = false;
      aPlayer.playerX = left - aPlayer. playerS/2;
      aPlayer.playerX = aPlayer.playerX;
    }

    if (aPlayer.top < bottom &&
      aPlayer.bottom > top &&
      aPlayer.left <= right &&
      aPlayer.right > right) {

      aPlayer.isMovingLeft = false;
      aPlayer.playerX = right +  aPlayer.playerS/2;
      aPlayer.playerX = aPlayer.playerX ;
    }
    if (aPlayer.left < right &&
      aPlayer.right > left &&
      aPlayer.bottom >= top &&
      aPlayer.top < top) {

      aPlayer.isMovingDown = false;
      aPlayer.playerY = top - aPlayer.playerS/2;
      aPlayer.playerY = aPlayer.playerY;
    }

    if (aPlayer.left < right &&
      aPlayer.right > left &&
      aPlayer.top <= bottom &&
      aPlayer.bottom > bottom) {

      aPlayer.isMovingUp = false;
      aPlayer.playerY = bottom + aPlayer.playerS/2;
      aPlayer.playerY = aPlayer.playerY;
    }
  }
  
  
}
