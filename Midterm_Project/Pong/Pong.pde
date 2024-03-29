//Lonely Singleplayer Pong 1.0
//
//The player plays pong with himself with a paddle that orbits
//on an elliptical path. The player must keep the ball in the ellipse.
//The player controls the paddle by pressing any key on the keyboard. 
//The paddle will always be in motion. Press any key to make the paddle go in the 
//opposite direction.
// 
// The score is tracked through another ellipse in the center that grows incrementally
// each time the ball resets. DONT LET THE OTHER ELLIPSE GROW TO THE SAME SIZE AS THE
// ORIGINAL ELLIPSE. IF you do, you lose the game.


// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;
Orbit orbit;
Score score;

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;

// The background colour during play (grey)
color backgroundColor = color(150);


// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(640, 640);

  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  //leftPaddle = new Paddle(PADDLE_INSET, height/2, '1', 'q');
  //rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p');

  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/2);
  
  // create orbital movement at the centre of the screen
  orbit = new Orbit();
  
  // create the score tracker at the center of the screen
  score = new Score();
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {
  // Fill the background each frame so we have animation
  background(backgroundColor);

  // Update the paddles and ball by calling their update methods
  //leftPaddle.update();
  //rightPaddle.update();
  ball.update();

  // Check if the ball has collided with either paddle
  //ball.collide(leftPaddle);
  //ball.collide(rightPaddle);
  //Checks if the ball has collided with the orbit paddle
  ball.collideOrbit(orbit);

  // Check if the ball has gone off the screen
  /*if (ball.isOffScreen()) {
    // If it has, reset the ball
    ball.reset();
  }*/

  // Display the paddles and the ball
  //leftPaddle.display();
  //rightPaddle.display();
  ball.display();
  
  //display the orbital paddle and its contour ellipse
  orbit.update();
  orbit.contourEllipse();
  
  //keeps the score count and displays when you win or lose
  score.update();
}

// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

/*void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
}*/

// keyReleased()
//
// As for keyPressed, except for released!

/*void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}*/