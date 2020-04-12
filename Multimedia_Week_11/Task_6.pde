//String filename = null;
//PImage imgOriginal, imgOutput;
//String out = "";
//float h, s, b = 0.0; // Depend on IDE and coding language - shortcut
//float offsetH, offsetS, offsetB = 0.0;
//void  HSB_Shifting(String filename, String outputFilenameNoExt)
//{
//  // width and height global system variable
//  this.filename = filename;
//  this.out =outputFilenameNoExt;
//  colorMode( HSB, 360, 100, 100 );
//  imgOriginal = loadImage(filename);
//  int refWidth = width/2; int refHeight = height/2;
//  imgOriginal.resize( refWidth, refHeight );
//  imgOutput = createImage(refWidth, refHeight, HSB );
//}

 

//void draw()
//{
//  hsbEditing();
//}

 

//void keyPressed()
//{
//      if( key == 'x' || key == 'X'){
//      // Save the draw window out
//      save(filename + "_HSB_" 
//      + offsetH + "_" + offsetS + "_" + offsetB + ".png");
//    }else if( key == 'q' || key == 'Q'){ // Increase Hue by 30
//      offsetH = constrain( offsetH + 30.0, -360, 360 );
//    }else if( key == 'a' || key == 'A'){ // Minus Hue by 30
//      offsetH = constrain( offsetH - 30.0, -360, 360 );
//    }else if( key == 'w' || key == 'W'){ // Increase Saturation by 5
//      offsetS = constrain( offsetS + 5.0, -100, 100 );
//    }else if( key == 's' || key == 'S'){ // Minus Saturation by 5
//      offsetS = constrain( offsetS - 5.0, -100, 100 );
//    }else if( key == 'e' || key == 'E'){ // Increase Brightness by 5
//      offsetB = constrain( offsetB + 5.0, -100, 100 );
//    }else if( key == 'd' || key == 'D'){ // Minus Brightness by 5
//      offsetB = constrain( offsetB - 5.0, -100, 100 );
//    }
//}

//  void hsbEditing() {
//    imgOriginal.loadPixels();
//    imgOutput.loadPixels();
//    for(int i = 0; i < imgOriginal.width * imgOriginal.height; i++)
//    {
//      float h = hue( imgOriginal.pixels[i] );
//      float s = saturation( imgOriginal.pixels[i] );
//      float b = brightness( imgOriginal.pixels[i] );
//      float newH = constrain(h + offsetH, 0, 360);
//      float newS = constrain(s + offsetS, 0, 100);
//      float newB = constrain(b + offsetB, 0, 100);
   
//      imgOutput.pixels[i] = color ( newH, newS, newB );
//    }
//    imgOriginal.updatePixels();
//    imgOutput.updatePixels();
//    image( imgOriginal, 0, 0);
//    image( imgOutput, width/2, 0);
//  }
