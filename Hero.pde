class Hero extends GameObject {

  float speed;
  int roomX, roomY;
  Weapon myWeapon;

  Hero () {
    super();
    speed = 5;
    roomX = 1;
    roomY = 1;
    myWeapon = new Weapon ();
  }
  void show () {
    fill (blue);
    stroke (black);
    strokeWeight (2);  
    circle (location.x, location.y, 37);
  }

  void act() {
    super.act();

    if (wkey) velocity.y =-speed;
    if (akey) velocity.x =-speed;
    if (skey) velocity.y =speed;
    if (dkey) velocity.x = speed;

    if (velocity.mag () >speed)
      velocity.setMag(speed);

    if (!wkey && !skey) velocity.y =velocity.y* 0.8;
    if (!akey && !dkey) velocity.x =velocity.x* 0.8;


    //check exits

    println(location, width*0.9);
    //north
    if (northRoom != #FFFFFF && location.y == height *0.1 && location.x >= width/2-50 && location.x <= width/2+50) {
      roomY--;
      location = new PVector(width/2, height *0.9-10);
    }
    if (southRoom != #FFFFFF && location.y == height *0.9 && location.x >= width/2-50 && location.x <= width/2+50) {
      roomY++;
      location = new PVector(width/2, height *0.1+10);
    }
    if (eastRoom != #FFFFFF && location.x == width *0.9 && location.y >= height/2-50 && location.y <= height/2+50) {
      println("??");
      roomX++;
      location = new PVector(width*0.1+10, height/2);
    }
    if (westRoom != #FFFFFF && location.x == width *0.1 && location.y >= height/2-50 && location.x <= height/2+50) {
      roomX--;
      location = new PVector(width*0.9-10, height/2);
    }
  }
}
