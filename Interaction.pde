String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}

void keyPressed() {
  if (key=='p' || key=='P') {
    
    saveToPrint = true; 
    println("saving to pdf - starting");
  }
}


void mouseReleased() {
    //lower left corner 
 
    // plantHexagon(mouseX, mouseY, 25) ;

  
}
