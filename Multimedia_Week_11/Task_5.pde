void Quantization (String filename, String outputFilenameNoExt){
  int refWidth = width / 2;
  int refHeight = height / 2;
  PImage imgOrigin = loadImage(filename);
  PImage originalY = createImage(refWidth, refHeight, ALPHA);
  PImage img0_75 = createImage(refWidth, refHeight, ALPHA);
  PImage img0_5 = createImage(refWidth, refHeight, ALPHA);
  PImage img0_25 = createImage(refWidth, refHeight, ALPHA);
  imgOrigin.resize(refWidth, refHeight);
// Load pixel 
originalY.loadPixels();
img0_75.loadPixels();
img0_5.loadPixels();
img0_25.loadPixels();
float r,g,b,y;

//Load RGB of the image
for(int i=0; i<imgOrigin.width * imgOrigin.height ; i++)
{
  r = red(imgOrigin.pixels[i]);
  g = green(imgOrigin.pixels[i]);
  b = blue(imgOrigin.pixels[i]);
  
  y = (0.299 * r)+(0.578*g)+(0.144*b);
  //u = (0.5959 * r)+(-0.2746*g)+(-0.3213*b);
  //v = (0.2115 * r)+(-0.5227*g)+(0.3112*b);
  
  originalY.pixels[i] = color(constrain(y,0,255));
  img0_75.pixels[i] = color(constrain(floor(y/192)*192,0,255));
  img0_5.pixels[i] = color(constrain(floor(y/128)*128,0,255));
  img0_25.pixels[i] = color(constrain(floor(y/64)*64,0,255));
}
originalY.updatePixels();
img0_75.updatePixels();
img0_5.updatePixels();
img0_25.updatePixels();
 image(originalY, 0, 0);
  image(img0_75, width / 2, 0);
  image(img0_5, 0, height /2 );
  image(img0_25, width / 2, height / 2);
  save(outputFilenameNoExt+"_Quantization.png");
}
