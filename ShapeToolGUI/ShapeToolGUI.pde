ShapeSystem shapeSystem;

void setup(){
  size(512, 512);
  frameRate(6);
  background(219);
  shapeSystem = new ShapeSystem();
  //shapeSystem.createDummyBaseShape(20);
}
boolean click = false;
boolean clear = false;
boolean rec = false;
boolean cir = false;

void draw(){
  // TODO: Reset background and draw the shapes
  stroke(0);
  fill(255);
      shapeSystem.render();
  fill(255);
  rect(10,10,70,40,7);
  rect(120,10,70,40,7);
  
  rect(10,80,80,40,7);
  rect(120,80,70,40,7);
  
  rect(400,10,70,40,7);
  textSize(16);
   fill(0);
  text("Generate", 10, 35);
  text("Clear", 130, 35);
  text("Rectangle", 10, 105);
  text("Circle", 130, 105);
   text("Delete", 410, 35);
  noStroke();
  if(click == true){
    fill(255);
    stroke(0);
      click = false;
      shapeSystem.createDummyAnyShape(40);
  }
  if(clear == true){
    shapeSystem.removeAllShapes();
    background(219);
    clear = false;
  }
  
}
void mousePressed() {
  stroke(0);
  fill(255);
  if (mouseX > 10 && mouseX < 70 && mouseY >10 && mouseY < 50) {
    click  = true;
  } else if(mouseX > 120 && mouseX < 190 && mouseY >10 && mouseY < 50 ) {
    clear = true;
  }else if(mouseX > 10 && mouseX < 80 && mouseY >80 && mouseY < 120){
    shapeSystem.addRectangle();
    shapeSystem.render();
  }else if(mouseX > 120 && mouseX < 190 && mouseY >80 && mouseY < 120){
    shapeSystem.addCircle();
  }
  else if(mouseX > 400 && mouseX < 480 && mouseY >10 && mouseY < 50){
    println(mouseX,mouseY);
    shapeSystem.removeLastShape();
     background(219);
  }
}
void keyPressed(){
  if ( key == 's' ){
    save ("outputImage.png");
    shapeSystem.doSaveJSONArray("outputData");
  }
  if ( key == 'l' )
  {
    shapeSystem.doLoadJSONArray("outputData");
  }
}
