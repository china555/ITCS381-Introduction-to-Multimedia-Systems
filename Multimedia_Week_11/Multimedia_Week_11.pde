//Task 1 Load RGB
void setup()
{
  // width and height global system variable
  size(512, 512);
  background(127); // Grey
  //CreateCMY4CH("animal2.jpg","Output_1");
  //CreateCMYK("animal2.jpg","Output_2");
    CreateYUV("animal2.jpg","Output_2");
}
