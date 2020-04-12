void CreateYUV_HDTV(String filename, String outputFilenameNoExt)
{
  PImage imgOrigin = loadImage(filename);
  int refWidth = width / 2;
  int refHeight = height / 2;
  PImage imgCch = createImage(refWidth, refHeight, ALPHA); // RGB, ARGB, ALPHA
  PImage imgMch = createImage(refWidth, refHeight, ALPHA); // RGB, ARGB, ALPHA
  PImage imgYch = createImage(refWidth, refHeight, ALPHA); // RGB, ARGB, ALPHA

  imgOrigin.resize(refWidth, refHeight);

  // Load pixel
  imgCch.loadPixels();
  imgMch.loadPixels();
  imgYch.loadPixels();
  float r, g, b, u, v, y, k=0;
  //Load R G B of the image : D you know the trick
  for (int i=0; i < imgOrigin.width * imgOrigin.height; i++)
  {
    r = red(imgOrigin.pixels[i]);
    g = green( imgOrigin.pixels[i] );
    b = blue( imgOrigin.pixels[i] );
    y =  (r * 0.2126) + (g * 0.7152) + (b * 0.0722);
    u =  (r * -0.09991) + (g * -0.33609) + (b * 0.436);
    v =  (r * 0.615) + (g * -0.55861) + (b * -0.05639);
    imgCch.pixels[i] = color( constrain(y, 0, 255) );
    imgMch.pixels[i] = color( constrain(u, 0, 255) );
    imgYch.pixels[i] = color( constrain(v, 0, 255) );
  }

  // Update pixels
  // Load pixel
  imgCch.updatePixels();
  imgMch.updatePixels();
  imgYch.updatePixels();

  // Paint it on the window 1/4 top
  image(imgOrigin, 0, 0); // TL
  image(imgCch, width / 2, 0); // TR
  image(imgMch, 0, height /2 ); //BL
  image(imgYch, width / 2, height / 2); // BR
  // Save image on the display window
  save(outputFilenameNoExt+"_YUV(HDTV).png");
}
