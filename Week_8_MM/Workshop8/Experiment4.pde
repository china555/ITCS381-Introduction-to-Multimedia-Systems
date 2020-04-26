// Task 4 : Solution 2 with Grey
// Authors: Pisit Praiwattana
// Date: 24 MAR 2020
// Organization: Faculty of ICT, Mahidol University
// Calculating new alpha based on grey assumption (solution2) then recreate the result similar to experiment3
// Assumption is still valid for that foreground with combination of grey is still on the blue screen background
// ================================================================================================================
// option to subsitute Fg with value of Cf_red or Cf_green into blue channel
  // final means constant for java
  // option =2 is to fill the average of RED and GREEN Channel
  final int SOL2_RED_OPTION = 0;
  final int SOL2_GREEN_OPTION = 1;
  final int SOL2_AVG_OPTION = 2;
  
void Experiment4(int index, int option)
{
  
  
  // Adjust the combination of blue from the key for more accurated separation
  color bluescreenColor = color(0, 0, 80);
  
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

  String filename = "data" + index;
  String backgroundFilename = "bg3";
  String extension = ".png";
  String c0_extension = "_c0";
  String alpha_extension = "_alpha";
  String composite_extension = "_comp";
  String solution2_extension = "_sol2";

  imgCf = loadImage(filename + extension);
  // imgAlpha = loadImage(filename + alpha_extension + extension);
  imgBg = loadImage(backgroundFilename + extension);

  int refWidth = imgCf.width;
  int refHeight = imgCf.height;
  
  // Make sure all input images have the same size to prevent array out of bond
  //imgAlpha.resize(refWidth, refHeight);
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
    float bluekey = blue(bluescreenColor);
    
    switch(option)
    { // Assumption Cf_red = Cf_green = Cf_blue
      case SOL2_RED_OPTION:
        Fg_substitute = Cf_red;
      case SOL2_GREEN_OPTION:
        Fg_substitute = Cf_green;
      case SOL2_AVG_OPTION:
        Fg_substitute = (Cf_red + Cf_green) / 2.0; 
    }
    if(bluekey != 0)
    {
      // !important Makre sure a is within 0-1.0 only
      a = constrain( 1.0 - ( Cf_blue - Fg_substitute ) / bluekey, 0, 1 );
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
  
  
  image(imgCf, 0, 0, width/2, height/2);
  image(imgC0, width/2, 0, width/2, height/2);
  image(imgAlpha, 0, height/2, width/2, height/2);
  image(imgComp, width/2, height/2, width/2, height/2);
  // Save C0 from solution2 grey
  imgC0.save(filename + c0_extension + solution2_extension + extension);
  // Save alpha from solution2 grey
  imgAlpha.save(filename + alpha_extension + solution2_extension + extension);
  // Save the composite result out
  imgComp.save(filename + composite_extension + extension);
  // Save the display screen window for reference
  save(filename + "_exp4_summary" + extension);
}
