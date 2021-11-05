//Tricia Sun
//Oct 20 2021
//1-3

boolean mouseReleased;
boolean wasPressed;
boolean wkey, skey, akey, dkey;
boolean upkey, downkey, rightkey, leftkey, spacekey;

Button blueButton, darkButton, redButton, blackButton, brownButton;
color bkg;

//color pallete
color blue   = #4D30D6;
color dark  = #0E5175;
color red   = #F76DDC;
color brown = #752C1D;
color black  = #000000;


//mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;


//GIF
AnimatedGIF myGIF;
AnimatedGIF yourGIF;
AnimatedGIF ourGIF;
ArrayList<GameObject> myObjects;
Hero myHero;
ArrayList<DarknessCell> darkness;


//Images
PImage map;
color northRoom, eastRoom, southRoom, westRoom;




void setup () {
  size (800, 600);
  //Create objects
  myObjects = new ArrayList <GameObject>(100);
  myHero = new Hero();
  myObjects.add(myHero);
 
  //create darkness
  darkness = new ArrayList <DarknessCell> (1000);
  float size = 5;
  int x=0;
  int y=0;
  while (y <height) {
  darkness.add (new DarknessCell(x, y,size));
  x += size;
  if (x>= width) {
    x=0;
    y +=size;
  }
  }

  myGIF = new AnimatedGIF(56, "frame_", "_delay-0.06s.png", 100, 100, 200, 200);
  yourGIF = new AnimatedGIF(56, "frame_", "_delay-0.06s.png", 500, 500, 300, 300);
  ourGIF = new AnimatedGIF(56, "frame_", "_delay-0.06s.png");

  bkg = black;

  brownButton  = new Button("ENTER THE ROOM OF DOOM", 400, 400, 200, 100, red, blue);
  mode = INTRO;
 
  map = loadImage ("map.png");
}

void draw () {
  if (mode == INTRO) {
    intro ();
  } else if (mode == GAME) {
    game ();
  } else if (mode == PAUSE) {
    pause ();
  } else if (mode == GAMEOVER) {
    gameover ();
  } else {
    println ("Mode error: " + mode);
  }



  //mousePressed;
  //!mousePressed;
  click();


 
}


void click() {
  //if (mode == INTRO) {
  //  intro ();
  //} else if (mode == GAME) {
  //  game ();
  //} else if (mode == PAUSE) {
  //  pause ();
  //} else if (mode == GAMEOVER) {
  //  gameover ();
  //} else {
  //  println ("Mode error: " + mode);
  //}



  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
}
