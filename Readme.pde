/*
Name : Dale Healy Egan
Student Number: 20066529

Brief description of the animation achieved: 
The animation I achieved was a user controlled rocket which uses a combination of processing methods using the mouseX and mouseY coordinates.
Before the animation starts the user will be asked to type in his full name and the name of the rocket.
The goal of the rocket is to reach the top left hand corner of the screen (moon) and then press the left mouse button to land the rocket.
Once the rocket lands, a new overlay will appear with an image of earth in the lower right hand corner with stars flicker in the background and the moon appearing 
much larger.
Once the user is on the moon they are prompted to right click on the mouse to take a screenshot.
While the user is controlling the rocket they will be advised which stage of flight the rocket has reached with the help of a text box.
There is also a text box which shows the user the distance they are from earth.


Known bugs/problems: 
When I added the nested if statement to a boolean on **LINE 37** when calling a method it caused the top left hand corner of the window not to work correctly.
That area of the screen doesn't draw over it. It just draws the shape multiple times until the mouse comes away from this area. 

If I keep hitting cancel on the JOptionPane at the start whole program crashes.

**LINE157** ! operator doesn't work as intended. I wanted the text to dissapear when the mouse landed on the area. Text just stays on screen until next overlay appears.

I also had a problem with my processing app constantly crashing which made me go to my backup multiple times. I don't know if this is an known issue with processing 
on M1 macbooks.


Any sources referred to during the development of the assignment:

Creating stars in Processing (April 12th 2015) YouTube video, added by Username of uploader [James Coffey]. Available at URL https://www.youtube.com/watch?v=UVXlrBwlp80&ab_channel=JamesCoffey [10/02/2021]

*/
