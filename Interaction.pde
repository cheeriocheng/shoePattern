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
    println("x: "+mouseX + "y: "+ mouseY);
    if (mouseButton == LEFT){

        if (mouseX > 50 && mouseX < 140 && mouseY > 50 && mouseY < 140) {
            initParticles();
            return;
        }

        //substitute a pair of points with the ones where mouse is
        int i = floor(random(0, particles.length/2));
        float r = random(2,3);
        float d = mouseX - pg.width/2 ;
        if (abs(d) < 10){
            particles[2*i]. x = 0;
            particles[2*i]. y= mouseY -pg.height/2 - d;

            particles[2*i+1]. x = 0;
            particles[2*i+1]. y= mouseY -pg.height/2 +d;

        }else{
            particles[2*i]. x = mouseX -pg.width/2;
            particles[2*i]. y= mouseY -pg.height/2;
            particles[2*i+1].x = - mouseX + pg.width/2;
            particles[2*i+1].y = mouseY -pg.height/2;
        }
    } else if (mouseButton == RIGHT){
        //move the dots in proximity or the right mouse click
        cl.delete(mouseX-pg.width/2,mouseY -pg.height/2, 5); //distance 
    }
}
