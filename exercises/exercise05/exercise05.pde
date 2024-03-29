// Particle system with an array

//calls the  particlenorm class to index particles into an array
Particlenorm[] particlenorm = new Particlenorm[500];
Particleattach[] particleattach = new Particleattach[5];

void setup() {
  size(1920,1080);
  
  //loops through the array in order to instantiate the norm and attach particles
  for (int i = 0; i < particlenorm.length; i++){
    particlenorm[i] = new Particlenorm();
  }
  
  for (int i = 0; i < particleattach.length; i++){
    particleattach[i] = new Particleattach();
  }
}


void draw() {
  background(230,230,230);
  
  //loops through the array again to call the update and display function of the particles
  for (int i = 0; i < particlenorm.length; i++){
    particlenorm[i].update();
    particlenorm[i].display();
  }
  
  for (int i = 0; i < particleattach.length; i++){
    particleattach[i].update();
    particleattach[i].display();
    
    //loops again to call the nextToNormal function which draws a line between normal and attach particles
    for (int j = 0; j < particlenorm.length; j++) {
      particleattach[i].nextToNormal(particlenorm[j]);
    }
  }
}