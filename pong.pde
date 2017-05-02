PFont font;
float BallCenterX = 600;
float BallCenterY = 400;
float BallFrontEdge = (BallCenterX-8);
float BallBackEdge = (BallCenterX+8);
float RedPaddleCenterX = 100;
float RedPaddleCenterY = 400;
float RedPaddleFrontEdge = (RedPaddleCenterX+26); 
float BluePaddleCenterX = (1400-100);
float BluePaddleFrontEdge = (BluePaddleCenterX-26); 
float BallSpeed = 18;
float PaddleSpeed = 9;
float direction = 1;
float Ydirection = 1;
int BlueScore = 0;
int RedScore = 0;

void setup() {
  size(1400,800);
  smooth();
  rectMode(RADIUS);
  textSize(10);
  font = loadFont("Impact-48.vlw");
  textFont(font);
}
  void draw() {
    background(0);
    BallCenterX += BallSpeed*direction;
    BallCenterY += BallSpeed*Ydirection;
    fill(205,205,205);
    noStroke();
    //center circle
    ellipse(700,400,350,350);
    fill(0);
    ellipse(700,400,338,338);
    fill(205,205,205);
    
    //outer box
    rect(700,400,6,(height/2)-40);
    rect(100,400,6,(height/2)-40);
    rect(1300,400,6,(height/2)-40);
    rect(700,40,(width/2)-94,6);
    rect(700,height-40,(width/2)-94,6);
    
    //Goals
    rect(6,400,6,200);
    rect(width-6,400,6,200);
    rect(53,200,53,6);
    rect(width-53,200,53,6);
    rect(53,600,53,6);
    rect(width-53,600,53,6);
    //ball
    fill(255,255,255);
    ellipse(BallCenterX,BallCenterY,26,26);
    //Ball Fade
    fill(255*.9,255*.9,255*.9);
    ellipse(BallCenterX-(direction*BallSpeed)/2.5,BallCenterY-(Ydirection*BallSpeed)/4,25,25);
    fill(255*.8,255*.8,255*.8);
    ellipse(BallCenterX-((2*direction*BallSpeed)/2.5),BallCenterY-((2*Ydirection*BallSpeed)/2.5),25,25);
    fill(255*.7,255*.7,255*.7);
    ellipse(BallCenterX-((3*direction*BallSpeed)/2.5),BallCenterY-((3*Ydirection*BallSpeed)/2.5),25,25);
    fill(255*.6,255*.6,255*.6);
    ellipse(BallCenterX-((4*direction*BallSpeed)/2.5),BallCenterY-((4*Ydirection*BallSpeed)/2.5),25,25);
    fill(255*.5,255*.5,255*.5);
    ellipse(BallCenterX-((5*direction*BallSpeed)/2.5),BallCenterY-((5*Ydirection*BallSpeed)/2.5),25,25);
    fill(255*.4,255*.4,255*.4);
    ellipse(BallCenterX-((6*direction*BallSpeed)/2.5),BallCenterY-((6*Ydirection*BallSpeed)/2.5),25,25);
    //Goal restriction
    if(BallCenterX <25){
      BallCenterX = 700;
      BallCenterY = 400;
      direction = -direction;
      BlueScore = BlueScore+1;
    }
    if(BallCenterX>width-25){
      BallCenterX = 700;
      BallCenterY = 400;
      direction = -direction;
      RedScore = RedScore+1;
    }
    //Red Paddle restriction
    if ((BallCenterX-13 < RedPaddleFrontEdge)&&(BallCenterY < RedPaddleCenterY+80)&&(BallCenterY > RedPaddleCenterY-80)){
      direction = -direction;//(sin(((RedPaddleCenterY-BallCenterY)/80)*90));
      Ydirection = -((RedPaddleCenterY-BallCenterY)/80);//(cos(((RedPaddleCenterY-BallCenterY)/80)*90));
    }
    //Blue Paddle restriction
    if((BallCenterX+13 > BluePaddleFrontEdge)&&(BallCenterY < mouseY+80)&&(BallCenterY > mouseY-80)){
      direction = -direction;//(sin(((mouseY-BallCenterY)/80)*90));
      Ydirection = -((mouseY-BallCenterY)/80);
    }
    //Arena restrictions
    //Goal Line Extended
    if((BallCenterX+13>width-106)&&((BallCenterY>594)||(BallCenterY<206))){
      direction = -direction;
    }
    if((BallCenterX-13<106)&&((BallCenterY>594)||(BallCenterY<206))){
      direction = -direction;
    }
    //Top and bottom of the Arena
    if(((BallCenterY-13<(46+13))||(BallCenterY+13>height-(46+13)))&&((BallCenterX<width-106)&&(BallCenterX>106))){
      Ydirection = -Ydirection;
    }
    if(keyPressed && (key==CODED)){
      if(keyCode == SHIFT){
        BallCenterX = 700;
        BallCenterY = 400;
      }
    }
    fill(255,35,35);
    //red paddle
    rect(RedPaddleCenterX,RedPaddleCenterY,26,80);
    fill(35,35,255);
    //Blue Paddle
    rect(BluePaddleCenterX,mouseY,26,80);
    if(keyPressed && (key == CODED)){
      if(keyCode == UP){
        RedPaddleCenterY-=PaddleSpeed;
      }
      if(keyCode == DOWN){
        RedPaddleCenterY +=PaddleSpeed;
      }
    }
    fill(255,35,35);
    text(RedScore,200,40);
    fill(35,35,255);
    text(BlueScore,width-200,40);
    if(BlueScore > 6){
      fill(35,35,255);
      rect(700,400,130,75);
      fill(0);
      rect(700,400,125,70);
      fill(200,200,200);
      fill(200,200,200);
      text("Blue Wins",600,420);
      BallCenterX = 700;
      BallCenterY = 400;
      direction = 0;
      Ydirection = 0;
    }
    if(RedScore > 6){
      fill(255,35,35);
      rect(700,400,130,75);
      fill(0);
      rect(700,400,125,70);
      fill(200,200,200);
      text("Red Wins",610,420);
      BallCenterX=700;
      BallCenterY=400;
      direction = 0;
      Ydirection = 0;
    }
  }