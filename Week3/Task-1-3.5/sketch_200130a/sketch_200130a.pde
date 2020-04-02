////Task 1.1 
//size(480, 270);
//background(255);
//stroke(0);
//fill(150);
//rect(50, 50, 75, 100);

//// Storke and fill has effect to
//// only the underneath draw
//stroke(1); // Line strength
//fill(250); // Color [Black->White] [0-255]
//rect(200, 50, 60, 30);

////Task 1.2
//size(480, 270);
//background(255);
//// noFill() leaves the shape with only an outline.
//noFill();
//stroke(0);
//ellipse(60, 60, 100, 100);

////Task 1.3
//size(600, 400);
//background(113,192,224);
//noStroke();
//// Bright red
//fill(255, 0, 0);
//ellipse(20, 20, 16, 16);
//// Dark red
//fill(127, 0, 0);
//ellipse(40, 20, 16, 16);
//// Pink (pale red)
//fill(255, 200, 200);
//ellipse(60, 20, 16, 16);
//fill(14, 212, 17);
//ellipse(80, 20, 16, 16);

//// Example 1-4: Alpha Transparency
//size(480, 270);
//background(0);
//noStroke();
//// No fourth argument means 100% opacity.
//fill(0, 0, 255);
//rect(0, 0, 240, 200);
//// 255 means 100% opacity.
//fill(255, 0, 0, 255);
//rect(0, 0, 480, 40);
//// 75% opacity.
//fill(255, 0, 0, 191);
//rect(0, 50, 480, 40);
//// 55% opacity.
//fill(255, 0, 0, 127);
//rect(0, 100, 480, 40);
//// 25% opacity.
//fill(255, 0, 0, 63);
//rect(0, 150, 480, 40);
////10%
//fill(255, 0, 0, 25);
//rect(0, 200, 480, 40);

//Task2.1
//// Zog
//size(480, 270);
//background(255);
//ellipseMode(CENTER);
//rectMode(CENTER);
//// Body
//stroke(0);
//fill(226, 168, 182);
//rect(240, 145, 20, 100);
//// Head
//fill(215, 255, 182);
//ellipse(240, 115, 60, 60);
//// Eyes
//fill(0);
//ellipse(221, 115, 16, 32);
//ellipse(259, 115, 16, 32);
//// Legs
//stroke(0);
//line(230, 195, 220, 205);
//line(250, 195, 260, 205);

//// setup() runs first one time.
//// size() should always be first line of setup
//void setup() {
//// Set the size of the window
//size(480, 270);
//}

//// draw() loops continuously until you close the sketch window.
//void draw() {
//// Draw a white background
//background(255);
//// Set CENTER mode
//ellipseMode(CENTER);
//rectMode(CENTER);
//// Body
//stroke(0);
//fill(150);
//rect(240, 145, 20, 100);
//// Head
//fill(255);
//ellipse(240, 115, 60, 60);
//// Eyes
//fill(0);
//ellipse(221, 115, 16, 32);
//ellipse(259, 115, 16, 32);
//}

//Task 2-2
//// mouseX and mouseY
//void setup() {
//size(480, 270);
//// Try moving background() to setup() and see the difference!
//background(255);
//}
//void draw() {
//// Body
//stroke(0);
//fill(252, 33, 2);
//rectMode(CENTER);
//// mouseX is a keyword that the sketch replaces withthe horizontal position of the mouse.
//// mouseY is a keyword that the sketch replaces withthe vertical position of the mouse.
//ellipse(mouseX, mouseY, 50, 50);
//}



////Task 2-3
//void setup() {
//size(480, 270); // Set the size of the window
//}
//void draw() {
//background(255); // Draw a white background
//// Set ellipses and rects to CENTER mode
//ellipseMode(CENTER);
//rectMode(CENTER);
//// Draw Zoog's body
//stroke(0);
//fill(175);
//// Zoog's body is drawn at the location (mouseX, mouseY).
//rect(mouseX, mouseY, 20, 100);
//// Draw Zoog's head
//stroke(0);
//fill(255);
//// Zoog's head is drawn above the body at thelocation (mouseX, mouseY - 30);
//ellipse(mouseX, mouseY-30, 60, 60);
//// Eyes
//fill(0);
//ellipse(mouseX-10, mouseY-30, 16, 32);
//ellipse(mouseX+10, mouseY-30, 16, 32);
//// Legs
//stroke(0);
//line(mouseX-10, mouseY+50, mouseX-20, mouseY+100);
//line(mouseX+10, mouseY+50, mouseX+30, mouseY+100);
//}

// Drawing a continuous line
//void setup() {
//size(480, 270);
//}
//void draw() {
//  background(255);
//stroke(204, 102, 0);
//strokeWeight(10);
//// Draw a line from previous mouse location to current mouse location.
//line(pmouseX, pmouseY, mouseX, mouseY);
//}

//Task 2-5
////mousePressed and keyPressed
//void setup() {
//size(480, 270);
//background(255);
//}
//void draw() {
//// Nothing happens in draw() in this example!
//}
//// Whenever a user clicks the mouse the code written inside mousePressed() is executed.
//void mousePressed() {
//stroke(0);
//fill(175);
//rectMode(CENTER);
//rect(mouseX, mouseY, 16, 16);
//}
//// Whenever a user presses a key the code written inside ke
//yPressed() is executed.
//void keyPressed() {
//background(255);
//}

//Task 2-5

//mousePressed and keyPressed
void setup() {
size(480, 270);
background(255);
}
void draw() {
// Nothing happens in draw() in this example!
rectMode(CENTER);
if(mousePressed){
if(press){
  background(255);
  press = false;
}
strokeWeight(5);
stroke(255,100,160);
line(mouseX,mouseY,mouseX,mouseY);
}
}
// Whenever a user clicks the mouse the code written insidemousePressed() is executed.

boolean press = false;
// Whenever a user presses a key the code written inside keyPressed() is executed.
void keyPressed() {
     press = true; 
}

// Interactive Zoog?
//void setup() {
//// Set the size of the window
//size(480, 270);
//// The frame rate is set to 30frames per second.
//frameRate(30);
//}
//void draw() {
//// Draw a white background
//background(255);
//// Set ellipses and rects to CENTER mode
//ellipseMode(CENTER);
//rectMode(CENTER);
//// Draw Zoog's body
//stroke(0);
//fill(175);
//rect(mouseX, mouseY, 20, 100);
//// Draw Zoog's head
//stroke(0);
//fill(255);
//ellipse(mouseX, mouseY-30, 60, 60);
//// Draw Zoog's eyes
//// The eye color is determined by the mouse location.
//fill(mouseX/2, 0, mouseY/2);
//ellipse(mouseX-19, mouseY-30, 16, 32);
//ellipse(mouseX+19, mouseY-30, 16, 32);
//// Draw Zoog's legs
//stroke(0);
//// The legs are drawn according to the mouse location and the previous mouse location.
//line(mouseX-10, mouseY+50, pmouseX-10, pmouseY+60);
//line(mouseX+10, mouseY+50, pmouseX+10, pmouseY+60);

//line(mouseX-9.5, mouseY+20, pmouseX-40, pmouseY-10);
//line(mouseX+40, mouseY+10, pmouseX+10, pmouseY+20);
//}
//void mousePressed() {
//println("Take me to your leader!");
//println("I am your lovely pet!");
//}

////Task 2-7

//void setup() {
//size(480, 270);
//frameRate(30);
//}
//void draw() {
//background(255);
//rectMode(CENTER);
//ellipseMode(CENTER);
//// Draw everything relative to (mouseX, mouseY)
//line(mouseX-10, mouseY+50, pmouseX-10, pmouseY+70);
//line(mouseX+10, mouseY+50, pmouseX+10, pmouseY+70);
//translate(mouseX, mouseY);
//// Draw Zoog's body
//stroke(0);
//fill(175);
//rect(0, 0, 20, 100);
//// Draw Zoog's head
//stroke(0);
//fill(255);
//ellipse(0, -30, 60, 60);
//// Draw Zoog's eyes
//stroke(0);
//fill(0);
//ellipse(-19, -30, 16, 32);
//ellipse( 19, -30, 16, 32);
//// Draw Zoog's legs
//stroke(0);
//}

//////////////////////////////Section 3///////////////////////////////////////
//Task3.1
// Using variables
// Declare and initialize two integer variables at the top of the code.
//int circleX = 100;
//int circleY = 100;
//int recX = 200;
//int recY=200;
//void setup() {
//size(480, 270);
//}
//void draw() {
//background(255);
//stroke(0);
//fill(175);
//// Use the variables to specify the locationof an ellipse.
//ellipse(circleX, circleY, 50, 50);
//fill(36,89,236);
//rect(recX,recY,100,50);
//}

////Task 3.2
//// Using system variables
//void setup() {
//size(480, 270);
//}
//void draw() {
//background(50);
//stroke(255);
//// frameCount is used to color a rectangle.
//fill(frameCount / 2);
//rectMode(CENTER);
//// The rectangle will always be in the middle of the window
//// if it is located at (width/2, height/2).
//rect(width/2, height/2, mouseX+10, mouseY+10);
//}
//void keyPressed() {
//println(key);
//}

// Varying variables
// Declare and initialize two integer variab les at the top of the code.
//void setup() {
//size(480, 270);
//}
//int circleX = 0;
//int circleY = 100;
//int cirX1 = 480;
//int cirY1 = 50;
//int cirX2 = 480;
//int cirY2 = 150;
//void draw() {
//background(255);
//stroke(0);
//fill(175);
//// Use the variables to specify the locati on of an ellipse.
//ellipse(circleX, circleY, 50, 50);
//fill(23,94,167);
//ellipse(cirX1, cirY1, 50, 50);
//fill(178,65,92);
//ellipse(cirX2, cirY2, 50, 50);
//// An assignment operation that increments the value of circleX by 1.
//circleX = circleX + 1;
//cirX1=cirX1-1;
//cirX2=cirX2-1*(5/2);
//}
//Task 3-4
// Filling variables with random values
//float r;
//float g;
//float b;
//float a;
//float diam;
//float x;
//float y;
//void setup() {
//size(480, 270);
//background(255);
//}
//void draw() {
//// Each time through draw(), new random
//// numbers are picked for a new ellipse.
//r = random(255);
//g = random(255);
//b = random(255);
//a = random(255);
//diam = random(20);
//float diam2 = random(20);
//x = random(width);
//y = random(height);
//// Use values to draw an ellipse
//noStroke();
//fill(r, g, b, a);
//println(diam);
//ellipse(x, y, diam, diam2);

//}

////Task3-5
//// Conditional from mouse
//// Three variables for the background color.
//float r = 0;
//float b = 0;
//float g = 0;
//void setup() {
//size(480, 270);
//}
//void draw() {
//// Color the background and draw lines to divide the window in quadrants.
//background(r,g,b);
//stroke(255);
//line(width/2,0,width/2,height);
//line(0,height/2,width,height/2);
//// If the mouse is on the right hand side of the window, increase red.
//// Otherwise, it is on the left hand side anddecrease red.
//if (mouseX > width/2) {
//r = r + 1;
//} else {
//r = r - 1;
//}
//// If the mouse is on the bottom of the window, increase blue.
//// Otherwise, it is on the top and decrease blue.
//if (mouseY > height/2) {
//b = b + 1;
//} else {
//b = b - 1;
//}
//if (mousePressed) {
//g = g + 1;
//} else {
//g = g - 1;
//}
//// Constrain all color values to between 0 and 255.
//r = constrain(r,0,255);
//g = constrain(g,0,255);
//b = constrain(b,0,255);
//}
