class Bullet extends GameObject  {

  int timer;
  int size;
  int c;
  PVector aim;

  Bullet(PVector _aim, int _colour, int _size) {
    timer=60;
    hp = 1;
    location = new PVector(myHero.location.x, myHero.location.y);
    //velocity = new PVector(myHero.direction.x, myHero.direction.y);
    velocity.setMag(10);
    velocity.add(myHero.velocity);
    size=10;
    velocity = aim;
    aim = _aim;
    
  }

  void show() {
    println ("moo");                   
    stroke(255);
    noFill();
    ellipse(location.x, location.y, size, size);
  }

  void act() {
   println ("instant");
    
    timer --;
    if (timer <=0) {
      hp=0;
    }
  }
}
