void CreateY(String filename, String outputFilenameNoExt)
{
  PImage imgOrigin = loadImage(filename);
  PImage imgYch = createImage(width, height, ALPHA); // RGB, ARGB, ALPHA
 
  imgOrigin.resize(width, height);
 
  // Load pixel
  imgYch.loadPixels();
   float r,g,b,y;
  //Load R G B of the image : D you know the trick
  for(int i=0; i < imgOrigin.width * imgOrigin.height ; i++)
  {
    r = red(imgOrigin.pixels[i]);
    g = green( imgOrigin.pixels[i] );
    b = blue( imgOrigin.pixels[i] );
    y = constrain( (0.2126*r) + (0.7152*g) + (0.0722*b), 0, 255);
    imgYch.pixels[i] = color( constrain(y, 0, 255) );
  }
 
  // Update pixels
  // Load pixel
  imgYch.updatePixels();
   
  // Paint it on the window 1/4 top
  image(imgYch,0,0); // BR
  // Save image on the display window
  save(outputFilenameNoExt+"_CMY_4ch.png");
}
