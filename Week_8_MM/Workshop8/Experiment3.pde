// Task 3 : Composite image on new Background (in short - Bg)
// Authors: Pisit Praiwattana
// Date: 24 MAR 2020
// Organization: Faculty of ICT, Mahidol University
// Loading alpha from Task1 then recomposite input into new background
void Experiment3(int index)
{
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
  String backgroundFilename = "bg2";
  String extension = ".png";
  String alpha_extension = "_alpha";
  String composite_extension = "_comp";

  imgCf = loadImage(filename + extension);
  imgAlpha = loadImage(filename + alpha_extension + extension);
  imgBg = loadImage(backgroundFilename + extension);

  int refWidth = imgCf.width;
  int refHeight = imgCf.height;
  
  // Make sure all input images have the same size to prevent array out of bond
  imgAlpha.resize(refWidth, refHeight);
  imgBg.resize(refWidth, refHeight);

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
    
    // !important Makre sure a is within 0-1.0 only
    float a = constrain( brightness(imgAlpha.pixels[i])/255.0, 0, 1);
    
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
      (a * Cf_red) + ( one_minus_a * Cbg_red ),
      (a * Cf_green) + ( one_minus_a * Cbg_green ),
      (a * Cf_blue) + ( one_minus_a * Cbg_blue ) 
    );
    imgComp.pixels[i] = Comp_color;
  }
  imgC0.updatePixels();
  imgComp.updatePixels();
  
  
  image(imgCf, 0, 0, width/2, height/2);
  image(imgC0, width/2, 0, width/2, height/2);
  image(imgAlpha, 0, height/2, width/2, height/2);
  image(imgComp, width/2, height/2, width/2, height/2);
  // Save the composite result out
  imgComp.save(filename + composite_extension + extension);
  // Save the display screen window for reference
  save(filename + "_exp3_summary" + extension);
}
