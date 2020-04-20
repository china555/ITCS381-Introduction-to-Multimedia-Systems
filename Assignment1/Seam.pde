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
  
  void CreateDummyHorizontal(int startY)
  {
    // Calculated 1D index of the y-coordinate using seam length
    startY = startY * pixelIndices.length;
    
    for(int i = 0; i < pixelIndices.length; i++)
    {
      pixelIndices[i] = startY + i;
    }
  }
  
  void CreateDummyVertical(int startX)
  {
    for(int i = 0; i < pixelIndices.length; i++)
    {
      pixelIndices[i] = startX + (i * pixelIndices.length) ;
    }
  }
  
  void PrintSeam(){
    printArray(pixelIndices);
  }
}
