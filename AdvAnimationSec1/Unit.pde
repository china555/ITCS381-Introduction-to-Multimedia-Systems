import java.util.Map;

class Unit
{
  HashMap<String, AnimatedSprite> animations;
  String name;
  PVector location; 
  PVector velocity;
  int fps;
  float moveSpeed;
  float maxSpeed;
  boolean isFlipX;
  public boolean isMoving = false;

  public Unit( String name, float x, float y )
  {
    this.name = name;
    location = new PVector( x, y );
    velocity = new PVector( 0, 0 );
    moveSpeed = 1.0;
    maxSpeed = 5.0;
    isFlipX = false;
    animations = new HashMap< String, AnimatedSprite >();
  }

  void registerAnimation( String keyword, AnimatedSprite animationClip )
  {
    animations.put( keyword, animationClip );
  }

  void registerIdleAnimation( AnimatedSprite animationClip )
  {
    animationClip.playLoop();
    registerAnimation( "Idle", animationClip );
  }

  void registerWalkAnimation( AnimatedSprite animationClip )
  {
    animationClip.playLoop();
    registerAnimation( "Walk", animationClip );
  }

  void setFPS( int fps )
  {
    this.fps = fps; 
    // Using an enhanced loop to iterate over each entry
    for (Map.Entry me : animations.entrySet()) {
      AnimatedSprite animator = (AnimatedSprite) me.getValue();
      if ( animator != null )
      {
        animator.setFPS( fps );
      }
    }
  }

  void setFlipX( boolean value )
  {
    isFlipX = value;
    for (Map.Entry me : animations.entrySet()) {
      AnimatedSprite animator = (AnimatedSprite) me.getValue();
      if ( animator != null )
      {
        animator.setFlipX( isFlipX );
      }
    }
  }

  void setMoveSpeed( float speed )
  {
    moveSpeed = speed;
  }

  void setMaxSpeed( float speed )
  {
    maxSpeed = speed;
  }

  void setPosition( float x, float y )
  {
    location.x = x;
    location.y = y;
  }

  void setPosition( PVector newLocation)
  {
    location.x = newLocation.x;
    location.y = newLocation.y;
  }

  void render()
  {
    if ( !isMoving )
    {
      AnimatedSprite animator = animations.get( "Idle" );
      if ( animator != null )
      {
        animator.setPosition( location.x, location.y );
        animator.update();
        animator.render();
      }
    } else {
      AnimatedSprite animator = animations.get( "Walk" );
      if ( animator != null )
      {
        animator.setPosition( location.x, location.y );
        animator.update();
        animator.render();
      }
    }
  }

  void update()  
  {
    velocity.limit( maxSpeed );
    if (velocity.mag() >= 0.1)      
    {
      isMoving = true;
      if (velocity.x < 0)
      {
        if ( !isFlipX )
        {
          setFlipX( true );
        }
      } else {
        if ( isFlipX )
        {
          setFlipX ( false );
        }
      }
    } else {
      isMoving = false;
    }

    //Physics Motion 101: Locations changes by velocity.
    location.add( velocity );
  }

  void checkEdge()
  {
    if ( location.x > width ) {
      location.x = width;
    } else if ( location.x < 0 ) {
      location.x = 0;
    }

    if (location.y > height) {
      location.y = height;
    } else if (location.y < 0) {
      location.y = 0;
    }
  }
  
  void moveToward( float x2, float y2, float minimumDistance)
  {
    if (dist(location.x, location.y, x2, y2) <= minimumDistance )
    { // !cheat when we are close-up, we should deaccelerate
      velocity.x = 0;
      velocity.y = 0;
      return;
    }

    float dx = x2 - location.x;
    float dy = y2 - location.y;
    // float angle = atan2(dy, dx);  
    PVector direction = new PVector( dx, dy );
    direction.normalize();
    direction.mult( moveSpeed * 0.5 );
    velocity.add( direction ); // cheat by ignore acceleration
  }
}
