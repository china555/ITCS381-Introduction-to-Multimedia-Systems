// Task 6 : Solution 1 : Thresholding, any color can be used as a key with torrelance threshold 
// Authors: Pisit Praiwattana
// Date: 24 MAR 2020
// Organization: Faculty of ICT, Mahidol University
// Calculating solution 1 based on the color-key
// if C = Ck then a = 0 otherwise a = 1
// However, if the compare(C, Ck) give an absolute difference within the threshold, we can give it a go
// a proportional transparent can also be calculated similar to other solution but we won't do it in this experiment
// ================================================================================================================
  
void Experiment6(int index, int redKey, int greenKey, int blueKey, float diffThreshold)
{
  // Make sure the threshold is valid
  if(diffThreshold <= 0.01)
  {
    diffThreshold = 0.01;
  }
  
  // Adjust the combination of blue from the key for more accurated separation
  color colorKey = color(redKey, greenKey, blueKey);
  
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
  String solution1_extension = "_sol1e6";

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
    
    float Ck_red = red(colorKey);
    float Ck_green = green(colorKey);
    float Ck_blue = blue(colorKey);
    
    // Calculate the color difference from key color
    float diffRed = abs(Cf_red - Ck_red);
    float diffGreen = abs(Cf_green - Ck_green);
    float diffBlue = abs(Cf_blue - Ck_blue);
    
    float a = 0.0;
    
    // Comparing float == 0.0 is a risky operation, use small epsilon instead
    if(diffRed + diffGreen + diffBlue <= diffThreshold)
    {
      a = 0.0;
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
  imgC0.save(filename + c0_extension + solution1_extension + extension);
  // Save alpha from solution2 grey
  imgAlpha.save(filename + alpha_extension + solution1_extension + extension);
  // Save the composite result out
  imgComp.save(filename + composite_extension + solution1_extension + extension);
  // Save the display screen window for reference
  save(filename + "_exp6_summary" + int(red(colorKey)) + "_" + int(green(colorKey)) + "_" + int(blue(colorKey)) + extension);
}
