/* The animation is a rocket using the mouseX and mouseY coordinates. The goal of the animation is to drag the mouse to the
 mouse in the top left of the screen*/


import javax.swing.JOptionPane;


void setup() {
  size(1280, 720); // Sizing the window

  /*Using a JOptionPane to take inputs from string variables. The name of the rocket, the name of the pilot and legnth of the rocket name.
   User input was taken in by a String using showInputDialog then displayed using a showMessageDialog */


  String instructions = " Use the mouse to guide the rocket to the moon.\n Once the mouse is hovering over the moon left click on your mouse.\n Right click on the moon to take a screenshot.\n Spin the mouse wheel real quick when moving the mouse to activate turbo.";
  JOptionPane.showMessageDialog(null, instructions.toUpperCase());
  String pName = JOptionPane.showInputDialog("Please enter the name of the pilot: "); 
  String rName = JOptionPane.showInputDialog("Please enter the name of your rocket: "); 
  JOptionPane.showMessageDialog(null, " Hi "+ pName.toUpperCase() + " The name of the rocket is: "
    + rName + "\nYour goal is to fly " 
    + rName.toLowerCase() + " to the moon\nThis is how many characters long your rocket name is " 
    + rName.length());
}



void draw() {

  /*Using a boolean to see whether the condition is true or false. When the boolean is false this mean the old
   overlay should appear. When the boolean is true the new overlay should appear*/

  boolean onTheMoon = false; // Declaring boolean false so the drawbackground will be active until condition is met
  if ((mouseX > 50) && (mouseX < 150) && (mouseY > 50) && (mouseY < 150)) { // When the condition is met the boolean is TRUE.
    onTheMoon = true;
  }
  if (onTheMoon) {
    if (mouseButton == LEFT) { // When the boolean is true the left click on the mouse will become active.
      moonLanding(); // Calling the moon landing method. Method can be found on **LINE 86**.
    }
  } else {
    drawBackground(); //This is the background image for the rocket. Method can be found on **LINE 61**.
  }
  rocketShip(); // Calling the rocketShip method. Method can be found on **LINE 132**
}



void drawClouds(int x, int y, int grey) { // Bespoke method taking in X, Y and color value. The method is used for animating clouds.

  //Method used for creating the cloud formation. seen on the first overlay drawBackground().

  fill(grey); //Using grayscale
  circle(x, y, 50); //Left circle
  circle(x+25, y-25, 50); //Bottom circle
  circle(x+50, y, 50); // Top circle
  circle(x+25, y+25, 50); //Right circle
}



void drawBackground() { 

  // Method created for the background design. Includes the clouds, moon and the color shading in the background

  float blue = 0; // Using this variable to help shade the black to blue.

  for (int y = 0; y < height; y += 50) { // Nested for loop consisting of squares for background color.
    for (int x = 0; x < width; x += 50) { 
      fill(0, 0, blue); // Variable 'blue' in RGB value.
      noStroke(); // Removing the borders from the grid
      square(x, y, 50); //
      blue += 0.5; // The counter for the variable 'blue' to increment a count of 0.5 every time the for loop ran.
    }
  }
  for (int i = 50; i <= 400; i+=50) { // Method call from for loop to extend cloud size and keeping clouds consistent in size and length.
    drawClouds(350+i, 600, 255); // CLoud top right
    drawClouds(25+i, 400, 255); // Cloud on left 
    drawClouds(600+i, 400, 255); // Cloud on right
  }
  fill(150);
  circle (100, 100, 150); // Circle (moon) located in the top left corner.
}



void moonLanding() { 

  /*Creating the second overlay for the animation. Completely replaces the first background.
   This method contains stars, earth, moon and a text field to congratulate user when they reach moon
   With instructions on how to take a screenshot*/

  background(0); 
  starsInSky(100); //Method call for starsInSky(). Method can be found on **LINE 115**
  fill(0, 0, 255);
  circle (900, 600, 300); // Creating planet earth. (Located in lower right of screen)
  fill(0, 255, 0);
  circle (900, 500, 7); //Small green Island one
  circle (875, 480, 7); //Small green Island two
  circle (845, 470, 7); //Small green Island three
  circle (950, 470, 15); //Small green Island four
  circle (1000, 580, 15); //Small green Island five
  for (int i=10; i < 100; i +=10) { // Big green area on planet earth. 
    circle (800+i, 560+i+10, 60+i);
  }
  fill(0, 255, 0);
  textSize(40);
  text("YOU HAVE LANDED ON THE MOON!", 500, 300);  
  text("RIGHT CLICK ON YOUR MOUSE TO TAKE A PHOTO!", 250, 400); // Text appears when moonLanding() method is called.
  fill(#B9B6B6);
  circle (100, 100, 400); // When the mouseX and mouseY value touch the moon it will increase in size. Here I have changed the size and nothing else.
}



void starsInSky(int s) { 

  /*Method takes in a variable which determines how many stars are drawn on the background. 
   The method is called at **LINE 93**.  */

  int i =0;
  while (i<s) { // While loop used for drawing stars 
    fill(255);
    circle(random(1280), random(720), 2); // Using the 'random' processing feature to produce stars randomly on the screen. 
    i++;
  }
}





void rocketShip() {

  /*The rocketShip method contains the rocket which is controlled by the mouse.  It also contains the text on screen to indicate which phase
   the rocket has entered during it flight. I took in 4 string values so I could modify them using the text method to display to the user in either Upper case or lower case*/

  String rocketPhase1 = "LIFT OFF!"; 
  String rocketPhase2 = "POWERED ASCENT";
  String rocketPhase3 = "coasting ascent!";
  String rocketPhase4 =  "left click on your mouse when you are over the moon!";

  if (mouseY > height-200) { // Using the height variable minus a value to help with sizing the window into seperate areas.
    textSize(50); // TextSize method to size the text on the screen to ensure the user can see the words correctly. 
    fill(0, 255, 0);
    text(calculateDistance(0) + " Miles from Earth", 650, 100); //CalculateDistance method can be located on **LINE 179**
    text(rocketPhase1.toLowerCase(), 700, 300); // Text method used to show which part of the flight stage the rocket is in.
  } else if (mouseY >= height-350) {
    fill(0, 255, 0);
    textSize(50);
    text(calculateDistance(1) + " Miles from Earth", 650, 100);
    text(rocketPhase2.toLowerCase(), 700, 300);
  } else if (mouseY >= height-500) {
    fill(0, 255, 0);
    textSize(50);
    text(calculateDistance(2) + " Miles from Earth", 650, 100);
    text(rocketPhase3.toUpperCase(), 700, 300);
  } else if (!((mouseX > 50) && (mouseX < 150) && (mouseY > 50) && (mouseY < 150))) {  // Using the ! operator to display text until rocket hits the condition.
    fill(0, 255, 0);
    textSize(50);
    text(calculateDistance(3) + " Miles from Earth", 650, 100);
    textSize(40);
    text(rocketPhase4.toUpperCase(), 20, 300);
  }

  // This is where I created the rocket animation. I used the mouseX and mouseY coordinates to combine shapes so they all moved simultaneously. 
  fill(255, 0, 0);
  circle(mouseX+5, mouseY+25, 50); // This is the head of the rocket
  fill(255, 0, 0);
  triangle(mouseX+250, mouseY+50, mouseX+300, mouseY-50, mouseX+100, mouseY+50); // This is the tail of the rocket.
  fill(255);
  rect(mouseX, mouseY, 200, 50); // This is the body of the rocket
  fill(0);
  rect(mouseX-15, mouseY+8, 15, 11); // This is cockpit of the rocket
  fill(0);
  textSize(30);
  text("SpaceX", mouseX+40, mouseY+30); // Text used for displaying text on the rocket
}

int calculateDistance(int c) { // Using a return method to calculate the distance from space. Method called from **LINE 145** **LINE 150** **LINE 155** **LINE 160**
  return c * 100000; // Returning the c value once the calculation is performed
}



void mouseMoved() { 

  /*Demonstrating the mouseMoved method to create a flame effect on the back of the rocket when the mouse is moved. 
   I also used the mouseX and mouseY feature so the flames would combine with the rest of the rocket. */

  fill(#FC8F08);
  triangle(mouseX+500, mouseY+15, mouseX+300, mouseY-50, mouseX+250, mouseY+50); // This is the orange flame on the back of the rocket when moving.
  fill(#F8FC08);
  triangle(mouseX+500, mouseY+15, mouseX+300, mouseY-30, mouseX+270, mouseY+20); //This is the yellow flame on the back of the rocket when moving.
}



void mouseClicked() { 
  if (mouseButton == RIGHT) { // Right click method used to take a screenshot.
    saveImage();
  }
}



void mouseWheel() { //When the mouse wheel is moved quickly the flame will start appearing red.
  triangle(mouseX+500, mouseY+15, mouseX+300, mouseY-50, mouseX+250, mouseY+50); // When spinning the mouse wheel a red color will appear. Overlapping the previous roclet flame.
  fill(255, 0, 0);
  triangle(mouseX+500, mouseY+15, mouseX+300, mouseY-30, mouseX+270, mouseY+20); // This is similar to the one above just a smaller flame.
  fill(255, 0, 0);
}



void saveImage() { // saveImage method called on **LINE 200**
  save("OnTheMoon.PNG");
}
