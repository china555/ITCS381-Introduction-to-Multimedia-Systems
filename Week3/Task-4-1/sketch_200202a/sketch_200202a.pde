//Task 4-1

//// "Hello World" images
//// Declaring a variable of type PImage
//// PImage is a class available from the Processing core library.
//PImage img;
//void setup() {
//size(330,230);
//// Make a new instance of a PImage by loadingan image file
//img = loadImage("Lenna.png");
//}
//void draw() {
//background(0);
//// The image() function displays the image ata location
//// in this case the point (0,0).
//image(img, 0, 0, img.width, img.height);
//}

//Task 4-2

//PImage lenna; // A variable for the image file
//float x,y; // Variables for image location
//float rot; // A variable for image rotation
//void setup() {
//size(1024,768);
//    // Load image, initialize variables
//    lenna = loadImage("Lenna.png");
//    x = 0.0;
//    y = width/2;
//    rot = 0.0;
//}
//void draw() {
//    background(255);
//    // Translate and rotate
//    translate(x,y);
//    rotate(rot);
//    // Images can be animated just like regular shapes using variables, translate(), rotate(), and so on.
//    imageMode(CENTER);
//    image(lenna,0,0);
//    // Adjust variables for animation
//    x += 1.0;
//    rot += 0.02;
//    if (x > width+lenna.width) {
//        x = -lenna.width;
//    }
//}

//Task4-3

//// Swapping images
//int maxImages = 4; // Total # of images
//int imageIndex = 0; // Initial image to be displayed is the first
//// Declaring an array of images.
//PImage[] images = new PImage[maxImages];
//void setup() {
//size(200, 200);
//// Loading the images into the array
//// Don't forget to put the JPG files in the data folder!
//for (int i = 0; i < images.length; i ++ ) {
//images[i] = loadImage( "animal" + i + ".jpg" );
//}
//}
//void draw() {
//// Displaying one image
//image(images[imageIndex], 0, 0);
//}
//void mousePressed() {
//// A new image is picked randomly when the mouse is clicked
//// Note the index to the array must be an integer!
//imageIndex = int(random(images.length));
//println("Index "+"imageIndex"+"\n Width: "+images[imageIndex].width+"\n Height: "+images[imageIndex].height);
//}

//void keyPressed(){
//   if(keyCode == 's' || keyCode == 'S') {
//       imageIndex = int(random(images.length));
//   }
//}


////Task 4-4
//// Setting pixels
//size(200, 200);
//// Before we deal with pixels
//loadPixels();
//// Loop through every pixel
//for (int i = 0; i < pixels.length; i++ ) { // We can get the length of the pixels array just like with any array.
//// Pick a random number, 0 to 255
//float rand = random(255);
//float rand2 = random(255);
//float rand3 = random(255);

//// Create a grayscale color based on random number
//color c = color(rand,rand2,rand3);
//// Set pixel at that location to random color
//pixels[i] = c; // We can access individual elements of the pixels array via an index, just like with any other array.
//}
//// When we are finished dealing with pixels
//updatePixels();

/////////////Task4-5

//// Setting pixels according to their 2D location
//size(200, 200);
//loadPixels();
//// Two loops allow us to visit every column (x) and every row (y).
//// Loop through every pixel column
//for (int x = 0; x < width; x++ ) {
//// Loop through every pixel row
//for (int y = 0; y < height; y++ ) {
//// Use the formula to find the 1D location
//int loc = x + y * width;
//// If even column
//if (x % 2 == 0) {
//pixels[loc] = color(255);
//// If odd column
//} else {
//pixels[loc] = color(0);
//}
//}
//}
//updatePixels();

////Task 4-6

//PImage img;
//void setup() {
//size(512, 512);
//img = loadImage("Lenna.png");
//}
//void draw() {
//loadPixels();
//// We must also call loadPixels() on the PImage since we are going to read its pixels.
//img.loadPixels();
//for (int y = 0; y < height; y++ ) {
//for (int x = 0; x < width; x++ ) {
//int loc = x + y*width;
//// The functions red(), green(), and blue() pull out the three color components from a pixel.
//float r = red(img.pixels [loc]);
//float g = green(img.pixels[loc]);
//float b = blue(img.pixels[loc]);
//// Image Processing would go here
//// If we were to change the RGB values, we would do it here, before setting the pixel in the displaywindow.
//// Set the display pixel to the image pixel
//pixels[loc] = color(r, g, b);
//}
//}
//updatePixels();
//}

////Task- 4-7
//// Displaying the pixels of an image
//PImage img;
//void setup() {
//size(512, 512);
//img = loadImage("Lenna.png");
//}
//void draw() {
//loadPixels();
//// Use the template code from Task 4-6
//// Get the R,G,B values from image
//for (int y = 0; y < height; y++ ) {
//for (int x = 0; x < width; x++ ) {
//int loc = x + y*width;
//float r = red (img.pixels[loc]);
//float g = green(img.pixels[loc]);
//float b = blue (img.pixels[loc]);
//// We calculate a multiplier ranging from 0.0 to 8.0 based on mouseX position.
//// That multiplier changes the RGB value of each pixel.
//float adjustBrightness = map(mouseX, 0, width,0, 8);
//r *= adjustBrightness;
//g *= adjustBrightness;
//b *= adjustBrightness;
//// The RGB values are constrained between 0 and 255 before being set as a new color.
//r = constrain(r, 0, 255);
//g = constrain(g, 0, 255);
//b = constrain(b, 0, 255);
//// Make a new color and set pixel in the window
//color c = color(r, g, b);
//pixels[loc] = c;
//}
//}
//updatePixels();
//}
// Use the template code from Task 4-6


//////Task4-8

//// Brightness threshold
//PImage source; // Source image
//PImage destination; // Destination image
//void setup() {
//size(512,512);
//source = loadImage("Lenna.png");
//destination = createImage(source.width, source.height, RGB);
//}
//void draw() {
//float threshold = 127;
//// We are going to look at both image's pixels
//source.loadPixels();
//destination.loadPixels();
//for (int x = 0; x < source.width; x++ ) {
//for (int y = 0; y < source.height; y++ ) {
//int loc = x + y*source.width;
//// Test the brightness against the threshold
//if (brightness(source.pixels[loc]) > threshold){
//destination.pixels[loc] = color(255); // White
//} else {
//destination.pixels[loc] = color(0); // Black
//}
//}
//}
//// We changed the pixels in destination
//destination.updatePixels();
//// Display the destination
//image(destination,0,0);
//}

//Task 4-10
// threshold with library filter
//PImage img;
//void setup() {
//size(512,512);
//img = loadImage("Lenna.png");
//}
//void draw() {
//// Draw the image
//image(img,0,0);
//// Filter the window with a threshold effect
//// 0.5 means threshold is 50% brightness
//filter(THRESHOLD,0.5);
//}

//task 4-11
 //Sharpen with convolution
PImage img;
int w = 80;
//// The convolution matrix for a "sharpen"effect stored as a 3 x 3 twodimensional array.
////float[][] matrix = { { -1, -1, -1 } ,
////                     { -1, 9, -1 } ,
////                     { -1, -1, -1 } } ;

/////////////////////////Simple Gaussian Blur////////////////////////
//float[][] matrix = { {0.0625,0.125,0.0625 } ,
//                     {0.125,0.25,0.125} ,
//                     {0.0625,0.125,0.0625} } ;
                     
/////////////////////////////Bottom Sobel////////////////////////////
//float[][] matrix = { { -1, -2, -1 } ,
//                     {  0,  0,  0 } ,
//                     {  1,  2,  1 } } ; 
                     
///////////////////////////Identity////////////////////////////
//float[][] matrix = { {  0,  0,  0 } ,
//                     {  0,  1,  0 } ,
//                     {  0,  0,  0 } } ;                      

/////////////////////////////Emboss////////////////////////////
//float[][] matrix = { { -2, -1,  0 } ,
//                     { -1,  1,  1 } ,
//                     {  0,  1,  2 } } ; 
/////////////////////////////Left Sobel////////////////////////////
//float[][] matrix = { {  1,  0, -1 } ,
//                     {  2,  0, -2 } ,
//                     {  1,  0, -1 } } ;                      

/////////////////////////////Outline////////////////////////////
//float[][] matrix = { { -1, -1, -1 } ,
//                     { -1,  8, -1 } ,
//                     { -1, -1, -1 } } ;                      


/////////////////////////////Right Sobel////////////////////////////
//float[][] matrix = { { -1,  0,  1 } ,
//                     { -2,  0,  2 } ,
//                     { -1,  0,  1 } } ;                      

/////////////////////////////Sharpen////////////////////////////
//float[][] matrix = { {  0, -1,  0 } ,
//                     { -1,  5, -1 } ,
//                     {  0, -1,  0 } } ; 

/////////////////////////////Top Sobel////////////////////////////
//float[][] matrix = { {  1,  2,  1 } ,
//                     {  0,  0,  0 } ,
//                     { -1, -2, -1 } } ;                      


/////////////////////////////Edge detection////////////////////////////
//float[][] matrix = { {  0, -1,  0 } ,
//                     { -1,  4, -1 } ,
//                     {  0, -1,  0 } } ;                      


/////////////////////////////Laplacian of Gaussian ////////////////////////////
float[][] matrix = { {  0,  0, -1,  0,  0 } ,
                     {  0, -1, -2, -1,  0 } ,
                     { -1, -2, 16, -2, -1 } ,
                     {  0, -1, -2, -1,  0 } ,
                     {  0,  0, -1,  0,  0 } };                      
/////////////////////////////Gaussian Blur///////////////////////////////
//float[][] matrix = { {  0,  0,  0,  5,  0,  0,  0 } ,
//                     {  0,  5, 18, 32, 18,  5,  0 } ,
//                     {  0, 18, 64,100, 64, 18,  0 } , 
//                     {  5, 32,100,100,100, 32,  5 } ,
//                     {  0, 18, 64,100, 64, 18,  0 } ,
//                     {  0,  5, 18, 32, 18,  5,  0 } ,
//                     {  0,  0,  0,  5,  0,  0,  0 }};
             
//float[][] matrix = {
//          {0.00000067, 0.00002292,  0.00019117,  0.00038771,  0.00019117,  0.00002292,  0.00000067},
//          {0.00002292, 0.00078633,  0.00655965,  0.01330373,  0.00655965,  0.00078633,  0.00002292},
//          {0.00019117, 0.00655965,  0.05472157,  0.11098164,  0.05472157,  0.00655965,  0.00019117},
//          {0.00038771, 0.01330373,  0.11098164,  0.22508352,  0.11098164,  0.01330373,  0.00038771},
//          {0.00019117, 0.00655965,  0.05472157,  0.11098164,  0.05472157,  0.00655965,  0.00019117},
//          {0.00002292, 0.00078633,  0.00655965,  0.01330373,  0.00655965,  0.00078633,  0.00002292},
//          {0.00000067, 0.00002292,  0.00019117,  0.00038771,  0.00019117,  0.00002292,  0.00000067}
//};                     
//void setup() {
//    size(512,512);
//    img = loadImage( "Lenna.png" );
//}
//void draw() {
//    // We're only going to process a portion of the image
//    // so let's set the whole image as the background first
//    image(img,0,0);
//    // In this example we are only processing a section of the imagean 80 x 80 rectangle around the mouse location.
//    int xstart = constrain(mouseX-w/2,0,img.width);
//    int ystart = constrain(mouseY-w/2,0,img.height);
//    int xend = constrain(mouseX + w/2,0,img.width);
//    int yend = constrain(mouseY + w/2,0,img.height);
//    int matrixsize = matrix.length;
//    loadPixels();
//    // Begin our loop for every pixel
//    for (int x = xstart; x < xend; x++ ) {
//        for (int y = ystart; y < yend; y++ ) {
//            // Each pixel location (x,y) gets passed into a function called convolution()
//            // The convolution() function returns a new color to be displayed.
//            color c = convolution(x,y,matrix,matrixsize,img);
            
            
//            int loc = x + y*img.width;
//            pixels[loc] = c;
//        }
//    }
//    updatePixels();
//    stroke(0);
//    noFill();
//    rect(xstart,ystart,w,w);
//}

//color convolution(int x, int y, float[][] matrix, int matrixsize, PImage img) {
//    float rtotal = 0.0;
//    float gtotal = 0.0;
//    float btotal = 0.0;
//    int offset = matrixsize / 2;
//    // Loop through convolution matrix
//        for (int i = 0; i < matrixsize; i++ ) {
//            for (int j = 0; j < matrixsize; j++ ) {
//                // What pixel are we testing
//                int xloc = x + i-offset;
//                int yloc = y + j-offset;
//                int loc = xloc + img.width*yloc;
//                // Make sure we haven't walked off the edge of the pixel array
//                // It is often good when looking at neighboring pixels to make sure we have not gone off the edge of the pixel array by accident.
//                loc = constrain(loc,0,img.pixels.length-1);
//                // Calculate the convolution
//                // We sum all the neighboring pixels multiplied by the values in the convolution matrix.
//                rtotal += (red(img.pixels[loc]) * matrix[i][j]);
//                gtotal += (green(img.pixels[loc]) * matrix[i][j]);
//                btotal += (blue(img.pixels[loc]) * matrix[i][j]);
//            }
//        }
//    return color(rtotal,gtotal,btotal);
//}

//// "Pointillism"
//PImage img;
//int pointillize = 16;
//void setup() {
//size(200,200);
//img = loadImage("Lenna.png");
//background(255);
//smooth();
//}
//void draw() {
//// Pick a random point
//int x = int(random(img.width));
//int y = int(random(img.height));
//int loc = x + y*img.width;
//// Look up the RGB color in the source image
//loadPixels();
//float r = red(img.pixels[loc]);
//float g = green(img.pixels[loc]);
//float b = blue(img.pixels[loc]);
//noStroke();
//// Back to shapes! Instead of setting a pixel, we use the color
//// from a pixel to draw a circle.
//fill(r,g,b,100);
//ellipse(x,y,pointillize,pointillize);
//}


///challegne 1
///challegne 2
//  int rectX,rectY,circleX, circleY,rectsize = 100,cirsize = 100;
// void setup(){
//  size(600,600);
//  background(255);
//  rectX = (width/2)-150;
//  rectY = (height/2)-50;
//  circleX = width/2+cirsize/2+10;
//  circleY = height/2;
//  ellipseMode(CENTER);
//}
//void draw(){
//  if(mouseX>rectX&&mouseX<rectX+100&&mouseY>rectY&&mouseY<rectY+100){
//    if(mousePressed){
//    background(#B2DEFF);
//    }
//    println("x = "+mouseX+"\ny = "+mouseY);
//  }
//  else if (sqrt(sq(circleX-mouseX) + sq(circleY-mouseY)) < cirsize/2){
//    if(mousePressed){
//    background(#FFD3F8);
//    }
//    println("x = "+mouseX+"\ny = "+mouseY);
//  }
//  else if (mousePressed){
//    background(255);
//  }
//   stroke(#FF40F6);
//  strokeWeight(10);
//  fill(#40FFD1);
//  rect(rectX,rectY,rectsize,rectsize);
//  stroke(195,65,74);
//  strokeWeight(10);
//  fill(256,255,169);
//  ellipse(circleX,circleY,120,120);
//}

////Challenge 3
////Challenge 4
//  int rectX,rectY,circleX, circleY,rectsize = 100,cirsize = 100,speed =5 ,speed2=6;
// void setup(){
//  size(600,600);
//  rectX = (width/2)-150; rectY = 10; circleX = 50;circleY = height/2;
//  ellipseMode(CENTER);
//}
//void draw(){
//   background(255);
//  if(circleX<50||circleX>width-50){
//     speed = speed*-1; 
//  }
//  if(rectY<10||rectY>height-100){
//     speed2 = speed2*-1; 
//  }
//  stroke(#FF40F6);
//  strokeWeight(10);
//  fill(#40FFD1);
//  rect(rectX,rectY,rectsize,rectsize);
//  stroke(195,65,74);
//  strokeWeight(10);
//  fill(256,255,169);
//  ellipse(circleX,circleY,120,120);
//  circleX = circleX+speed;
//  rectY = rectY+speed2;
//}
