// Template for assignment 1
// Student id: 
// Name :
// 
// Note : Put any note or extra explanation here if you must
//=========================================================================================================== 

// Please change your image path here or create a sketch folder then add image to data/
String filename = "Lenna.png"; 
ImageLib imageLib;

void setup() {
  size(512,512);
  imageLib = new ImageLib(filename);
  
  // Processing command to print the PImage on the window
  // image(imageLib.GetOriginalImg(), 0, 0);
  
  // Nearest Neighbour Scaling
  // imageLib.ResizeNearestNeighbor(1024, 1024);
  //imageLib.ResizeNearestNeighbor(256, 256);
  // imageLib.ResizeNearestNeighbor(256, 128);
  imageLib.ResizeNearestNeighbor(321, 0);
  
  //imageLib.ResizeNearestNeighbor(0, 321);
  
  // ResizeBilinearInterpolation
  //imageLib.ResizeBilinearInterpolation(1024, 1024);
  //imageLib.ResizeBilinearInterpolation(256, 256);
  //imageLib.ResizeBilinearInterpolation(256, 128);
  //imageLib.ResizeBilinearInterpolation(321, 0);
  
  // ResizeSeamCarvingBasic
  //imageLib.ResizeSeamCarvingBasic(1024, 1024);
  //imageLib.ResizeSeamCarvingBasic(256, 256);
  //imageLib.ResizeSeamCarvingBasic(256, 128);
  //imageLib.ResizeSeamCarvingBasic(321, 0);
  
  // ResizeSeamCarvingAdvance (Extra +2%)
  //imageLib.ResizeSeamCarvingAdvance(1024, 1024);
  //imageLib.ResizeSeamCarvingAdvance(256, 256);
  //imageLib.ResizeSeamCarvingAdvance(256, 128);
  //imageLib.ResizeSeamCarvingAdvance(321, 0);
  image(imageLib.GetBufferImg(), 0, 0);
  // Save original image to file
  imageLib.SaveImageToFile("Original.png", ImageLib.ORIGINAL);
  // Save buffer image to file
  imageLib.SaveImageToFile("Buffer.png", ImageLib.BUFFER);
  
  
  
  // Template to test Paint Seam with Dummy Data
  
  
  // Seam s = new Seam(512);
  // s.CreateDummyHorizontal(355);
  // s.CreateDummyVertical(125);
  // color red = color(255,0,0);
  // imageLib.PaintSeam(s, red, ImageLib.ORIGINAL);
  // image(imageLib.GetOriginalImg(), 0, 0);
  
}
