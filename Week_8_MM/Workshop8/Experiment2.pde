// Task 2 : Get Foreground C (zero) using the alpha matte
// Authors: Pisit Praiwattana
// Date: 24 MAR 2020
// Organization: Faculty of ICT, Mahidol University
// Loading alpha from Task1 (or any) to extracted the base foreground (C0)
void Experiment2(int index)
{
  // Composited foreground
  PImage imgCf;
  // Alpha of the foreground in greyscale
  PImage imgAlpha;

  // UncompositedForeground
  PImage imgC0;

  String filename = "data" + index;
  String extension = ".png";
  String alpha_extension = "_alpha";

  imgCf = loadImage(filename + extension);
  imgAlpha = loadImage(filename + alpha_extension + extension);

  imgC0 = createImage(imgCf.width, imgCf.height, ARGB);

  imgCf.loadPixels();
  imgAlpha.loadPixels();
  imgC0.loadPixels();

  for (int i=0; i < imgCf.width * imgCf.height; i++)
  {
    float Cf_red = red( imgCf.pixels[i] );
    float Cf_green = green( imgCf.pixels[i] );
    float Cf_blue = blue( imgCf.pixels[i] );
    
    // !important Makre sure a is within 0-1.0 only
    float a = constrain( brightness(imgAlpha.pixels[i])/255.0, 0, 1);
    color C0_color = color(
      Cf_red,
      Cf_green,
      Cf_blue,
      a *  255 //Opacity = alpha
    );
    imgC0.pixels[i] = C0_color;
  }
  imgC0.updatePixels();
  imgC0.save(filename + "_C0" + extension);
  imgC0.resize(width, 0);
  image(imgC0, 0, 0, width, imgC0.height);
}
