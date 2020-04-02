void setup() {
size(480, 270);
}

//Task 3-5
//// Conditional from mouse
//// Three variables for the background color.
//float r = 0;
//float b = 0;
//float g = 0;
//void draw() {
//// Color the background and draw lines to divide the window in quadrants.
//background(255,255,255);
//stroke(255);
//line(width/2,0,width/2,height);
//line(0,height/2,width,height/2);
//fill(r,g,b);
//if(mouseX<width/2&&mouseY<height/2){
//rect(0,0,width/2,height/2);
//}
//else if(mouseX>width/2&&mouseY<height/2){
//  rect(width/2,0,width/2,height/2);
//}
//else if(mouseX<width/2&&mouseY>height/2){
//  rect(0,height/2,width/2,height/2);
//}
//else{
//  rect(width/2,height/2,width/2,height/2);
//}

//// If the mouse is on the right hand side of the window, increase red.
//// Otherwise, it is on the left hand side anddecrease red.
//if (mouseX > width/2) {
//  r = r + 1;
//} else {
//  r = r - 1;
//}
//// If the mouse is on the bottom of the window, increase blue.
//// Otherwise, it is on the top and decrease blue.
//if (mouseY > height/2) {
//  b = b + 1;
//} else {
//  b = b - 1;
//}
//// If the mouse is pressed (using the systemvariable mousePressed)
//if (mousePressed) {
//  g = g + 1;
//} else {
//  g = g - 1;
//}
//  // Constrain all color values to between 0 and 255.
//  r = constrain(r,0,255);
//  g = constrain(g,0,255);
//  b = constrain(b,0,255);
//}
//void mousePressed() {
//println(mouseX+" "+mouseY);
//}

// Hold down the button
// Task 3-6
//boolean button = false;
//int x = 50;
//int y = 50;
//int w = 100;
//int h = 75;

//void draw() {
//// The button is pressed if (mouseX,mouseY) is inside the rectangle and mousePressed is true.
//if (mouseX > x && mouseX < x+w && mouseY > y &&
//mouseY < y+h && mousePressed&&button !=true) {
//  button = true;
//}
//else if(mouseX > x && mouseX < x+w && mouseY > y &&
//mouseY < y+h && mousePressed) {
//  button = false;
//}
//if (button) {
//background(255);
//stroke(0);
//} else {
//background(0);
//stroke(255);
//}
//fill(175);
//rect(x,y,w,h);
//}
//Task3-7

//int x = 0;
//int speed = 2;
//int y=0;
//int speed2 = 3;

//void draw() {
//background(255);
//// Add the current speed to the x location.
//x = x + speed;
//y=y+speed2;
//if ((y > height) || (y < 0)) {
//// If the object reaches either edge, multiply speed by -1 to turn it around.
//speed2 = speed2 * -1;
//}
//// Remember, || means "or."
//if ((x > width) || (x < 0)) {
//// If the object reaches either edge, multiply speed by -1 to turn it around.
//speed = speed * -1;
//}
//if(mouse){
// z=z+speed3;
//    if(z>width||z<0){
//      speed3 *=-1;
//    }
//   fill(45,123,145);
//   triangle(0+z,260,55+z,260,30+z,200);
//}

//// Display circle at x location
//stroke(0);
//fill(175);
//ellipse(x,100,32,32);
//fill(175,3,45);
//ellipse(240,y,32,32);
//}
//boolean mouse = false;
//int z=0,speed3=5;
//void mousePressed(){
//  mouse =true;
//}


//Task3.8
// Square following edge, uses a state variable
int x = 0,y=0,speed=5,state=0;// x location of square// y location of square// speed of square
// A variable to keep track of the squares "state."
// Depending on the value of its state,it will either move right, down, left, or up.
void draw() {
background(255);
// Display the square
stroke(0);
fill(175);
rect(x,y,9,9);
if(mouse){speed = speed*-1;mouse = false;}
// If the state is 0, move to the right.
if (state == 0) {
  x = x + speed;
// If, while the state is 0, it reaches the right side of the window, change the state to 1
// Repeat this same logic for all states!?
if (x > width-10) 
{
x = width-10;
state = 1;
}
}
else if (state == 1) 
{
  y = y + speed;
  if (y > height-10) 
  {
  y = height-10;state = 2;
  }
} 
else if (state == 2) 
{
  x = x - speed;
  if (x < 0) 
  {
    x = 0;state = 3;
  }
} 
else if (state == 3) 
{
  y = y - speed;
  if (y < 0)
  {
    y = 0;state=0;
  }
}
}
boolean mouse=false;
void mousePressed(){
  mouse =true;
}
