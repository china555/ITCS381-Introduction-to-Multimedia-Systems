//Task 1 Load RGB
void setup()
{
  // width and height global system variable
  size(512, 512);
  String img = "animal0.jpg";
  background(127); // Grey
  //Task 1
  //CreateCMY4CH(img,"Output_1");
  //Task 2
  //CreateCMYK(img,"Output_2");
  //Task 3
    //CreateYUV(img,"Output_3");
    //CreateYUV_SDTV(img,"Output_3");
    //CreateYUV_HDTV(img,"Output_3");
    //CreateYUV_YIQ(img,"Output_3");
  //Task 4
  //CreateY(img,"Output_4");
  //Task 5
  Quantization(img,"Output_5");
  //Task 6
  //HSB_Shifting(img,"Output_6");
}
