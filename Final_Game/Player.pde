class Player {

  int playerX;
  int playerY;
  int playerS;
  int speed;

  boolean isMovingUp;
  boolean isMovingDown;
  boolean isMovingLeft;
  boolean isMovingRight;

  int left;
  int right;
  int top;
  int bottom;

  int dir;


  Player() {
    playerX =  20;
    playerY =  405;
    playerS = 40;
    speed = 6;

    isMovingUp = false;
    isMovingDown = false;
    isMovingLeft = false;
    isMovingRight = false;

    left = playerX - playerS/2;
    right = playerX + playerS/2;
    top = playerY - playerS/2;
    bottom = playerY + playerS/2;

    dir = 0;
  }

  void render() {
    rectMode(CENTER);
    square(playerX, playerY, playerS);
   
  }









  //////////////////////////////////////////////////
  //player Movement Control////////////////////////

  void move() {
    if (isMovingUp == true) {
      playerY -= speed;
    }

    if (isMovingDown == true) {
      playerY += speed;
    }

    if (isMovingLeft == true) {
      playerX -= speed;
    }
    if (isMovingRight == true) {
      playerX += speed;
    }
    left = playerX - playerS/2;
    right = playerX + playerS/2;
    top = playerY - playerS/2;
    bottom = playerY + playerS/2;
    
    //println(playerX);
    //println(playerY);
  }

  void checkBorder() {

    if (playerY <= 220) {
      isMovingUp = false;
      playerY = 220;
    }

    if (playerY >= height) {
      isMovingDown = false;
      playerY =height - playerS/2;
    }

    if (playerX <=0) {
      isMovingLeft = false;
      playerX = playerS/2;
    }

    if (playerX >= width - 30) {
      isMovingRight = false;
      playerX = width- 30  - playerS/2;
    }
  }
}
