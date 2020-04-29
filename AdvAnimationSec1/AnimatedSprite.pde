class AnimatedSprite
{
  float x, y;

  float index; // Must be int during indexing

  float speed;

  int fps; // framerate of sprite player

  ArrayList< PImage > images;

  boolean playing = false;

  boolean playOnce = true;

  boolean isFlipX = false;

  public AnimatedSprite( 
    float x, 
    float y, 
    int fps
    )
  {
    this.x = x;
    this.y = y;
    this.fps = fps;
    // Starting at the beginning
    index = 0.0;
  }

  public AnimatedSprite( 
    PImage[] inputImages, 
    float x, 
    float y, 
    int fps
    )
  {
    this.x = x;
    this.y = y;
    this.fps = fps;
    // Starting at the beginning
    index = 0.0;
    if ( inputImages != null && inputImages.length > 0)
    {
      images = new ArrayList<PImage>();
      for ( int i = 0; i < inputImages.length; i++ )
      {
        images.add( inputImages[i] );
      }
    }
  }


  boolean isPlaying()
  {
    return playing;
  }

  void setFPS( int fps )
  {
    this.fps = fps;
  }

  void setSpeed( int fps )
  {
    speed = fps / (float) frameRate;
  }

  void setPosition( float x, float y )
  {
    this.x = x;
    this.y = y;
  }

  int imageCount()
  {
    if ( !IsImagesEmptyOrNull() )
    {
      return images.size();
    } else {
      return 0;
    }
  }

  void setFlipX( boolean value ) 
  {
    isFlipX = value;
  }

  boolean IsImagesEmptyOrNull()
  {
    return  images == null || images.size() <= 0 ;
  }

  void playOnce() 
  {
    index = 0;
    playOnce = true;
    playing = true;
  }
  void playLoop() 
  {
    playing = true;
    playOnce = false;
  }
  void stopPlay()
  {
    playing = false;
    playOnce = false;
  }

  void loadImagesFromPath( String path )
  {
    java.io.File folder = new java.io.File( dataPath( path ) );
    String[] filenames = folder.list();
    images = new ArrayList<PImage>( filenames.length );
    for (int i = 0; i < filenames.length; i++) 
    {
      images.add( loadImage( dataPath(path + "/" + filenames[i] ) ) );
    }
  }

  void loadImagesFromImagePrefix( String imagePrefix, int count, String extension  )
  {
    images = new ArrayList<PImage>( count );
    for (int i = 0; i < count; i++) {
      String filename = imagePrefix + i + extension;
      images.add( loadImage( filename ) );
    }
  }

  void loadImageToNext( String imageName, String extension  )
  {
    if ( images == null )
    {
      images = new ArrayList<PImage>();
    }
    String filename = imageName + extension;
    images.add( loadImage( filename ) );
  }

  void render() 
  {
    if ( IsImagesEmptyOrNull() )
    {// Does not have an image – we just return 
      return;
    }
    // We must convert the float index to an int first!
    int imageIndex = int( index );
    imageMode( CENTER ); // Game engine, web GL
    if ( isFlipX )
    {// vertices (x, y,z) * M = result?
      pushMatrix();
      translate( x, y ); // M to move with +x, +y
      scale( -1, 1 ); // M change the size by %
      image( images.get( imageIndex ), 0, 0 );
      popMatrix();
    } else {
      image( images.get( imageIndex ), x, y );
    }
  }

  void update() 
  {
    if ( IsImagesEmptyOrNull() )
    {
      return;
    }
    setSpeed( fps );
    if ( playing )
    {
      // Move index forward in the animation sequence
      index += speed;
      // If we are at the end of clip, go back to the beginning
      if ( index >= images.size() )
      {
        if ( playOnce )
        {
          // Stop playing and remain at last index
          playing = false;
          index = images.size() - 1;
        } else {
          // We can set image = 0
          // but the more accurate is
          index -= images.size();
        }
      }
    }
  }
  
} // End of the class
