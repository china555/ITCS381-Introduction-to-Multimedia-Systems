// Task 7 : Solution 4 Triangulation
// Authors: Pisit Praiwattana
// Date: 24 MAR 2020
// Organization: Faculty of ICT, Mahidol University
// There is a solution C0 to the Matting problem if the uncomposited foreground object 
// is known against two arbitrary backing color Ck1 and Ck2
// Refer the proof on: https://www.researchgate.net/publication/220720513_Blue_Screen_Matting, Alvy Ray Smith, James F. Blinn, 
void Experiment7()
{
  PImage imgF1 = loadImage("data6_fb1.png");
  PImage imgF2 = loadImage("data6_fb2.png");
  PImage imgB1 = loadImage("data6_b1.png");
  PImage imgB2 = loadImage("data6_b2.png");
  int refWidth = imgF1.width;
  int refHeight = imgF1.height;
  imgF2.resize(refWidth, refHeight); 
  imgB1.resize(refWidth, refHeight);
  imgB2.resize(refWidth, refHeight);
  imgF1.loadPixels(); imgF2.loadPixels(); 
  imgB1.loadPixels(); imgB2.loadPixels();
  PImage imgAlpha = createImage(refWidth, refHeight, ALPHA);
  for(int i = 0 ; i < refWidth * refHeight; i++){
    float Rf1 = red(imgF1.pixels[i]);
    float Gf1 = green(imgF1.pixels[i]);
    float Bf1 = blue(imgF1.pixels[i]);
    
    float Rf2 = red(imgF2.pixels[i]);
    float Gf2 = green(imgF2.pixels[i]);
    float Bf2 = blue(imgF2.pixels[i]);
    
    float Rb1 = red(imgB1.pixels[i]);
    float Gb1 = green(imgB1.pixels[i]);
    float Bb1 = blue(imgB1.pixels[i]);
    
    float Rb2 = red(imgB2.pixels[i]);
    float Gb2 = green(imgB2.pixels[i]);
    float Bb2 = blue(imgB2.pixels[i]);
    
    float a;
    float divider = pow(Rb1 - Rb2, 2) +
      pow(Gb1 - Gb2, 2) + pow(Bb1 - Bb2, 2);
      
    if(divider == 0) { a = 0;  }
    
    a = 1 - ((Rf1 - Rf2)*(Rb1 - Rb2) + 
      (Gf1 - Gf2)*(Gb1 - Gb2) + (Bf1 - Bf2)*(Bb1 - Bb2))/ divider;
      
    // !important Makre sure a is within 0-1.0 only
    a = constrain(a, 0.0, 1.0);
    
    imgAlpha.pixels[i] = color( a * 255.0);  
  }
  imgAlpha.updatePixels(); 
  imgAlpha.save("data6_alpha.png");
  imgAlpha.resize(width,0); image(imgAlpha, 0, 0);
}
