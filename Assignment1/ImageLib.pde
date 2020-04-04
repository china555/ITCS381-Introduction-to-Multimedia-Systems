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

  PImage GetOriginalImg()
  { // function for buffer image
    return originalImage;
  }

  PImage GetBufferImg()
  { // function for buffer image
    return bufferImage;
  }

  void UpdateOriginalWithBufferImg()
  { // function for buffer image
    println("UpdateOriginalWithBufferImg()");
    originalImage = bufferImage.get();
  }

  void UpdateBufferWithOriginalImg()
  { // function for buffer image
    println("UpdateBufferWithOriginalImg()");
    bufferImage = originalImage.get();
  }

  void LoadOriginalImageFromFile(String filename)
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

  void SaveImageToFile(String filename, int option)
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

  void SaveBufferImageToFile(String filename)
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

  void SaveOriginalImageToFile(String filename)
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

  void ResizeByProcessing(int newWidth, int newHeight)
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
  void ResizeNearestNeighbor(int newWidth, int newHeight)
  {
    double x_ratio=0,y_ratio=0;
    double px, py;
    if(newWidth!=0 && newHeight!=0)
    { 
      println("ResizeNearestNeighbor(param1, param2): param1 = " + newWidth + " param2 = " + newHeight);
        x_ratio = bufferImage.width / (double)newWidth; //find width ratio
        y_ratio = bufferImage.height / (double)newHeight; //find height ratio
    } 
    else if(newWidth==0 || newHeight==0) //some width or height = 0 
    {
        int original_ratio = Math.round(originalImage.width / originalImage.height);
      if(newWidth == 0){
         newWidth = newHeight*original_ratio;
         x_ratio = bufferImage.width / (double)newWidth; //find width ratio
         y_ratio = bufferImage.height / (double)newHeight; //find height ratio
      }else if(newHeight == 0){
         newHeight = newWidth * original_ratio;
         x_ratio = bufferImage.width / newWidth; //find width ratio
         y_ratio = bufferImage.height / newHeight; //find height ratio
      }
      //you should preserve  the width:height ratio of the new image (allowing value with 0 to be auto-calulated)
    } 
    else{ //both width and height = 0
      print("We not allow resizing that have newWidth AND newHeight == 0"); 
      return;
    }
      int temp[] = new int[newWidth*newHeight];
      println("Ratio of new image = "+newWidth+" : "+newHeight);
      bufferImage.loadPixels();
      for(int i =0;i<newHeight;i++)
      {
        for(int j=0;j<newWidth;j++)
        {
          px = Math.floor(j*x_ratio) ;
          py = Math.floor(i*y_ratio) ;
          int size = (int)((py*bufferImage.width)+px);
          temp[(i*newWidth)+j] = bufferImage.pixels[size];
        }
      }
      bufferImage.resize(newWidth,newHeight);
      for(int i = 0; i < newWidth * newHeight; i++){
        bufferImage.pixels[i] = temp[i];
      }
    bufferImage.updatePixels();
  }

  // A1-2 Bilinear Interpolation Scaling ==================================================================
  void ResizeBilinearInterpolation(int newWidth, int newHeight)
  {
    println("ResizeBilinearInterpolation(param1, param2): param1 = " + newWidth + " param2 = " + newHeight);
  }

  // A1-3 SeamCarving Scaling ==================================================================
  void ResizeSeamCarvingBasic(int newWidth, int newHeight)
  {
    println("ResizeSeamCarving(param1, param2): param1 = " + newWidth + " param2 = " + newHeight);
    //TODO-0: calculated how many seam need to be removed from the original image in both vertical and horizontal

    //TODO-1: resize on the horizontal
    // TODO-1-1: calculated 'vertical seam' to be removed
    // TODO-1-2: Remove the seam then Repeat the process for 1-1

    //TODO-2: resize on the vertical
    // TODO-2-1: calculated 'horizontal seam' to be removed
    // TODO-1-2: Remove the seam then Repeat the process for 1-2
  }

  Seam GetSingleVerticalSeam()
  {
    if (bufferImage != null)
    {
      // TODO: Calculate 1 single vertical seam

      Seam newSeam = new Seam(bufferImage.height);
      return newSeam;
    } else { 
      println("Error: bufferImage is null"); 
      return null;
    }
  }

  Seam GetSingleHorizontalSeam()
  {
    if (bufferImage != null)
    {
      // TODO: Calculate 1 single horizontal seam

      Seam newSeam = new Seam(bufferImage.width);
      return newSeam;
    } else { 
      println("Error: bufferImage is null"); 
      return null;
    }
  }

  void RemoveSingleSeam(Seam seam)
  {
    if (bufferImage != null && seam != null)
    {
      // TODO: Use seam array of marked 1D pixel location to remove data
      // from the bufferImage

    } else { 
      println("Error: bufferImage or seam is null");
    }
  }

  void PaintSeam(Seam seam, color c, int option)
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
  void ResizeSeamCarvingAdvance(int newWidth, int newHeight)
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
