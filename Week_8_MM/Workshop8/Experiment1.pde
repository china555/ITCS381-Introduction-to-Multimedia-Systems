// Task 1 : Get Alpha from no blue
// Authors: Pisit Praiwattana
// Date: 24 MAR 2020
// Organization: Faculty of ICT, Mahidol University
void Experiment1(int index)
{
  // The background color is assumed of containing only blue
  // It can be modifed to work on green channel as well
  // the assumption works on the background has a pure blue = 255, 
  // but what of reality? - in the studio, blue can be varied
  color blueOfTheBg = color(0 ,0, 255);
  // Composited foreground
  PImage imgCf;
  // Alpha of the foreground
  PImage imgAlpha;
  // For quick name combining - not optimized but work well for experiment
      String filename = "data" + index;
      String extension = ".png";
      String alpha_extension = "_alpha";
      // filename + alpha_extension + extension = data0_alpha.png
  imgCf = loadImage(filename + extension);
  imgAlpha = createImage(imgCf.width, imgCf.height, ALPHA);
  imgCf.loadPixels();
  imgAlpha.loadPixels();
  for(int i = 0; 
    i < imgCf.width * imgCf.height; 
    i++)
  {  // Cf = C0 + (1-a)Bk
     // Cf_red, Cf_green, Cf_blue
     float Cf_red = red( imgCf.pixels[i] );
     float Cf_green = green( imgCf.pixels[i] );
     float Cf_blue = blue( imgCf.pixels[i] );
     // a = 1 - Bf / Bk, Bk!=0, a <- [0,1]
     float a;
     if(blue(blueOfTheBg) == 0) //Casue precision error sometimes
     {
       a = 0; // TODO: quick assumption
     }else{
       // !important Makre sure a is within 0-1.0 only
       constrain( a = 1 - Cf_blue / blue(blueOfTheBg), 0, 1);
     }
     // Set alpha back to alpha image
     imgAlpha.pixels[i] = color( a * 255 );
  }
  imgAlpha.updatePixels();
  // Save the file
  imgAlpha.save(filename + alpha_extension + extension);
  // Resize the image so that the width fit in the window width,
  // set height to 0 so it is automatically recalculated to preserve aspect ratio
  imgAlpha.resize(width, 0);
  // Preview the result on the window
  image(imgAlpha, 0, 0, width, imgAlpha.height);
}
