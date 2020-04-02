void Experiment1(){
  color bluekeyColor=color(0,0,255);
  String filename ="data0";
  String alpha_ext = "_alpha";
  String extension = ".png";
   PImage imgCf = loadImage(filename+".png");
   PImage imgA0 = createImage(imgCf.width,imgCf.height, ALPHA);
   
   imgCf.loadPixels();
   imgA0.loadPixels();
   
   for(int i=0;i<imgCf.width*imgCf.height;i++){
       float Cf_red = red(imgCf.pixels[i]);
       float Cf_green = green(imgCf.pixels[i]);
       float Cf_blue = blue(imgCf.pixels[i]);
       float Bk_blue = blue(bluekeyColor);
       float A0;
         if(Bk_blue ==0){
             A0 = 0;
         }else{
             A0 = 1-Cf_blue/Bk_blue;
         }
           imgA0.pixels[i] = color(A0*255);
   }
   imgA0.updatePixels();
   imgA0.save(filename+ alpha_ext+ extension);
   imgA0.resize(width,0);
   //imgCf.resize(width,0);
   //image(imgCf,0,0);
   image(imgA0,0,0);
}
