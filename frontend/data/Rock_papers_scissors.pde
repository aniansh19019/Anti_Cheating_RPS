PFont font;

PImage img,rock,paper,scl,scll,rockl,paperl;
int imgsize,picker1,picker2,round_counter,sc1_counter,sc2_counter,start_time;
float deltay,xlocal1,xlocal2,ylocal;
boolean c_down,countdown,vib,win_and_next;
int t=0;
void setup() {
  size(1200,800);
  rock = loadImage("rock.PNG");
  rockl = loadImage("rockl.PNG");
  
  paper = loadImage("paper.PNG");
  paperl = loadImage("paperl.PNG");
  
  scl = loadImage("scissors.PNG");
  scll= loadImage("scissorsl.PNG");
  round_counter=1;
  sc1_counter=0; 
  sc2_counter=0; 
  c_down=true;
  countdown=false;
  vib=false;
  win_and_next=false;
  
  background(255,234,0);
  imgsize=230;
  frameRate(30);
  deltay=0.0;
  ylocal=400;
  xlocal1=750;
  xlocal2=250;
picker1=2;
picker2=1;
font = createFont("04B_30__.TTF", 70);
textFont(font);
fill(0);

}
 
void draw() {    

if(c_down){
font = createFont("04B_30__.TTF", 30);
textFont(font);
fill(0);



if(t==100){
  background(255,234,0);
  general_log();
  font = createFont("04B_30__.TTF", 40);
textFont(font);
  text("Game starting in " , width/2-270, 300);
  text("3" , width/2-50, 400);
}
if(t==600){
  background(255,234,0);
general_log();
font = createFont("04B_30__.TTF", 40);
textFont(font);

text("Game starting in " , width/2-270, 300);
  
text("2" , width/2-50, 400);
}
if(t==1200){
  background(255,234,0);
general_log();
font = createFont("04B_30__.TTF", 40);
textFont(font);

text("Game starting in " , width/2-270, 300);
  
text("1" , width/2-50, 400);
}
if(t==2000){
c_down=false;
background(255,234,0);
countdown=true;
t=0;    

}
else{

t=t+20;
}

}

else if(countdown){
if(t==200){font = createFont("04B_30__.TTF", 60);
textFont(font);

text("ROCK" , width/2-540, 200);
   

}
if(t==800){
background(255,234,0);
text("PAPER" , width/2-540, 400);

}
if(t==1200){
background(255,234,0);
text("SCISSORS" , width/2-540, 600);

}
if(t==1600){
background(255,234,0);
text("SHOOT!" , width/2-150, 200);
picker1=int(random(2.1));
picker2=int(random(2.1));
}





if(t==2200){
background(255,234,0);
t=0;
vib=true;
countdown=false;}
else{
t=t+20;
}

}

else if(vib){  
  if(t==0){
  general_log();
  }
  t=t+40;

switch(picker1) {
case 0: 
image(rock,xlocal1,ylocal+4.5*sin(deltay),imgsize,imgsize); 
 general_log();
break;
case 1: 
image(paper,xlocal1,ylocal+4.5*sin(deltay),imgsize,imgsize);
    general_log();
    break;
  
case 2:
image(scl,xlocal1,ylocal+4.5*sin(deltay),imgsize,imgsize); 
  general_log();
  break;

}
switch(picker2) {
case 0: 
 image(rockl,xlocal2,ylocal+4.5*sin(deltay),imgsize,imgsize); 
 
    break;
case 1: 
image(paperl,xlocal2,ylocal+4.5*sin(deltay),imgsize,imgsize);
    break;
  
case 2:
image(scll,xlocal2,ylocal+4.5*sin(deltay),imgsize,imgsize); 
  break;

}

deltay=deltay+0.2;
if(deltay>6){
deltay=0;

}

if(t==400){
  if(picker1==picker2){
  text("It is a draw, nobody wins" , width/2-540, 800);
   
  
  }
  else if(picker1==1 && picker2==2){
  
  text("Player 2 wins" , width/2-540, 300);
sc2_counter=sc2_counter+1;   
  
  }
  
  else if(picker1==0 && picker2==1){
  
  text("Player 2 wins" , width/2-540, 300);
sc2_counter=sc2_counter+1;   
   
  
  }
  else if(picker1==2 && picker2==0){
 
  text("Player 2 wins" , width/2-540, 300);
sc2_counter=sc2_counter+1;   
    
  
  }
  else
{
  
  text("Player 1 wins " , width/2-540, 300);
sc1_counter=sc1_counter+1;   
   
}
round_counter+=1;
  

}
else if(t==1200){
t=0;
 c_down=true;
  countdown=false;
  vib=false;



}




}



  
  
 


  



}
void general_log(){
  font = createFont("04B_30__.TTF", 30);
textFont(font);
fill(0);
text("Round " + round_counter, width/2-80, 50);  




text("P1 score " + sc1_counter, width-270, 50);




text("P2 score " + sc2_counter, 20, 50);



font = createFont("04B_30__.TTF", 60);
textFont(font);


}
