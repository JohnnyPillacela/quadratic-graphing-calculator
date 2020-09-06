color graph = color(#000000);      //Color for the graph: Black
color wfont = color(#FF0303);      //Color for the word font: White
float x1;
float y1;
float x2;
float y2;
float px1;
float py1;
float px2;
float py2;
int aValue;
int bValue;
int cValue;
float xo = 0;
float yo = 0;
float zoom = 1;
float angle = 0;

void setup() {
  size(1000, 600);      //Sets the size of the graph
  smooth();
  noStroke();
}

int xpos = 660;          //initial x-position 
int ypos = 100;          //initial y-position
void draw() {
  background(255);      //sets the background
  grid();                
  display();
  screen();
  fill(0, 0, 0);      
  userInput();
  fill(0, 0, 0);
  textSize(28);                //Sets the size of the letters being displayed
  text("X-Intercept Coordinates", 620, 450);
  text(aValue, 670, 195);      //Displays the value of A
  text(bValue, 670, 295);      //Displays the value of B
  text(cValue, 670, 395);      //Displays the value of C
  graph();
  interceptBoxes();
  zeros();
}

void graph() {
  if (mouseX>=0 && mouseX<=1000 && mouseY>=0 && mouseY<=600) {            //      1.  If the mouse is inside certain cordinates this will execute
    for (int x = 0; x <= 30; x++) {                                       //      2.  Sets an x-counter up to 30 wich is also the maximum positive x-cordinate
      x1 = ((x+30)*10);                                                   //      3.  Sets the x-coordinate
      y1 = (30-((aValue*(x*x))+(bValue*x)+(cValue)))*10;                  //      4.  Sets the y-coordinate
      px1 = (((x-1)+30)*10);                                              //      5.  Makes x-value one value less
      py1 = (30-((aValue*((x-1)*(x-1)))+(bValue*(x-1))+(cValue)))*10;     //      6.  Makes y-value one value less
      fill(255, 3, 49);
      ellipse(x1, y1, 2.5, 2.5);                                          //      7. Plots the coordinate
      line(x1, y1, px1, py1);                                             //      8. Adds a line between the previous and present coordinate values
    }
    for (int x = 0; x >= -30; x--) {
      x2 = ((x+30)*10);
      y2 = (30-((aValue*(x*x))+(bValue*x)+(cValue)))*10;
      px2 = ((x+1)+30)*10;
      py2 = (30-((aValue*((x+1)*(x+1)))+(bValue*(x+1))+(cValue)))*10;
      //println("("+x+", " + y+")");
      fill(255, 3, 49);
      ellipse(x2, y2, 2.5, 2.5);
      line(x2, y2, px2, py2);
    }
  }
}
///////////////////Grid///////////////////

void grid() {                                         //makes the graph and the grid you see in the program
  translate(xo, yo);               
  scale(zoom);
  stroke(220);
  for (int i = 0; i <= 600; i = i + 10) {
    line(i, 0, i, 600);                               //makes lines vertically
  }
  for (int j = 0; j <= 600; j = j + 10) {
    line(0, j, 600, j);                               //makes line horizontally
  }
  stroke(graph);
  line(0, 300, 600, 300);
  stroke(graph);
  line(300, 0, 300, 600);
  int xAxis = 293;
  int yAxis= 310;
  int nxAxis = 295;
  for (int num = 5; num <= 30; num+=5) {
    xAxis+=50;
    fill(0);
    textSize(10);
    text("0", 302, 310);
    text(num, xAxis, yAxis);
  }
  for (int num = -5; num >= -30; num-=5) {
    nxAxis-=50;
    fill(0);
    textSize(10);
    text(num, nxAxis, yAxis);
  }
  int nxAxis2 = 285;
  int yAxis2= 307;
  int xAxis2 = 290;
  int nyAxis2 = 302;
  for (int num = 5; num <= 30; num+=5) {
    yAxis2-=50;
    fill(0);
    textSize(10);
    text(num, xAxis2, yAxis2);
  }
  for (int num = -5; num >= -30; num-=5) {
    nyAxis2+=50;
    fill(0);
    textSize(10);
    text(num, nxAxis2, nyAxis2);
  }
  text("0", 302, 310);
}

/*  
 -------------------------------------------------
 -------------------------------------------------
 Color, Display, and Title  
 */
int Rvalue = 200;                             //initial value for R in RGB
int counter = 0;                              //counter for the color loop
void display() {
  counter++;
  if (counter<200) {
    Rvalue--;
  } else if (200<=counter && counter<400) {
    Rvalue++;
  }
  if (counter==399) {
    counter=counter-399;
  }
  fill(Rvalue, 255, 255);
  rect(600, 0, 400, 600);
  fill(255, 3, 3);
  textSize(20);
  //text("The ALL in One", 740, 40);
  text("BASIC Graphing Calculator", 690, 40);                       //On-screen instructions
  text("Using f(x)=Ax^2+Bx+C!", 700, 60);
  text("Instructions: You can change the values ", 605, 95 );
  text("by clicking on the arrow next to the box ", 605, 115 );
}
//------------------------------------------------
//------------------------------------------------

void screen() {
  /*fill(#ffffff);
   rect(650, 80, 300, 100);*/
  text("A-value:", 660, 150);  //Displays A value
  text("B-value:", 660, 250);  //Displays B value
  text("C-value:", 660, 350);  //Displays C value
  fill(#ffffff);
  rect(660, 160, 200, 50);     //Input box for A value
  rect(660, 260, 200, 50);     //Input box for B value
  rect(660, 360, 200, 50);     //Input box for C value
}
void keyPressed()
{
  if (key ==CODED) {
    if (keyCode == UP) {
      zoom += 0.3;
    } else if (keyCode== DOWN) {
      zoom -= 0.3;
    }
  }
  if (key == ' ') {
    zoom =1;
    xo=0;
    yo=0;
  }
}


void mousePressed() {
  if (mouseX>=865 && mouseX<=885 && mouseY>=160 && mouseY<=180) {          //For value of A only this if stament will execute and increase A's value 
    mouseClicked();
    {
      aValue = aValue + 1;
    }
  }
  if (mouseX>=865 && mouseX<=885 && mouseY>=190 && mouseY<=210) {          //For value of A only this if stament will execute and decrease A's value
    mouseClicked();
    {
      aValue = aValue - 1;
    }
  }

  if (mouseX>=865 && mouseX<=885 && mouseY>=260 && mouseY<=280) {          //For value of B only this if stament will execute and increase B's value 
    mouseClicked();
    {
      bValue = bValue + 1;
    }
  }
  if (mouseX>=865 && mouseX<=885 && mouseY>=290 && mouseY<=310) {          //For value of B only this if stament will execute and decrease B's value
    mouseClicked();
    {
      bValue = bValue - 1;
    }
  }

  if (mouseX>=865 && mouseX<=885 && mouseY>=360 && mouseY<=380) {          //For value of C only this if stament will execute and increase C's value 
    mouseClicked();
    {
      cValue = cValue + 1;
    }
  }
  if (mouseX>=865 && mouseX<=885 && mouseY>=390 && mouseY<=410) {          //For value of C only this if stament will execute and decrease C's value
    mouseClicked();
    {
      cValue = cValue - 1;
    }
  }
}

void interceptBoxes() {
  fill(255, 255, 255);
  rect(630, 460, 145, 45);
  rect(820, 460, 155, 45);
}

void zeros() {
  float xSqrt = sqrt((bValue*bValue)-(4*aValue*cValue));          
  float xInt1 = (-bValue+xSqrt)/(2*aValue);                  //Finds the x-intercept
  String int1 = nfc(xInt1, 3);                               //rounds the x-intercept to 3 decimals
  float xInt2 = (-bValue-xSqrt)/(2*aValue);                  //Find the other x-intercept
  String int2 = nfc(xInt2, 3);                               //rounds the other x-intercept to 3 decimals
  if (Float.isNaN(xSqrt) == true) {                          //if the variable "xSqrt" is "not a number" then it will display "Imaginary #"
    fill(0, 0, 0);
    textSize(23);
    text("Imaginary #", 635, 490);
    text("Imaginary #", 825, 490);
  } else {
    fill(0, 0, 0);
    textSize(23);
    text("(" + int2 + ", 0)", 640, 490);
    text("(" + int1 + ", 0)", 835, 490);
  }
}

void userInput() {
  fill(0, 0, 0);
  triangle(865, 180, 875, 160, 885, 180);      //Increase arrow for A-value
  triangle(865, 190, 875, 210, 885, 190);      //Decrease arrow for A-value

  triangle(865, 280, 875, 260, 885, 280);      //Increase arrow for B-value
  triangle(865, 290, 875, 310, 885, 290);      //Decrease arrow for B-value

  triangle(865, 380, 875, 360, 885, 380);      //Increase arrow for C-value
  triangle(865, 390, 875, 410, 885, 390);      //Decrease arrow for C-value
}
