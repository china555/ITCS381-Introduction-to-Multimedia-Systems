int fps = 15;
Unit alienUnit;
boolean isFollowingMouse = false;
boolean isAnimated = true;

void setup() {
  size( 512, 512 );
  background( 255, 204, 0 );
  frameRate( 24 );
  
  // Unit
  float unitPosX = width/2;
  float unitPosY = height/2;
  alienUnit = new Unit("Alien-kun", unitPosX, unitPosY);

  AnimatedSprite IdleAlienAnimation = new AnimatedSprite(unitPosX, unitPosY, fps);
  IdleAlienAnimation.loadImagesFromPath("alienIdle/");
  
  AnimatedSprite WalkAlienAnimation = new AnimatedSprite(unitPosX, unitPosY, fps);
  WalkAlienAnimation.loadImagesFromPath("alienWalk/");
  
  alienUnit.registerIdleAnimation( IdleAlienAnimation );
  alienUnit.registerWalkAnimation( WalkAlienAnimation );
}


void draw() {
  // draw code here
  background(255);
  fill(0);
  text(fps + "\n(Press +/- to change)\n" + 
    "\nPress 'p' to loop/stop." + 
    "\nPress 'f' to Follow Mouse", 20, 20);
    
  if ( isFollowingMouse )
  {// add the velocity/acceleration built-up
    alienUnit.moveToward( mouseX, mouseY, 10);
  }
  // update will apply the built-up force to 
  // the location of the unit  
  alienUnit.update();
  alienUnit.checkEdge();
  alienUnit.render();
}


void keyPressed() {
  if (key == '=') { // Trap 
    alienUnit.isMoving = true;
  } 
  if (key == '-') {
    fps--;
    if (fps < 0) fps = 0;
    alienUnit.setFPS( fps );
  }
  if ( key == '+'){
    fps++;
    alienUnit.setFPS( fps );
  }
  if (key == 'f') {
    // try to follow mouse
    isFollowingMouse = !isFollowingMouse;
  }
   if (key == 'p') {
    // try to follow mouse
    isAnimated = !isAnimated;
    if(isAnimated){
      alienUnit.animations.get("Walk").stopPlay();
      alienUnit.animations.get("Idle").stopPlay();
    }else{
      alienUnit.animations.get("Walk").playLoop();
      alienUnit.animations.get("Idle").playLoop();
    }
   }
}
