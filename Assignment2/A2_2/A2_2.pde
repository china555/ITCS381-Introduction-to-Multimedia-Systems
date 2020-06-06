import processing.video.*;

Movie earth; //foreground
Movie universe; //background

final int SOL2_RED_OPTION = 0;
final int SOL2_BLUE_OPTION = 1;
final int SOL2_AVG_OPTION = 2;

// Composited foreground
PImage imgCf;
// Alpha of the foreground in greyscale
PImage imgAlpha;

// Background Image
PImage imgBg;

// UncompositedForeground
PImage imgC0;

// New Composite Image
// Make an assumption that the output has the same size as original composited foreground
PImage imgComp;

color greenscreenColor = color(0, 100, 0);

void setup() {
  earth = new Movie(this, "earth.mp4");
  universe = new Movie(this, "universe.mp4");
  size(960, 720);

  earth.loop();
  universe.loop(); 
}


// Step 4. Read new frames from movie
void movieEvent(Movie movie) { 
  movie.read();
}

void draw() {
imgCf = earth.get();
imgBg = universe.get();

int refWidth = imgCf.width;
int refHeight = imgCf.height;

// Make sure all input images have the same size to prevent array out of bond
imgBg.resize(refWidth, refHeight);

imgAlpha = createImage(imgCf.width, imgCf.height, ALPHA);
imgC0 = createImage(imgCf.width, imgCf.height, ARGB);
imgComp = createImage(imgCf.width, imgCf.height, RGB);

imgCf.loadPixels();
imgAlpha.loadPixels();
imgBg.loadPixels();
imgC0.loadPixels();
imgComp.loadPixels();

for (int i=0; i < imgCf.width * imgCf.height; i++)
  {
    float Cf_red = red( imgCf.pixels[i] );
    float Cf_green = green( imgCf.pixels[i] );
    float Cf_blue = blue( imgCf.pixels[i] );
    
    float Cbg_red = red( imgBg.pixels[i] );
    float Cbg_green = green( imgBg.pixels[i] );
    float Cbg_blue = blue( imgBg.pixels[i] );
    
    float a = 0.0;
    float Fg_substitute = 0.0;
    float greenKey = green(greenscreenColor);
    
    switch(1)
    { // Assumption Cf_red = Cf_green = Cf_blue
      case SOL2_RED_OPTION:
        Fg_substitute = Cf_red;
      case SOL2_BLUE_OPTION:
        Fg_substitute = Cf_blue;
      case SOL2_AVG_OPTION:
        Fg_substitute = (Cf_red + Cf_blue) / 2.0; 
    }
    if(greenKey != 0)
    {
      // !important Makre sure a is within 0-1.0 only
      a = constrain( 1.0 - ( Cf_green - Fg_substitute ) / greenKey, 0, 1 );
    }else{
      a = 1.0;
    }
    imgAlpha.pixels[i] = color ( a * 255.0 );
    
    color C0_color = color(
      Cf_red,
      Cf_green,
      Cf_blue,
      a *  255 //Opacity = alpha * 255 as range in processing color
    );
    
    imgC0.pixels[i] = C0_color;
    
    // !important Makre sure a is within 0-1.0 only
    float one_minus_a = constrain(1.0 - a, 0.0, 1.0); 
    
    color Comp_color = color(
      constrain( (a * Cf_red) + ( one_minus_a * Cbg_red ), 0, 255 ),
      constrain( (a * Cf_green) + ( one_minus_a * Cbg_green ), 0, 255),
      constrain( (a * Cf_blue) + ( one_minus_a * Cbg_blue ), 0, 255) 
    );
    imgComp.pixels[i] = Comp_color;
  }
  imgAlpha.updatePixels();
  imgC0.updatePixels();
  imgComp.updatePixels();

image(imgComp, 0, 0);
}
