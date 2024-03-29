// Orbit class creates the orbit path that the paddle follows/
//it also allows you to control the paddle with the push of any key
// it draw the contour ellipse as well

class Orbit{ 
//This value specifies where in the ellipse orbit
float val;

//The speed your object moves at along the orbit
float speed = 0.05;
float x;
float y;
int WIDTH = 90;
int HEIGHT = 30;
// contour ellipse HEIGHT and WIDTH
int EWIDTH = 501;
int EHEIGHT = 501;


void update(){
  
  //Calculate x and y as values between -1 and 1
  x = sin(val);
  y = cos(val);
  
  //Multiply x and y by the ellipses width (100) and height (500)
  x *= 250;
  y *= 250;
  
  //Move the centrepoint of the ellipse orbit where you want it
  x+= width/2;
  y+= height/2;
  
  //draws the paddle with a specific style and roation applied to it (around the center ellipse pivot point)
  pushStyle();
  rectMode(CENTER);
  pushMatrix();
  translate(x, y);
  rotate(-val);
  rect(0, 0, WIDTH, HEIGHT);
  popMatrix();
  noFill();
  popStyle();
  
  //spins in one direction and in another direction when a button is pressed
  if (keyPressed == true) {
    val += speed;
  } else {
    val -= speed;
  }


  
  contourEllipse();
}

void contourEllipse() {

  ellipse(width/2, height/2, EWIDTH, EHEIGHT);
  noFill();
  strokeWeight(1);

}
}