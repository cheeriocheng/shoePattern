String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}

void keyPressed() {
  if (key=='p' || key=='P') {
    
    saveToPrint = true; 
    println("saving to pdf - starting");
  }else if (key=='r' || key=='R') {
    
    initParticles();
  }
}


void mouseReleased() {
    //lower left corner 
    int i = floor(random(0, particles.length/2));
   
    float r = random(2,3);

    particles[2*i]. x = mouseX -pg.width/2;
    particles[2*i]. y= mouseY -pg.height/2;
    // particles[2*i+1] = new Particle(-mouseX,mouseY,0,r,true); 

    
}
