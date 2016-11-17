/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/6888*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
//import processing.opengl.*;
//import processing.video.*;
import processing.pdf.*;
import java.util.Calendar;
Global global; //always create the global variable before using any of the default classes (created by Don)


PApplet pg;
//PGraphics pg;
PFont font;
//MovieMaker mm;
PShape shoeOutline; 

boolean saveToPrint = false;

boolean RENDERING = true;
boolean RECORDING = false;
boolean CLOCKING = true;
boolean WORKING = true;

int timer = 0;

float rx = 0;
float rz = 0;
float trx = 0;
float trz = 0;


int totalParticles = 300 ;  //odd number
Particle[] particles = new Particle[totalParticles];
Particle puller,pusher;
Cloud cl;
Delaunay de;
Voronoi vo;

boolean click = false;

void setup(){
  //initialize stage
  size(800,900,P3D);
  pg = this;
  //pg = createGraphics(3000,3000,P3D);
  pg.background(255);
  //if(RECORDING){ frameRate(24); }
  font = loadFont("ArialMT-18.vlw");
  textFont(font,18);
  textAlign(CENTER,CENTER);
  //initialize global
  global = new Global(pg.width,pg.height,pg.height);
  global.init();
  //initialize moviemaker
  //if(RECORDING){ mm = new MovieMaker(pg,global.w,global.h,"mov.mov",24,MovieMaker.JPEG,MovieMaker.HIGH); }
  shoeOutline =  loadShape("outline.svg");
  initParticles();
}

void initParticles(){

  //initialize sketch
  for(int i=0;i<particles.length/2;i++){
    float x =random(pg.width)-pg.width/2; 
    float y = random(pg.height)-pg.height/2;
    float r = random(2,3);
    particles[2*i] = new Particle(x,y,0,r,true);
    particles[2*i+1] = new Particle(-x,y,0,r,true); 
    
  }
  cl = new Cloud(particles);
  de = new Delaunay(particles,global.circumscribed_face);
  vo = new Voronoi(de);


}
void draw(){
   render();
}

void render(){
  rx += (trx-rx)*.05;
  rz += (trz-rz)*.05;

  if(RENDERING){
    pg.background(200);

    pg.pushMatrix();
    pg.translate(global.w/2,global.h/2,0);
    pg.rotateX(rx);
    pg.rotateZ(rz);
    pg.stroke(0,100);
    pg.fill(255);
  //  particles[0].move_to(pg.mouseX-global.w/2,pg.mouseY-global.h/2,0);
    // cl.wander();
    cl.repel();
    cl.step();
    de.synchronize();
    vo.synchronize();

   if (saveToPrint) {
      beginRecord(PDF, timestamp()+".pdf");
    }
    
      vo.render();
     cl.render();
        if (saveToPrint) {
      saveToPrint = false;
      println("saving to pdf – finishing");
      endRecord();
      println("saving to pdf – done");
    }
 
    pg.popMatrix();
       // image output


  }

  shape(shoeOutline,-50,-40);
    

  if(CLOCKING&&frameCount%100==0){
    println(100/((millis()-timer)/1000.0f));
    timer = millis();
  }
  //if(RECORDING){ mm.addFrame(); }
}




