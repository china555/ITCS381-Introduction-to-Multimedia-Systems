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

 //Hold down the button
 //Task 3-6
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
//int x = 0,y=0,speed=5,state=0;// x location of square// y location of square// speed of square
//// A variable to keep track of the squares "state."
//// Depending on the value of its state,it will either move right, down, left, or up.
//void draw() {
//background(255);
//// Display the square
//stroke(0);
//fill(175);
//rect(x,y,9,9);
//if(mouse){speed = speed*-1;mouse = false;}
//// If the state is 0, move to the right.
//if(speed>0){
//if (state == 0) {
//  x = x + speed;
//// If, while the state is 0, it reaches the right side of the window, change the state to 1
//// Repeat this same logic for all states!?
//if (x > width-10) 
//{
//x = width-10;
//state = 1;
//}
//}
//else if (state == 1) 
//{
//  y = y + speed;
//  if (y > height-10) 
//  {
//  y = height-10;state = 2;
//  }
//} 
//else if (state == 2) 
//{
//  x = x - speed;
//  if (x < 0) 
//  {
//    x = 0;state = 3;
//  }
//} 
//else if (state == 3) 
//{
//  y = y - speed;
//  if (y < 0)
//  {
//    y = 0;state=0;
//  }
//}
//}
//else{
//   if(state == 0){
//    x=x+speed; 
//      if (x < 0-10) 
//      {
//        x = 0;
//        state = 3;
//      }
     
//    }
//   else if (state == 3) 
//  {
//      y = y + speed*-1;
//      if (y > height-10) 
//      {
//        y = height-10;
//        state = 2;
//      }
//  }
//  else if(state ==2){
//    x = x+speed*-1;
//    if(x>width-10){
//      x = width-10;
//      state = 1;
//    }
//  }
//  else{
//    y = y + speed;
//    if(y<0){
//     y = 0;
//     state =0;
//    }
//  }
//}
//}
//boolean mouse=false;
//void mousePressed(){
//  mouse =true;
//}

// Task 3-9

//// Simple Gravity
//float x = 240; // x location of square
//float y = 0; // y location of square
//float speed = 0; // speed of square
//// A new variable, for gravity (i.e. acceleration).
//// We use a relatively small number (0.1)because
//// this accelerations accumulates over time, increasing the speed.
//// Try changing this number to 2.0 and see what happens.
//float gravity = 0.1;
//void draw() {
//background(255);
//// Display the square
//fill(175);
//stroke(0);
//rectMode(CENTER);
//rect(x, y, 10, 10);
//// Add speed to location.
//y = y + speed;
//// Add gravity to speed.
//speed = speed + gravity;
//// If square reaches the bottom
//// Reverse speed
//if (y > height) {
//// Multiplying by -0.95 instead of -1 slows the square
//// down each time it bounces (by decreasing speed).
//// This is known as a "dampening" effect and is a more
//// realistic simulation of the real world (without it,
//// a ball would bounce forever).
//speed = speed * -0.95;
//y = height;
//}
//println(y);
//}

//Task 3-10
// A Car class and a Car object
Car myCar =new Car(); // Declare car object as agloble variable
Car x = null;
int num = 50;
boolean cn = false;
Car[] cars = new Car[num];
void draw() {
background(255);
// Operate Car object in draw() by calling
// object methods using the dot syntax.
if(cn){
  for(int i=0;i<cars.length;i++){
    if(cars[i] != null){
     cars[i].move();
     cars[i].display();
    }else{
    break;
    }
  }
}
myCar.move();
myCar.display();
}
class Car {
// Variables.
  color c;
  float xpos;
  float ypos;
  float xspeed;
  // A constructor.
  Car() {
      c = color(175);
      xpos = width/2;
      ypos = height/2;
      xspeed = 1;
  }
  Car(int x,int y){
     this.c = color(mouseX-mouseY,56,98); 
     this.xpos = x;
     this.ypos = y;
     xspeed =2;
  }
  // Function.
  void display() {
      // The car is just a square
      rectMode(CENTER);
      stroke(0);
      fill(c);
      rect(xpos, ypos, 20, 10);
  }
  // Function.
  void move() {
      xpos = xpos + xspeed;
      if (xpos > width) {
      xpos = 0;
      }
  }
}
int count =0;
void mousePressed(){
  cn = true;
     x = new Car(mouseX,mouseY); 
 cars[count] = x;
 count++;
}

////Task 3.11
//Ball[] balls = new Ball[1]; // We startwith an array with just one element.
//float gravity = 0.1;
//void setup() {
//size(480, 270);
//// Initialize ball index 0
//balls[0] = new Ball(50, 0, 24);
//}
//void draw() {
//background(255);
//// Whatever the length of that array,
//// update and display all of the objects.
//for (int i = 0; i < balls.length; i++ ) {
//balls[i].gravity();
//balls[i].move();
//balls[i].display();}
//}
//void mousePressed() {
//// A new ball object
//Ball b = new Ball(mouseX, mouseY, 24); // Make a new object at the mouse location.
//balls = (Ball[]) append(balls, b);
//// Here, the function, append() adds an element to the end of the array.
//// append() takes two arguments. The first is the array you want to append to, and thesecond is the thing you want to append.
//// You have to reassign the result of the append() function to the original array.
//// In addition, the append() function requires that you explicitly state the type of data in the array again by putting the
//// array data type in parentheses: (Ball[]) This is known as casting.
//}
//void keyPressed(){
//    if(keyCode == 'c'||keyCode == 'C'){
//        for(Ball i :balls){
//          balls = (Ball[])shorten(balls);
//        }
//      }
//  }
