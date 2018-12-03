//Cole Miller
//Lab Assignment 3 - Screensaver
//Code used for modulo % operator was from lessson_3F_VoidSetup: 
//https://uwwtw.instructure.com/courses/57805/files/909387?module_item_id=526501

//Integers and floats for the fps count and colors created here
int fps = 60; 
int red = 0; 
float green = 0; 
float blue = 0; 

void setup () {
size(500, 500); 
background (50);
//Gray rectangle in midground to represent the "screen" 
fill (35); 
quad (25, 25, 475, 25, 475, 475, 25, 475);  
}

void draw () {
//Floats used to determine the sides of the triangle and its position
//Constrain used to keep the triangle inside of the "screen" 
float mouseXPos = constrain (mouseX, 60, 440); 
float mouseYPos = constrain (mouseY, 25, 440); 
float mouseXPos2 = lerp(mouseXPos - 35, mouseXPos + 35, .5);
float mouseXPos3 = constrain (mouseXPos2, 50, 475); 

//Frame rate keeps the rate at which the program refreshes at 60
frameRate (fps);    

//Drawing and filling the triangle that is used as the scrensaver object
fill (red, green, blue);  
triangle (mouseXPos - 35, mouseYPos, mouseXPos + 35, mouseYPos, mouseXPos3, mouseYPos + 35); 

//The blue color's number is determined by the distance the previous mouse frame was from the top left hand corner of the window
//The blue color is 30% of its original number so that it doesn't become too overwhelming
blue = dist(50, 50, pmouseX, pmouseY) * 0.3;  

//notifies the console of the current amount of each RGB color
println ("red: " + red); 
println ("blue: " + blue); 
println ("green: " + green);
}

void keyPressed () {
//Adds 25 to the red amount each time a key is pressed
//Modulo keeps the number from going too high
red = (red + 25) % 256; 
} 

void mousePressed () {
//Adds 25 to the current number green then halfs the final amount
//Modulo keeps the number from going too high 
green = (green + 25 * .5) % 256;  
}
