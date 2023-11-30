import processing.sound.*;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// Game inspired by omori. SFX are borrowed from the game and music is borrowed from artist AZALI on TikTok
//Everything else is made by ,yours truly : Niko


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

int state = 0;

///////////////////
Player player;
////////////////////
SoundFile papers;
SoundFile flowers;

SoundFile BGM;
SoundFile endingMusic;
//////////////////////
boolean shouldPlay = false;
////////////////////
PImage startScreen;
PImage background;
PImage stage1;
PImage stage2;
PImage ending;

//expressions
PImage exp1;
PImage exp2;
PImage exp3;
PImage exp4;
PImage exp5;
PImage exp6;

PImage sprite1;
PImage sprite2;
PImage sprite3;
//others
Object o2;// lamp
Object o6;
Object o7;
Object o8;
Object o9;
Object o10;

Object o11;
Object o12;
Object o13;

//kid
Object Kid;

//plants
Object o1;
Object o3;
Object o4;
Object o5;

Paper paper1;
Paper paper2;
Paper paper3;
Paper paper4;

/////////////
boolean Plant1 = false;
boolean Plant2 = false;
boolean Plant3 = false;
boolean Plant4 = false;

boolean Paper1 = true;
boolean Paper2 = true;
boolean Paper3 = true;
boolean Paper4 = true;

boolean text1 = true;
boolean text2 = false;
boolean text3 = false;
boolean text4 = false;
boolean text5 = false;


//////////////////////////////////////
//animation vars/////////////////////
////////////////////////////////////
Animation walkingAnim1;
PImage[] walkingImg1 =new PImage[4];

Animation walkingAnim2;
PImage[] walkingImg2 =new PImage[4];

Animation walkingAnim3;
PImage[] walkingImg3 =new PImage[4];

Animation walkingAnim4;
PImage[] walkingImg4 =new PImage[4];
///////////////////////////////////

void setup() {
  size(800, 700);
  imageMode(CENTER);
  background = loadImage("gameDraft.png");


  ///////////////////////////////////////////////////////////////////////
  for (int index  = 0; index < 4; index++) {
    walkingImg1[index] = loadImage("right" + index + ".png");
  }
  walkingAnim1 = new Animation(walkingImg1, 0.15, 1.3);

  for (int index  = 0; index < 4; index++) {
    walkingImg2[index] = loadImage("left" + index + ".png");
  }
  walkingAnim2 = new Animation(walkingImg2, 0.15, 1.3);

  for (int index  = 0; index < 4; index++) {
    walkingImg3[index] = loadImage("back" + index + ".png");
  }
  walkingAnim3 = new Animation(walkingImg3, 0.15, 1.3);

  for (int index  = 0; index < 4; index++) {
    walkingImg4[index] = loadImage("front" + index + ".png");
  }
  walkingAnim4 = new Animation(walkingImg4, 0.15, 1.3);
  ////////////////////////////////////////////////////////////////////////

  player = new Player();

  //plants
  o1 = new Object(90, 230, 100, 50);
  o3 = new Object(700, 220, 150, 40);
  o4 = new Object(70, 650, 100, 50);
  o5 = new Object(740, 650, 50, 40);

  //others
  o2 = new Object(520, 280, 60, 50);
  o6 = new Object(480, 180, 60, 50);
  o7 = new Object(330, 180, 60, 50);
  o8 = new Object(680, 370, 50, 50);
  o9 = new Object(800, 400, 50, 400);
  o10 = new Object(20, 405, 40, 40);

  o11 = new Object(190, 240, 40, 40);//plant 1
  o12 = new Object(190, 440, 40, 40);// plant 2
  o13 = new Object(430, 480, 50, 40);// plant 4

  ////////////////////////////////////////////////////////////////////////
  Kid = new Object(600, 230, 40, 50);
  ////////////////////////////////////////////////////////////////////////

  paper1 = new Paper (320, 290, 50, 50, 0);
  paper2 = new Paper (700, 500, 50, 50, 1);
  paper3 = new Paper (100, 400, 50, 50, 2);
  paper4 = new Paper (400, 600, 50, 50, 3);

  /////////////////////////////////////////////////////////////////////
  exp1 = loadImage("portrait 1.png");
  exp1.resize(190, 190);

  exp2 = loadImage("portrait 2.png");
  exp2.resize(190, 190);

  exp3 = loadImage("portrait 3.png");
  exp3.resize(190, 190);

  exp4 = loadImage("portrait 4.png");
  exp4.resize(190, 190);

  exp5 = loadImage("portrait 5.png");
  exp5.resize(190, 190);

  exp6 = loadImage("portrait 6.png");
  exp6.resize(190, 190);

  ////////////////////////////////////////////////////////////////////////

  sprite1 = loadImage("sprite1.png");
  sprite1.resize(50, 75);
  sprite2 = loadImage("sprite2.png");
  sprite2.resize(50, 75);
  sprite3 = loadImage("sprite3.png");
  sprite3.resize(50, 75);

  ////////////////////////////////////////////////////////////////////////
 startScreen = loadImage("startScreen.png");
 stage1 = loadImage("stage1.png");
 stage2 = loadImage("stage2.png");
 ending = loadImage("ending.png");
  ////////////////////////////////////////////////////////////////////////
  papers = new SoundFile(this, "PageSFX.mp3");
  flowers = new SoundFile(this, "PlantSFX.mp3");

  BGM = new SoundFile(this, "BGMusic.mp3");
  endingMusic = new SoundFile(this, "EndingMusic01.mp3");
}



void draw() {
  rectMode(CENTER);
  background(50);
  Cases();

  if (BGM.isPlaying() == false && state < 65) {
    BGM.play();
  } else

  if (endingMusic.isPlaying() == false && state == 65) {
    endingMusic.play();
    endingMusic.amp(0.8);
    BGM.amp(0.0);
  }
}

////////////////////////////////////////////////////
//Player Movement functions///////////////////////
void keyPressed() {

  //////////////////////////////////////////////////
  //statements for the keys in game functions///////
  /////////////////////////////////////////////////
  if (state == 0 && key == ' ') {
    state = 62;
  }

  if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, o1.x, o1.y ) < 60 && Plant1 == false) {
    state = 2;
    shouldPlay = true;
  } else if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, o3.x, o3.y ) < 60 && Plant2 == false) {
    state = 18;
    shouldPlay = true;
  } else if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, o4.x, o4.y ) < 60 && Plant3 == false) {
    state = 21;
    shouldPlay = true;
  } else if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, o5.x, o5.y ) < 60 && Plant4 == false) {
    state = 24;
    shouldPlay = true;
  } else if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, 320, 290 ) < 50 && Paper1 == true ) {
    state = 4;
    shouldPlay = true;
  } else if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, 700, 500 ) < 50 && Paper2 == true ) {
    state = 9;
    shouldPlay = true;
  } else if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, 100, 400 ) < 50 && Paper3 == true ) {
    state = 12;
    shouldPlay = true;
  } else if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, 400, 600 ) < 50 && Paper4 == true ) {
    state = 15;
    shouldPlay = true;
  } else if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, o2.x, o2.y ) < 60) {
    state = 8;
  } else if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, o6.x, o6.y ) < 70) {
    state = 27;
  } else if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, o7.x, o7.y ) < 70) {
    state = 28;
  } else if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, o8.x, o8.y ) < 60) {
    state = 30;
  } else if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, o9.x, o9.y ) < 60) {
    state = 31;
  } else if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, o10.x, o10.y ) < 50) {
    state = 33;
  } else if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, o11.x, o11.y ) < 50) {
    state = 34;
  } else if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, o12.x, o12.y ) < 50) {
    state = 35;
  } else if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, o13.x, o13.y ) < 50) {
    state = 36;
  } else if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, Kid.x, Kid.y ) < 50 && text1 == true) {
    state = 37;
    text1 = false;
  } else if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, Kid.x, Kid.y ) < 50 && text2 == true) {
    state = 44;
    text2 = false;
  } else if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, Kid.x, Kid.y ) < 50 && text3 == true) {
    state = 46;
    text3 = false;
  } else if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, Kid.x, Kid.y ) < 50 && text4 == true) {
    state = 48;
    text4 = false;
  } else if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, Kid.x, Kid.y ) < 50 && text5 == true) {
    state = 51;
    text5 = false;
  } else if (state == 2 && key == 'z') {
    state = 3;
    Plant1 = true;
  } else if (state == 18 && key == 'z') {
    state = 19;
    Plant2 = true;
  } else if (state == 21 && key == 'z') {
    state =22;
    Plant3 = true;
  } else if (state == 24 && key == 'z') {
    state = 25;
    Plant4 = true;
  } else if (state == 3 && key == 'z') {
    state = 1;
  } else if (state == 4 && key == 'z') {
    state = 5;
    Paper1 = false;
  } else if (state == 9 && key == 'z') {
    state = 10;
    Paper2 = false;
  } else if (state == 12 && key == 'z') {
    state = 13;
    Paper3 = false;
  } else if (state == 15 && key == 'z') {
    state = 16;
    Paper4 = false;
  } else if (state == 5 && key == 'z') {
    state = 1;
  } else if (state == 10 && key == 'z') {
    state = 1;
  } else if (state == 6 && key == 'z') {
    state = 1;
  } else if (state == 7 && key == 'z') {
    state = 1;
  } else if (state == 8 && key == 'z') {
    state = 1;
  } else if (state == 11 && key == 'z') {
    state = 1;
  } else if (state == 13 && key == 'z') {
    state = 1;
  } else if (state == 14 && key == 'z') {
    state = 1;
  } else if (state == 16 && key == 'z') {
    state = 1;
  } else if (state == 17 && key == 'z') {
    state = 1;
  } else if (state == 19 && key == 'z') {
    state = 1;
  } else if (state == 22 && key == 'z') {
    state = 1;
  } else if (state == 25 && key == 'z') {
    state = 1;
  } else if (state == 20 && key == 'z') {
    state = 1;
  } else if (state == 23 && key == 'z') {
    state = 1;
  } else if (state == 26 && key == 'z') {
    state = 1;
  } else if (state == 27 && key == 'z') {
    state = 29;
  } else if (state == 28 && key == 'z') {
    state = 1;
  } else if (state == 29 && key == 'z') {
    state = 1;
    text5 = true;
  } else if (state == 30 && key == 'z') {
    state = 1;
  } else if (state == 31 && key == 'z') {
    state = 32;
  } else if (state == 32 && key == 'z') {
    state = 1;
  } else if (state == 33 && key == 'z') {
    state = 0;
  } else if (state == 34 && key == 'z') {
    state = 1;
  } else if (state == 35 && key == 'z') {
    state = 1;
  } else if (state == 36 && key == 'z') {
    state = 1;
  } else if (state == 37 && key == 'z') {
    state = 38;
  } else if (state == 38 && key == 'z') {
    state = 39;
  } else if (state == 39 && key == 'z') {
    state = 40;
  } else if (state == 40 && key == 'z') {
    state = 41;
  } else if (state == 41 && key == 'z') {
    state = 42;
  } else if (state == 42 && key == 'z') {
    state = 43;
  } else if (state == 43 && key == 'z') {
    state = 1;
    text2 = true;
  } else if (state == 44 && key == 'z') {
    state = 45;
  } else if (state == 45 && key == 'z') {
    state = 1;
    text3 = true;
  } else if (state == 46 && key == 'z') {
    state = 47;
  } else if (state == 47 && key == 'z') {
    state = 1;
    text4 = true;
  } else if (state == 48 && key == 'z') {
    state = 49;
  } else if (state == 49 && key == 'z') {
    state = 50;
  } else if (state == 50 && key == 'z') {
    state = 1;
  } else if (state == 51 && key == 'z') {
    state = 52;
  } else if (state == 52 && key == 'z') {
    state = 53;
  } else if (state == 53 && key == 'z') {
    state = 54;
  } else if (state == 54 && key == 'z') {
    state = 1;
  } else if (state == 1 && key == 'z' && dist(player.playerX, player.playerY, Kid.x, Kid.y ) < 50 && Plant1 == true
    && Plant2 == true && Plant3 == true && Plant4 == true && Paper1 == false && Paper2 == false && Paper3 == false && Paper4 == false) {
    state = 55;
  } else if (state == 55 && key == 'z') {
    state = 56;
  } else if (state == 56 && key == 'z') {
    state = 57;
  } else if (state == 57 && key == 'z') {
    state = 58;
  } else if (state == 58 && key == 'z') {
    state = 59;
  } else if (state == 59 && key == 'z') {
    state = 60;
  } else if (state == 60 && key == 'z') {
    state = 61;
  } else if (state == 61 && key == 'z') {
    state = 65;
    Plant1 = false;
    Plant2 = false;
    Plant3 = false;
    Plant4 = false;

    Paper1 = true;
    Paper2 = true;
    Paper3 = true;
    Paper4 = true;

    text1 = true;
    text2 = false;
    text3 = false;
    text4 = false;
    text5 = false;
    
    player.playerX = 20;
    player.playerY = 405;
  } else if (state == 65 && key == 'z') {
    state = 0;
  }else if (state == 62 && key == 'z') {
    state = 63;
  }else if (state == 63 && key == 'z') {
    state = 64;
  }else if (state == 64 && key == 'z') {
    state = 1;
  }




  if (state == 2 && key == 'x') {
    state = 7;
  } else if (state == 4 && key == 'x') {
    state = 6;
  } else if (state == 9 && key == 'x') {
    state = 11;
  } else if (state == 12 && key == 'x') {
    state = 14;
  } else if (state == 15 && key == 'x') {
    state = 17;
  } else if (state == 18 && key == 'x') {
    state = 20;
  } else if (state == 21 && key == 'x') {
    state = 23;
  } else if (state == 24 && key == 'x') {
    state = 26;
  } else if (state == 33 && key == 'x') {
    state = 1;
  }
  ////////////////////////////////////////////////////////
  //Player movement keys/////////////////////////////////
  //////////////////////////////////////////////////////

  if (key == 'w' && player.playerY >250 -  player.playerS/2 ) {
    player.isMovingUp = true;
    walkingAnim3.isAnimating = true;
    player.dir = 2;
  }

  if (key == 'd' && player.playerX < width - 30  - player.playerS/2) {
    player.isMovingRight = true;
    walkingAnim1.isAnimating = true;
    player.dir = 0;
  }

  if (key== 's' && player.playerY < height - player.playerS/2) {
    player.isMovingDown = true;
    walkingAnim4.isAnimating = true;
    player.dir = 3;
  }

  if (key== 'a' && player.playerX > player.playerS/2 ) {
    player.isMovingLeft = true;
    walkingAnim2.isAnimating = true;
    player.dir = 1;
  }
}


////////////////////////////////////////////////////////

void keyReleased() {
  if (key == 'w') {
    player.isMovingUp = false;
    walkingAnim3.isAnimating = false;
  }

  if (key == 'd') {
    player.isMovingRight = false;
    walkingAnim1.isAnimating = false;
  }

  if (key== 's') {
    player.isMovingDown = false;
    walkingAnim4.isAnimating = false;
  }

  if (key== 'a') {
    player.isMovingLeft = false;
    walkingAnim2.isAnimating = false;
  }
}

//////////////////////////////////////////////

void MoveSet() {
  if (player.isMovingLeft == true) {
    walkingAnim2.display(player.playerX, player.playerY);
  } else if (player.isMovingRight == true) {
    walkingAnim1.display(player.playerX, player.playerY);
  } else if (player.isMovingUp == true) {
    walkingAnim3.display(player.playerX, player.playerY);
  } else if (player.isMovingDown == true) {
    walkingAnim4.display(player.playerX, player.playerY);
  } else {
    if (player.dir == 0) {
      walkingAnim1.display(player.playerX, player.playerY);
    } else if (player.dir == 1) {
      walkingAnim2.display(player.playerX, player.playerY);
    } else if (player.dir == 2) {
      walkingAnim3.display(player.playerX, player.playerY);
    } else if (player.dir == 3) {
      walkingAnim4.display(player.playerX, player.playerY);
    }
  }
}

/////////////////////////////////////////////////



void paperRender() {
  if (Paper1 == true) {
    paper1.PaperSprite();
  }

  if (Paper2 == true) {
    paper2.PaperSprite();
  }
  if (Paper3 == true) {
    paper3.PaperSprite();
  }

  if (Paper4 == true) {
    paper4.PaperSprite();
  }
}

void flowers() {
  //o1. render();
  o1.Collision(player);

  //o3. render();
  o3.Collision(player);

  //o4. render();
  o4.Collision(player);

  //o5. render();
  o5.Collision(player);
}

void others() {
  //o2. render();
  o2.Collision(player);

  //o6. render();

  //o7. render();

  //o8. render();

  //o9. render();

  //o10. render();

  //o11. render();
  o11.Collision(player);

  //o12. render();
  o12.Collision(player);

  //o13. render();
  o13.Collision(player);
}

void kid(int facing) {
  Kid.Collision(player);

  if (facing == 0) {
    image(sprite1, Kid.x, Kid.y);
  }
  if (facing == 1) {
    image(sprite2, Kid.x, Kid.y);
  }
  if (facing == 2) {
    image(sprite3, Kid.x, Kid.y);
  }
}


void textBox(String text) {
  int x = width/2;
  int y = height - height/5;
  fill(20);
  stroke(255);
  strokeWeight(6);
  rect(x, y, 790, 200);

  fill(255);
  PFont font;
  font = createFont("OMORI_GAME2.ttf", 50);
  textFont(font);
  textSize(50);
  text(text, x - width/2 + 50, y - 50);
}



void expressions(int currentFace) {
  int x = width- width/6;
  int y = 350;

  fill(20);
  stroke(255);
  strokeWeight(6);
  square(x, y, 200);

  if (currentFace == 0) {
    image(exp1, x, y);
  }
  if (currentFace == 1) {
    image(exp2, x, y);
  }
  if (currentFace == 2) {
    image(exp3, x, y);
  }
  if (currentFace == 3) {
    image(exp4, x, y);
  }
  if (currentFace == 4) {
    image(exp5, x, y);
  }
  if (currentFace == 5) {
    image(exp6, x, y);
  }
}

void SFX(int sounds) {

  if (sounds == 0 && flowers.isPlaying() == false && shouldPlay == true) {
    flowers.play();
    shouldPlay = false;
  }
  if (sounds == 1 && papers.isPlaying() == false && shouldPlay == true) {
    papers.play();
    shouldPlay = false;
  }
}

void Cases() {
  //////////////////////////////
  //switch statements//////////
  /////////////////////////////
  switch(state) {

    ///////////////////////////////////////////////////////////////
  case 0:
    image(startScreen,width/2,height/2);
    
    break;


    //main scene//////////////////////////////////////////////////
  case 1:
    image(background, width/2, height/2);
    paperRender();
    kid(1);
    MoveSet();
    //player.render();
    player.move();
    player.checkBorder();

    flowers();
    others();



    break;


    //water the plants?////////////////////////////////////////////////////
  case 2:
    image(background, width/2, height/2);
    //player.render();
    kid(1);
    MoveSet();
    paperRender();

    textBox("want to water the flowers?");

    break;



    //watered the plants////////////////////////////////////////////////
  case 3:
    image(background, width/2, height/2);
    //player.render();
    kid(1);
    MoveSet();
    SFX(0);
    paperRender();

    if (Plant1 == true) {
      textBox("you watered the flowers!");
    }
    break;

    //pick up the paper?//////////////////////////////////////////////
  case 4:
    image(background, width/2, height/2);
    kid(1);
    paperRender();

    //player.render();
    MoveSet();
    textBox("want to organize the papers?");
    break;



    //picked up the paper/////////////////////////////////////////////
  case 5:
    image(background, width/2, height/2);
    kid(1);
    paperRender();
    SFX(1);

    MoveSet();
    if (Paper1 == false) {
      textBox("you organized!");
    }
    break;

    //didnt pick up the paper/////////////////////////////////////////////
  case 6:
    image(background, width/2, height/2);
    kid(1);
    paperRender();

    //player.render();
    MoveSet();
    textBox("you left the papers alone");
    break;



    //didnt water the plants/////////////////////////////////////////////
  case 7:
    image(background, width/2, height/2);
    kid(1);
    paperRender();

    //player.render();
    MoveSet();
    textBox("you didn't water the flowers");
    break;



    //lamp/////////////////////////////////////////////
  case 8:
    image(background, width/2, height/2);
    kid(1);
    paperRender();

    //player.render();
    MoveSet();
    textBox("Its a lamp!\n you love the way it brightens\n your day!");
    break;


    //////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////
    //organize the papers 2///////////////////////////////////////////////


  case 9:
    image(background, width/2, height/2);
    kid(1);
    paperRender();

    //player.render();
    MoveSet();
    textBox("want to organize the papers?");
    break;

    //organized the papers2////////////////////////////////////////////
  case 10:
    image(background, width/2, height/2);
    kid(1);
    MoveSet();
    paperRender();
    SFX(1);
    if (Paper2 == false) {
      textBox("you organized!");
    }
    break;

    //didnt pick up the paper2/////////////////////////////////////////////
  case 11:
    image(background, width/2, height/2);
    kid(1);
    paperRender();

    //player.render();
    MoveSet();
    textBox("you left the papers alone");
    break;

    //organize the papers 3///////////////////////////////////////////////
  case 12:
    image(background, width/2, height/2);
    kid(1);
    paperRender();

    //player.render();
    MoveSet();
    textBox("want to organize the papers?");
    break;

    //organized the papers3////////////////////////////////////////////
  case 13:
    image(background, width/2, height/2);
    kid(1);
    MoveSet();
    paperRender();
    SFX(1);
    if (Paper3 == false) {
      textBox("you organized!");
    }
    break;

    //didnt pick up the paper3/////////////////////////////////////////////
  case 14:
    image(background, width/2, height/2);
    kid(1);
    paperRender();

    //player.render();
    MoveSet();
    textBox("you left the papers alone");
    break;
    //organize the papers 4///////////////////////////////////////////////
  case 15:
    image(background, width/2, height/2);
    kid(1);
    paperRender();

    //player.render();
    MoveSet();
    textBox("want to organize the papers?");
    break;

    //organized the papers4////////////////////////////////////////////
  case 16:
    image(background, width/2, height/2);
    //player.render();
    kid(1);
    MoveSet();
    paperRender();
    SFX(1);
    if (Paper4 == false) {
      textBox("you organized!");
    }
    break;

    //didnt pick up the paper4/////////////////////////////////////////////
  case 17:
    image(background, width/2, height/2);
    kid(1);
    paperRender();

    //player.render();
    MoveSet();
    textBox("you left the papers alone");
    break;

    /////////////////////////////////////////////////////////////////////////
    //Plants
    ////////////////////////////////////////////////////////////////////////


    //water the plants?////////////////////////////////////////////////////
  case 18:
    image(background, width/2, height/2);
    //player.render();
    kid(1);
    MoveSet();
    paperRender();

    textBox("want to water the flowers?");

    break;

    //watered the plants////////////////////////////////////////////////
  case 19:
    image(background, width/2, height/2);
    //player.render();
    kid(1);
    MoveSet();
    SFX(0);
    paperRender();

    if (Plant2 == true) {
      textBox("you watered the flowers!");
    }
    break;

    //didnt water the plants/////////////////////////////////////////////
  case 20:
    image(background, width/2, height/2);
    kid(1);
    paperRender();

    //player.render();
    MoveSet();
    textBox("you didn't water the flowers");
    break;

    ////////////////////////////////////////////////////////////////////////
    //water the plants?////////////////////////////////////////////////////
  case 21:
    image(background, width/2, height/2);
    //player.render();
    kid(1);
    MoveSet();
    paperRender();

    textBox("want to water the flowers?");

    break;



    //watered the plants////////////////////////////////////////////////
  case 22:
    image(background, width/2, height/2);
    //player.render();
    kid(1);
    MoveSet();
    SFX(0);
    paperRender();

    if (Plant3 == true) {
      textBox("you watered the flowers!");
    }
    break;

    //didnt water the plants/////////////////////////////////////////////
  case 23:
    image(background, width/2, height/2);
    kid(1);
    paperRender();

    //player.render();
    MoveSet();
    textBox("you didn't water the flowers");
    break;

    ////////////////////////////////////////////////////////////////////////
    //water the plants?////////////////////////////////////////////////////
  case 24:
    image(background, width/2, height/2);
    //player.render();
    kid(1);
    MoveSet();
    paperRender();

    textBox("want to water the flowers?");

    break;



    //watered the plants////////////////////////////////////////////////
  case 25:
    image(background, width/2, height/2);
    //player.render();
    kid(1);
    MoveSet();
    SFX(0);
    paperRender();

    if (Plant4 == true) {
      textBox("you watered the flowers!");
    }
    break;

    //didnt water the plants/////////////////////////////////////////////
  case 26:
    image(background, width/2, height/2);
    kid(1);
    paperRender();

    //player.render();
    MoveSet();
    textBox("you didn't water the flowers");
    break;

    ///////////////////////////////////////////////////////////////////
    //////objects
    //////////////////////////////////////////////////////////////////
  case 27:
    image(background, width/2, height/2);

    paperRender();
    kid(1);    //player.render();
    MoveSet();
    textBox("There are drawings on the wall\none of them is of your friends...");
    break;

  case 28:
    image(background, width/2, height/2);
    kid(1);
    paperRender();

    //player.render();
    MoveSet();
    textBox("Folders and books full of pages \nyou recal seing some of them before");
    break;

  case 29:
    image(background, width/2, height/2);
    kid(1);
    paperRender();

    //player.render();
    MoveSet();
    textBox("you dont remember their names.");
    break;

  case 30:
    image(background, width/2, height/2);
    kid(1);
    paperRender();

    //player.render();
    MoveSet();
    textBox("There are drwaings and scrips on the \nground \nyou decide not to pick them up");
    break;

  case 31:
    image(background, width/2, height/2);
    kid(1);
    paperRender();

    //player.render();
    MoveSet();
    textBox("you look over the edge\nthe sky is dark outside and the wind is\n howling");
    break;

  case 32:
    image(background, width/2, height/2);
    kid(1);
    paperRender();

    //player.render();
    MoveSet();
    textBox("The bookshelf is quiet\nyou should go back and help\n your friend");
    break;

  case 33:
    image(background, width/2, height/2);
    kid(1);
    paperRender();

    //player.render();
    MoveSet();
    textBox("Leave?");
    break;

  case 34:
    image(background, width/2, height/2);
    kid(1);
    paperRender();

    //player.render();
    MoveSet();
    textBox("Its a young Orchid\nThe flowers have yet to bloom.");
    break;

  case 35:
    image(background, width/2, height/2);
    kid(1);
    paperRender();

    //player.render();
    MoveSet();
    textBox("You dont know the name of this flower\nmaybe a yet-to-bloom Yarrow?\n youre not sure");
    break;

  case 36:
    image(background, width/2, height/2);
    kid(1);
    paperRender();

    //player.render();
    MoveSet();
    textBox("its a fern\nthe leaves look a little dry...");
    break;

    ///////////////////////////////////////////////////////////////////////////////////////////////////////
    /////Text Boxes
    ///////////////////////////////////////////////////////////////////////////////////////////////////////
  case 37:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(3);
    //player.render();

    textBox("Oh!\nIt's you friend!");
    break;

  case 38:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(0);
    //player.render();

    textBox("is so good to see you\nWhat brings you here?");
    break;

  case 39:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(4);
    //player.render();
    textBox("I didn'd expect to see you today\nso I haven't really cleaned up or watered\nthe flowers");
    break;

  case 40:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(5);
    //player.render();
    textBox("I guess I've been a little distracted hehe");
    break;

  case 41:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(0);
    //player.render();
    textBox("Say, how about you help me clean up\n and water some of my plants");
    break;

  case 42:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(1);
    //player.render();
    textBox("after,we can play like usual!");
    break;

  case 43:
    image(background, width/2, height/2);
    kid(1);
    paperRender();
    MoveSet();
    //player.render();
    textBox("Help your friend clean up\nCollect the papers and water the flowers!");
    break;

    //////////////////////////////////////////////////////////////////////////////////////

  case 44:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(4);
    textBox("Sorry to have you clean when you're\njust here to play");
    break;

  case 45:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(5);
    textBox("But these begonias have been a little sad as\n of lately, so i have to\nhelp them a little bit");
    break;

    ///////////////////////////////////////////////////////////////////////////////////

  case 46:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(1);
    textBox("Do you like my flowers?\n I've gotten more since the last time\n you visited");
    break;

  case 47:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(2);
    textBox("I have some new Hemlocks and some\nferns, throught they are looking \na little dry");
    break;


    /////////////////////////////////////////////////////////////////////////////

  case 48:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(5);
    textBox("Its been a little lonely without you\naround");
    break;

  case 49:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(0);
    textBox("But I've been making more drawings for you!\nand I also started writing, just like you!");
    break;

  case 50:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(4);
    textBox("Though im not really that good\nand i dont know how you do it to keep the \norder... I think I might need\nsome more practice hehe");
    break;

    ///////////////////////////////////////////////////////////////////////

  case 51:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(1);
    textBox("I see you've been looking at \nmy drawings");
    break;

  case 52:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(2);
    textBox("Do you like them?\nI made one of our friends too!");
    break;

  case 53:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(5);
    textBox("Huh? whats with that face?");
    break;

  case 54:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(4);
    textBox("You've been taking care of them right?\nYou promised!");
    break;

    /////////////////////////////////////////////////////////////////////////////
    //ending
    ////////////////////////////////////////////////////////////////////////////
  case 55:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(3);
    textBox("Oh! Youre already done?");
    break;

  case 56:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(0);
    textBox("That was fast!\nThank you so much friend!");
    break;

  case 57:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(0);
    textBox("Now we can play!");
    break;

  case 58:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(1);
    textBox("...?");
    break;

  case 59:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(3);
    textBox("wait! is that what i think it is?");
    break;

  case 60:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(0);
    textBox("It is!\nYou brought me a new page!");
    break;

  case 61:
    image(background, width/2, height/2);
    kid(2);
    paperRender();
    MoveSet();
    expressions(1);
    textBox("Come on, lets put it with the others!");
    break;

  case 62:
    image(stage1,width/2,height/2);
    
    textBox("Youre here again");
    break;
    
     case 63:
    image(stage2,width/2,height/2);
    
    textBox("You never know what brings you here...");
    break;
    
     case 64:
    image(stage2,width/2,height/2);
    
    textBox("You should talk with her");
    break;
    
    case 65:
    image(ending,width/2, height/2);
    textBox("Thanks for playing!!");

    break;
  }
}
