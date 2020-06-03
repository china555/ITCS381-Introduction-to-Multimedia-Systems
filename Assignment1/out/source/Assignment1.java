import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Assignment1 extends PApplet {

// Template for assignment 1
// Student id: 
// Name :
// 
// Note : Put any note or extra explanation here if you must
//=========================================================================================================== 

// Please change your image path here or create a sketch folder then add image to data/
String filename = "Lenna.png"; 
ImageLib imageLib;

public void setup() {
  
  imageLib = new ImageLib(filename);
  
  // Processing command to print the PImage on the window
  // image(imageLib.GetOriginalImg(), 0, 0);
  
  // Nearest Neighbour Scaling
  // imageLib.ResizeNearestNeighbor(1024, 1024);
  //imageLib.ResizeNearestNeighbor(256, 256);
  // imageLib.ResizeNearestNeighbor(256, 128);
  // imageLib.ResizeNearestNeighbor(321, 0);
  
  //imageLib.ResizeNearestNeighbor(0, 321);
  
  // ResizeBilinearInterpolation
  //imageLib.ResizeBilinearInterpolation(1024, 1024);
  //imageLib.ResizeBilinearInterpolation(256, 256);
  //imageLib.ResizeBilinearInterpolation(256, 128);
  //imageLib.ResizeBilinearInterpolation(321, 0);
  
  // ResizeSeamCarvingBasic
  //imageLib.ResizeSeamCarvingBasic(1024, 1024);
   imageLib.ResizeSeamCarvingBasic(256, 256);
  //imageLib.ResizeSeamCarvingBasic(256, 128);
  //imageLib.ResizeSeamCarvingBasic(321, 0);
  
  // ResizeSeamCarvingAdvance (Extra +2%)
  //imageLib.ResizeSeamCarvingAdvance(1024, 1024);
  //imageLib.ResizeSeamCarvingAdvance(256, 256);
  //imageLib.ResizeSeamCarvingAdvance(256, 128);
  //imageLib.ResizeSeamCarvingAdvance(321, 0);
   //image(imageLib.GetBufferImg(), 0, 0);
  //  // Save original image to file
    imageLib.SaveImageToFile("Original.png", ImageLib.ORIGINAL);
  //  // Save buffer image to file
    imageLib.SaveImageToFile("Buffer.png", ImageLib.BUFFER);
  
  
  
  // Template to test Paint Seam with Dummy Data
  
  
  //Seam s = new Seam(512);
  //s.CreateDummyHorizontal(355);
  //s.CreateDummyVertical(244);
  //color red = color(255,255,0);
  //imageLib.PaintSeam(s, red, ImageLib.ORIGINAL);
  //image(imageLib.GetOriginalImg(), 0, 0);
  
}
// Please modify this class so it contain required implementation of the assignment
class ImageLib
{
  // For explanation, load into lib will keep image as original image
  // any image operation will keep result in bufferImage
  // unless called UpdateOriginalWithBufferImg(), the original will always unchanged
  PImage originalImage;
  PImage bufferImage;

  static final int ORIGINAL = 0;
  static final int BUFFER = 1;

  ImageLib()
  {
    // Initialization
    println("ImageLib()");
    originalImage = null;
    bufferImage = null;
  }

  ImageLib(String filename)
  {
    // Initialization with filename
    println("ImageLib(param1): param1 = " + filename);
    // Load original and buffer with the input image
    LoadOriginalImageFromFile(filename);
    UpdateBufferWithOriginalImg();
  }

  public PImage GetOriginalImg()
  { // function for buffer image
    return originalImage;
  }

  public PImage GetBufferImg()
  { // function for buffer image
    return bufferImage;
  }

  public void UpdateOriginalWithBufferImg()
  { // function for buffer image
    println("UpdateOriginalWithBufferImg()");
    originalImage = bufferImage.get();
  }

  public void UpdateBufferWithOriginalImg()
  { // function for buffer image
    println("UpdateBufferWithOriginalImg()");
    bufferImage = originalImage.get();
  }

  public void LoadOriginalImageFromFile(String filename)
  {
    // Extension must be included in the file name (.jpeg, tiff, targa, .png)
    println("LoadOriginalImageFromFile(param1): param1 = " + filename);
    if (filename.length() > 0)
    {
      originalImage = loadImage(filename);
    } else { 
      println("Error: filename length() is <= 0");
    }
  }

  public void SaveImageToFile(String filename, int option)
  {   
    // Extension must be included in the file name (.jpeg, tiff, targa, .png)
    println("SaveImageToFile(param1, param2), param2 (option = " + option + ")");
    switch(option)
    {
    case BUFFER: // BUFFER
      SaveBufferImageToFile(filename);
      break;

    case ORIGINAL: // ORIGINAL
    default:
      SaveOriginalImageToFile(filename);
    }
  }

  public void SaveBufferImageToFile(String filename)
  {
    // Extension must be included in the file name (.jpeg, tiff, targa, .png)
    println("SaveBufferImageToFile(param1), param1 = " + filename);
    if (bufferImage != null && filename.length() > 0)
    {
      PImage newImage = createImage(bufferImage.width, bufferImage.height, RGB);
      newImage = bufferImage.get();
      newImage.save(filename);
    } else { 
      println("Error: filename length() is <= 0 or bufferImage is null");
    }
  }

  public void SaveOriginalImageToFile(String filename)
  {
    // Extension must be included in the file name (.jpeg, tiff, targa, .png)
    println("SaveOriginalImageToFile(param1), param1 = " + filename);
    if (originalImage != null && filename.length() > 0)
    {
      PImage newImage = createImage(bufferImage.width, bufferImage.height, RGB);
      newImage = originalImage.get();
      newImage.save(filename);
    } else { 
      println("Error: filename length() is <= 0 or originalImage is null");
    }
  }

  public void ResizeByProcessing(int newWidth, int newHeight)
  {
    // This function uses original processing operation from PImage
    // Use 0 with number of width or height to resize proportionally
    println("ResizeByProcessing(param1, param2): param1 = " + newWidth + " param2 = " + newHeight);
    if (originalImage != null)
    {
      UpdateBufferWithOriginalImg();
      bufferImage.resize(newWidth, newHeight);
    } else { 
      println("Error: originalImag is null");
    }
  }

  // A1-1 Nearest Neighbour Scaling ==================================================================
  public void ResizeNearestNeighbor(int newWidth, int newHeight)
  {
    double x_ratio=0, y_ratio=0;
    double px, py;
    if (newWidth!=0 && newHeight!=0)
    { 
      println("ResizeNearestNeighbor(param1, param2): param1 = " + newWidth + " param2 = " + newHeight);
      x_ratio = bufferImage.width / (double)newWidth; //find width ratio
      y_ratio = bufferImage.height / (double)newHeight; //find height ratio
    } else if (newWidth==0 || newHeight==0) //some width or height = 0   ex newwidth =600 newheight =0
    {

      // ex) width = 256, height = 512; 1:2;
      // original_ratio(width/height) = 0.5 = 1/2 => 2/1;
      int original_ratio = Math.round(originalImage.width / originalImage.height);
      if (newWidth == 0) {
        // newWidth will be 0.5 multiplied with current height
        newWidth = newHeight * original_ratio;
        print("height=================================");
        println(newHeight);
        print("width=================================");
        println(newWidth);
        x_ratio = bufferImage.width / (double)newWidth; //find width ratio
        y_ratio = bufferImage.height / (double)newHeight; //find height ratio
      } 
      else if (newHeight == 0) 
      {
        // newHeight will be 2 times bigger than newWidth;
        newHeight = newWidth / original_ratio;
        print("height=================================");
        println(newHeight);
        print("width=================================");
        println(newWidth);

        println("hellow world");
        x_ratio = bufferImage.width / (double)newWidth; //find width ratio
        y_ratio = bufferImage.height / (double)newHeight; //find height ratio

        println(x_ratio, y_ratio);
      }
      //you should preserve  the width:height ratio of the new image (allowing value with 0 to be auto-calulated)
    } else { //both width and height = 0
      print("We not allow resizing that have newWidth AND newHeight == 0"); 
      return;
    }
    int temp[] = new int[newWidth*newHeight];
    println("Ratio of new image = "+newWidth+" : "+newHeight);
    bufferImage.loadPixels();
    for (int i =0; i<newHeight; i++)
    {
      for (int j=0; j<newWidth; j++)
      {
        px = Math.floor(j*x_ratio) ;
        py = Math.floor(i*y_ratio) ;
        int size = (int)((py*bufferImage.width)+px);
        temp[(i*newWidth)+j] = bufferImage.pixels[size];
      }
    }
    bufferImage.resize(newWidth, newHeight);
    for (int i = 0; i < newWidth * newHeight; i++) {
      bufferImage.pixels[i] = temp[i];
    }
    bufferImage.updatePixels();
  }

  // A1-2 Bilinear Interpolation Scaling ==================================================================
  public void ResizeBilinearInterpolation(int newWidth, int newHeight)
  {
    println("ResizeBilinearInterpolation(param1, param2): param1 = " + newWidth + " param2 = " + newHeight); 
    println("Ratio of new image = "+newWidth+" : "+newHeight);
    bufferImage.loadPixels();
    int temp[] = new int[newWidth*newHeight];
    int a, b, c, d, x, y, index;
    float x_ratio = ((float)(originalImage.width - 1))/newWidth;
    float y_ratio = ((float)(originalImage.height -1))/newHeight;
    float x_diff, y_diff, blue, red, green;

    int offset = 0;

    for (int i =0; i<newHeight; i++)
    {
      for (int j=0; j<newWidth; j++)
      {
        x = (int)(x_ratio * j);
        y = (int)(y_ratio * i);
        x_diff = (x_ratio * j) - x;
        y_diff = (y_ratio * i) - y;
        index = (y*originalImage.width+x);

        a = originalImage.pixels[index];
        b = originalImage.pixels[index+1];
        c = originalImage.pixels[index+originalImage.width];
        d = originalImage.pixels[index+originalImage.width+1];

        // gray = (int)( A*(1-x_diff)*(1-y_diff) + B*(x_diff)*(1-y_diff) + C*(1-x_diff)*(y_diff) + D(x_diff)*(y_diff));

        //RGB
        // blue element
        blue = blue(a)*(1-x_diff)*(1-y_diff) + blue(b)*(x_diff)*(1-y_diff) + blue(c)*(y_diff)*(1-x_diff) + blue(d)*(x_diff*y_diff);
        blue = constrain(blue, 0, 255);
        // green element
        green = (green(a))*(1-x_diff)*(1-y_diff) + (green(b))*(x_diff)*(1-y_diff) + (green(c))*(y_diff)*(1-x_diff)   + (green(d))*(x_diff*y_diff);
        green = constrain(green, 0, 255);
        // red element
        red = (red(a))*(1-x_diff)*(1-y_diff) + (red(b))*(x_diff)*(1-y_diff) + (red(c))*(y_diff)*(1-x_diff)   + (red(d))*(x_diff*y_diff);
        red = constrain(red, 0, 255);
        //RGB

        temp[offset++] = color(red, green, blue);
        // px = Math.floor(j*x_ratio) ;
        // py = Math.floor(i*y_ratio) ;
        // int size = (int)((py*bufferImage.width)+px);
        // temp[(i*newWidth)+j] = bufferImage.pixels[size];
      }
    }
    ResizeByProcessing(newWidth, newHeight);
    for (int i = 0; i < newWidth * newHeight; i++) {
      bufferImage.pixels[i] = temp[i];
    }
    bufferImage.updatePixels();
    println("ResizeBilinearInterpolation(param1, param2): param1 = " + newWidth + " param2 = " + newHeight);
  }

  //  // A1-3 SeamCarving Scaling ==================================================================
  //  void ResizeSeamCarvingBasic(int newWidth, int newHeight){

  //    println("ResizeSeamCarving(param1, param2): param1 = " + newWidth + " param2 = " + newHeight);
  //    //TODO-0: calculated how many seam need to be removed from the original image in both vertical and horizontal

  //    // putting seam
  //    // newWidth > original width, newheight > original height

  //    // putting and removing seam
  //    // newwidth > original width, newheight < original height
  //    // newwidth < original width, newheight > original height

  //    //remove seam
  //    // newwidth < original width, newheight < original height
  //     int vertical_difference = bufferImage.width - newWidth; // the different number of Pixels means 
  //     int horizontal_difference = bufferImage.height - newHeight; //the number of seam we need to remove

  //    //TODO-1: resize on the horizontal
  //    // TODO-1-1: calculated 'vertical seam' to be removed
  //    for(int i = 0; i < horizontal_difference; i++){
  //      double energy[][] = new double[bufferImage.height][bufferImage.width]; 
  //    }

  //      double brightness[][] = new double[bufferImage.height][bufferImage.width];
  //      int index = 0;
  //      for(int hei = 0; hei < bufferImage.height; hei++)
  //      {
  //          for(int wid = 0;wid<bufferImage.width;wid++)
  //          {
  //            double r = red(originalImage.pixels[index]);
  //            double g = green(originalImage.pixels[index]);
  //            double b = blue(originalImage.pixels[index]);
  //            double y = constrain( (0.2126*r) + (0.7152*g) + (0.0722*b), 0, 255);
  //            brightness.pixels[hei][wid] = color( constrain(y, 0, 255) );
  //            // brightness[hei][wid] = (red(bufferImage.Pixels[index]) + green(bufferImage.Pixels[index]) + blue(bufferImage.Pixels[index])) / 3;
  //            index++;
  //          }

  //      }

  //      // calculating energy
  //      for(int hei = 0; hei < bufferImage.height; hei++)
  //      {
  //        for(int wid = 0; wid<bufferImage.width;wid++)
  //        {    //top row  i=0
  //          if(hei == 0){
  //            //left side  j=0
  //            if(wid == 0){
  //              energy[hei][wid] = abs(brightness[hei][wid + 1] - brightness[hei][wid])/2 + abs(brightness[hei + 1][widt])/2;
  //            }
  //            //center
  //            else if(wid == bufferImage.width -1){
  //              energy[hei][wid] = abs(brightness=[hei][wid -1] - brightness[hei][wid])/2 + abs(brightness[hei + 1][wid] - brightness[hei][wid])/2;
  //            }
  //            //right side j = maxwidth-1
  //            else{
  //              energy[hei][wid] = abs(brightness[hei][wid + 1] - brightness[hei][wid - 1])/2 + abs(brightness[hei + 1][wid] - brightness[hei][wid])/2;
  //            }
  //          }          
  //          //bottom row i = maxheight -1
  //          else if(hei == bufferImage.height -1){
  //            //left side j = 0
  //            if(wid == 0){
  //              energy[hei][wid] = abs(brightness[hei][wid + 1] - brightness[hei][wid])/2 + abs(brightness[hei -1][wid] - brightness[hei][wid])/2;
  //            }
  //            //right side j = maxwidth - 1
  //            else if(wid == bufferImage.width -1){
  //              energy[hei][wid] = abs(brightness[hei][wid - 1] - brightness[hei][wid])/2 + abs(brightness[hei -1][wid] - brightness[hei][wid])/2;          
  //            }
  //            //center
  //            else{
  //              energy[hei][wid] = abs(brightness[hei][wid -1] - brightness[hei][wid + 1])/2 + abs(brightness[hei -1][wid] - brightness[hei][wid])/2;
  //            }
  //          }
  //          //middle row i = 1 ~ maxheight -2
  //          else{
  //            //left side j = 0
  //            if(wid == 0){
  //              energy[hei][wid] = abs(brightness[hei -1][wid] - brightness[hei + 1][wid])/2 + abs(brightness[hei][wid +1] - brightness[hei][wid -1])/2;
  //            }
  //            //right side j = maxwidth-1
  //            else if(wid == bufferImage.width - 1){
  //              energy[hei][wid] = abs(brightness[hei -1][wid] - brightness[hei +1][wid])/2 + abs(brightness[hei][wid -1] - brightness[hei][wid])/2;
  //            }
  //            //center
  //            else{
  //              energy[hei][wid] = abs(brightness[hei - 1][wid] - brightness[hei + 1][wid])/2 + abs(brightness[hei][wid -1] - brightness[hei][wid +1])/2;
  //            }
  //          }
  //          index++;
  //        }

  //      }


  //      RemoveSingleSeam(GetSingleVerticalSeam());
  //      bufferImage.updatePixels();

  //    //TODO-2: resize on the vertical
  //    // TODO-2-1: calculated 'horizontal seam' to be removed
  //}
  int count =0;
  // A1-3 SeamCarving Scaling ==================================================================
  public void ResizeSeamCarvingBasic(int newWidth, int newHeight)
  {
    println("ResizeSeamCarving(param1, param2): param1 = " + newWidth + " param2 = " + newHeight);
    //TODO-0: calculated how many seam need to be removed from the original image in both vertical and horizontal
    bufferImage.loadPixels();
    int different_Height = originalImage.height - newHeight;
    int different_Width = originalImage.width - newWidth;
    PImage energy = createImage(originalImage.width,originalImage.height, ALPHA); // RGB, ARGB, ALPHA
    count =0;
    energy.loadPixels();
    for (int i=0; i<bufferImage.height*bufferImage.width; i++) {
      float r = red(bufferImage.pixels[i]);
      float g = green(bufferImage.pixels[i]);
      float b = blue(bufferImage.pixels[i]);
      float y = constrain( (0.2126f*r) + (0.7152f*g) + (0.0722f*b), 0, 255);
      bufferImage.pixels[i] = color( constrain(y, 0, 255) );
      //println(energy.pixels[i]);
    }
    int x=0, y=0;
    for (int i=0; i<originalImage.height*originalImage.width; i++) 
    {
      if (x==originalImage.width) {
        x=0;
        y++;
      }
       if (y == 0) //--------------------------------FIRST ROW--------------------------------
       { 
            if (x == 0) 
            { // first row first column
                energy.pixels[i] = (calculate_energy(bufferImage.pixels[getPosition_y(x, y)], bufferImage.pixels[getPosition_y(x + 1, y)], bufferImage.pixels[getPosition_y(x, y)], bufferImage.pixels[getPosition_y(x, y + 1)]));
            } 
            else if (x == width - 1) 
            { // first row right edge
                energy.pixels[i] = (calculate_energy(bufferImage.pixels[getPosition_y(x - 1, y)], bufferImage.pixels[getPosition_y(x, y)], bufferImage.pixels[getPosition_y(x, y)], bufferImage.pixels[getPosition_y(x, y + 1)]));
            } 
            else 
            { // first row middle cells
                energy.pixels[i] = (calculate_energy(bufferImage.pixels[getPosition_y(x - 1, y)], bufferImage.pixels[getPosition_y(x + 1, y)], bufferImage.pixels[getPosition_y(x, y)], bufferImage.pixels[getPosition_y(x, y + 1)]));
            }
        } 
        else if (y == height - 1) //--------------------------------LAST ROW--------------------------------
        { 
            if (x == 0) 
            { // left edge
                energy.pixels[i] = (calculate_energy(bufferImage.pixels[getPosition_y(x, y)], bufferImage.pixels[getPosition_y(x + 1, y)], bufferImage.pixels[getPosition_y(x, y)], bufferImage.pixels[getPosition_y(x, y - 1)]));
            } 
            else if (x == width - 1) { // right edge
                energy.pixels[i] = (calculate_energy(bufferImage.pixels[getPosition_y(x - 1, y)], bufferImage.pixels[getPosition_y(x, y)], bufferImage.pixels[getPosition_y(x, y)], bufferImage.pixels[getPosition_y(x, y - 1)]));
            } 
            else { // middle
                energy.pixels[i] = (calculate_energy(bufferImage.pixels[getPosition_y(x - 1, y)], bufferImage.pixels[getPosition_y(x + 1, y)], bufferImage.pixels[getPosition_y(x, y)], bufferImage.pixels[getPosition_y(x, y - 1)]));
            }
        } else //--------------------------------MIDDLE ROW--------------------------------
        {
            if (x == 0) 
            { // left edge
                energy.pixels[i] = (calculate_energy(bufferImage.pixels[getPosition_y(x, y)], bufferImage.pixels[getPosition_y(x + 1, y)], bufferImage.pixels[getPosition_y(x, y + 1)], bufferImage.pixels[getPosition_y(x, y - 1)]));
            } 
            else if (x == width - 1) 
            { // right edge
                energy.pixels[i] = (calculate_energy(bufferImage.pixels[getPosition_y(x - 1, y)], bufferImage.pixels[getPosition_y(x, y)], bufferImage.pixels[getPosition_y(x, y + 1)], bufferImage.pixels[getPosition_y(x, y - 1)]));
            } 
            else 
            {
                energy.pixels[i] = (calculate_energy(bufferImage.pixels[getPosition_y(x - 1, y)], bufferImage.pixels[getPosition_y(x + 1, y)], bufferImage.pixels[getPosition_y(x, y + 1)], bufferImage.pixels[getPosition_y(x, y - 1)]));
            }
        }
        x++;
    }

    //caluculate M matrix
  PImage M_matrix = createImage(originalImage.width,originalImage.height,ALPHA);
  M_matrix.loadPixels();
    x = 0;
    y = 0;

    for (int i=0; i<originalImage.height*originalImage.width; i++) {
      if(x == originalImage.width){
        x = 0;
        y++;
      }
      if(y == 0){  // if the pixel is located in first row, the Min will be 0
        M_matrix.pixels[i] = energy.pixels[i];
      }else {
        if (x == 0) { 
          // left edge
          M_matrix.pixels[i] = energy.pixels[i] + min(M_matrix.pixels[i - originalImage.width], M_matrix.pixels[i - originalImage.width + 1]);
        }else if (x == originalImage.width -1) {
          // right edge
          M_matrix.pixels[i] = energy.pixels[i] + min(M_matrix.pixels[i - originalImage.width], M_matrix.pixels[i - originalImage.width - 1]);
        }else{
          // middle cells
          M_matrix.pixels[i] = energy.pixels[i] + min(M_matrix.pixels[i - originalImage.width - 1], M_matrix.pixels[i - originalImage.width], M_matrix.pixels[i - originalImage.width + 1]);
        }
      }
      x++;
    }

    
    //TODO-1: resize on the horizontal
    // TODO-1-1: calculated 'vertical seam' to be removed
    // TODO-1-2: Remove the seam then Repeat the process for 1-1
    // PImage Temp = createImage(width,height,ALPHA);
    ArrayList<Seam> allSeam = new ArrayList<Seam>();
    int minIndexSeam[] = new int[originalImage.width];
    count = 0;
    int countIndexSeam =0;

     while (count < originalImage.width * originalImage.height) {
      minIndexSeam[countIndexSeam] = getArrayChunk(M_matrix,minIndexSeam,count);
      allSeam.add(GetSingleVerticalSeam(minIndexSeam));
      count++;
      countIndexSeam++;
     }
      int red = color(255,0,0);
      imageLib.PaintSeam(allSeam.get(0), red, ImageLib.ORIGINAL);
      image(imageLib.GetOriginalImg(), 0, 0);
    
    


    //TODO-2: resize on the vertical
    // TODO-2-1: calculated 'horizontal seam' to be removed
    // TODO-1-2: Remove the seam then Repeat the process for 1-2


  }

  public int getArrayChunk(PImage M_matrix,int minIndexSeam[], int count) {
    int min = M_matrix.pixels[count];
    int index = count;
    for (int i = count; i < count + height; i++) {
      if(min > M_matrix.pixels[i]){
          min = M_matrix.pixels[i];
          index = i;
      }
    }
    return index;
}

  public int getPosition_y(int x, int y) 
  {
    //println(originalImage.width);
    return (y*originalImage.width)+x;
  }

  public int calculate_energy(int x1, int x2, int y1, int y2) 
  {
    return abs(x1-x2)/2+abs(y1-y2)/2;
  }

  public Seam GetSingleVerticalSeam(int[] min)
  {
    if (bufferImage != null)
    {
      // TODO: Calculate 1 single vertical seam
      Seam newSeam = new Seam(bufferImage.height);
      for(int i=0;i<min.length;i++){
        newSeam.pixelIndices[i] = min[i];
      }
      return newSeam;
    } else { 
      println("Error: bufferImage is null"); 
      return null;
    }
  }



  public Seam GetSingleHorizontalSeam()
  {
    if (bufferImage != null)
    {
      ;
      // TODO: Calculate 1 single horizontal seam

      Seam newSeam = new Seam(bufferImage.width);
      return newSeam;
    } else { 
      println("Error: bufferImage is null"); 
      return null;
    }
  }

  public void RemoveSingleSeam(Seam seam)
  {
    if (bufferImage != null && seam != null)
    {
      // TODO: Use seam array of marked 1D pixel location to remove data
      // from the bufferImage
    } else { 
      println("Error: bufferImage or seam is null");
    }
  }

  public void PaintSeam(Seam seam, int c, int option)
  {
    // Replace the originalImage or bufferImage pixel colors on the seam path with input parameter color
    // Useful to display the calculated seam to ensure its validity
    switch(option)
    {
    case BUFFER:
      if (bufferImage != null)
      {
        if (seam.pixelIndices.length > 0)
        {
          for (int i=0; i < seam.pixelIndices.length; i++)
          {
            bufferImage.loadPixels();
            bufferImage.pixels[ seam.pixelIndices[i] ] = c;
            bufferImage.updatePixels();
          }
        }
      } 
      break;

    case ORIGINAL:
    default:
      if (originalImage != null)
      {
        if (seam.pixelIndices.length > 0)
        {
          for (int i=0; i < seam.pixelIndices.length; i++)
          {
            originalImage.loadPixels();
            originalImage.pixels[ seam.pixelIndices[i] ] = c;
            originalImage.updatePixels();
          }
        }
      }
    }
  }

  // A1-3 SeamCarving Scaling Extra ===============
  public void ResizeSeamCarvingAdvance(int newWidth, int newHeight)
  {
    println("ResizeSeamCarvingAdvance(param1, param2): param1 = " + newWidth + " param2 = " + newHeight);
    //TODO: Rather than calculating seam then remove it one-by-one
    // Can you find a way to improve its efficiency like "Make it run faster with less waste effort"
    // One suggestion is that "We can make a collection of seam to be removed from the original image"
    // Use that collection to wholesome resize the image without recalculate LS seam again and again
    // feel free to implement them here and measure the performance improvement compare to the basic one
    // summarize the improvement and its statistic in the report
  }

  // End of ImageLib Class
}
class Seam
{
  int pixelIndices[];
  boolean isHorizontal;
  
  int currentIndex;
  
  Seam(int size)
  {
    this.pixelIndices = new int[size];
    this.isHorizontal = false;
    this.currentIndex = 0;
  }
  
  public void CreateDummyHorizontal(int startY)
  {
    // Calculated 1D index of the y-coordinate using seam length
    startY = startY * pixelIndices.length;
    
    for(int i = 0; i < pixelIndices.length; i++)
    {
      pixelIndices[i] = startY + i;
    }
  }
  
  public void CreateDummyVertical(int startX)
  {
    for(int i = 0; i < pixelIndices.length; i++)
    {
      pixelIndices[i] = startX + (i * pixelIndices.length) ;
    }
  }
  public void CreateDummyVertical(int bestSeam[]){
        for(int i = 0; i < bestSeam.length; i++)
        {
          pixelIndices[i] = bestSeam[i] ;
          //println(pixelIndices[i]);
        }
  }
  
  public void PrintSeam(){
    printArray(pixelIndices);
  }
}
  public void settings() {  size(512,512); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Assignment1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
