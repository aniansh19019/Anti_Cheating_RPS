
import processing.serial.*;
Serial myPort;
int scissor_delay=0,t1,t2;
int k=0,kkl=0;
PImage img2,img1;
PFont font;
float scis;
int j=360,rshaken=0,lshaken=0;
float a = 0.0;
float tim;
float inc = TWO_PI/25.0;
PFont font2;
PImage img,rock,paper,scl,scll,rockl,paperl;
int imgsize,picker1,picker2,round_counter,sc1_counter,sc2_counter,start_time;
float deltay,xlocal1,xlocal2,ylocal;
long throwtimer;


//throwtimer;
boolean c_down,countdown,vib,win_and_next,valid_input,multiplayer,selected;
int t=0;
int p=1;
String PL1,PL2,val="";
int counter_for=0,ycount=0;
int typeofplay=0;
void setup()
{
  PL1="";
  PL2="";
  
  size(1200,800);
  frameRate(10);
  background(250,234,0);
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
  selected=false;
  win_and_next=false;
  valid_input=false;
  multiplayer=false;
  background(255,234,0);
  imgsize=230;
  deltay=0.0;
  ylocal=400;
  xlocal1=750;
  xlocal2=250;
  picker1=2;
  picker2=1;
  font = createFont("04B_30__.TTF", 70);
  textFont(font);
  frameRate(30);
  fill(0);
 String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
   
 myPort = new Serial(this, portName, 9600);

}
void draw()
{  
      fill(0,0,0);
      if(j<=800)
      {
        rect(j,190,20,20);
        font=createFont("TT.ttf",100);
        textFont(font);
        textSize(100);
        img2=loadImage("stt.jpg");
        image(img2,200,250,700,500);
        
        text("ROCK PAPER SCISSORS",35,150);
        text("ROCK PAPER SCISSORS",37,150);
        text("ROCK PAPER SCISSORS",33,150);  
        text("ROCK PAPER SCISSORS",33,152);
        text("ROCK PAPER SCISSORS",33,148);
        if(p%3==0)
        j+=40;
        p++;
      }
      else if(j<=1200)
      {
        background(250,234,0);
        j+=40;
      }
      else if(j<=1280)
      {
        if(ycount==0 && !selected)
        { 
          strokeWeight(30);
          fill(250,250,100);
          rect(width/2-500,height-720,500,240);
          rect(width/2-500,height-300,500,240);
          line(0,height/2,width,height/2);
          ycount++;
        }
        fill(250,0,0);
        textSize(50);
        text("SINGLE PLAYER",width/2-420,height-600);
        text("MULTI PLAYER",width/2-420,height-180);
        
        fill(0,0,0);
        stroke(2);
        text("PLAYER",width/2+260,height-675);
        text("VS",width/2+330,height-600);
        text("COMPUTER",width/2+210,height-525);
        text("PLAYER1",width/2+245,height-260);
        text("VS",width/2+330,height-185);
        text("PLAYER2",width/2+245,height-110);
        
        if(selected){
        ycount++;
      j=1281;
    }
        
        strokeWeight(1);
      }
      else if(counter_for==0)
      {
        if(kkl==0)
        {
          background(250,234,0);
          textSize(100);
          text("ENTER THE PLAYER 1 NAME",100,100);
          kkl++;
        }
        textSize(100);
        PL2="Robot";
        text(PL1,400,400);
      }
      
      else if(counter_for==1 && multiplayer)
      {
        if(kkl==1)
        {      
          background(250,234,0);
          textSize(100);
          PL2="";
          text("ENTER THE PLAYER 2 NAME",100,100);
          kkl++;
        }
        textSize(100);
        text(PL2,400,400);
      }
      
      else
      {
        if(c_down)
        {
          font2 = createFont("04B_30__.TTF", 30);
          textFont(font2);
          fill(0);
          if(t==100)
          {
            background(255,234,0);
            if(counter_for!=2)
            delay(1000);
              
              font2 = createFont("04B_30__.TTF", 56);
              textFont(font2);
              text("START GAME " , width/2-300, 300);
              rshaken=0;
              lshaken=0;
          }
          
          if(t==500)
          {
            c_down=false;
            countdown=true;
            t=0;      
          }
          else
          {
            t=t+20;
          } 
        } 
        else if(countdown)
        { if(multiplayer)
          {if(rshaken==1 && (lshaken<=rshaken) || (lshaken==1 ) && (lshaken>=rshaken))
          {
            font2 = createFont("04B_30__.TTF", 60);
            
            background(255,234,0);
            textFont(font2); 
            text("ROCK" , width/2-540, 200);
            print("picker1 "+ picker1);
          }
          
          if(rshaken==2 && (lshaken<rshaken) || (lshaken==2 ) && (lshaken>rshaken))
          {
            background(255,234,0);
            text("PAPER" , width/2-540, 400);
                        print("picker1 "+ picker1);          
      
    }
    
          if(rshaken>=3 && (lshaken<=rshaken) || (lshaken>=3 ) && (lshaken>=rshaken))
          {
            background(255,234,0);
            text("SCISSORS" , width/2-540, 600);
            scissor_delay+=10;            
                        print("picker1 ("+ picker1 +")");
        if(!multiplayer){
          picker2=int(round(random(2.1)));
          
        }
          
        }
          /*if(t==1600)
          {
            background(255,234,0);
            text("SHOOT!" , width/2-150, 200);
            picker1=int(random(2.1));
            picker2=int(random(2.1));
          }*/
             throwtimer=millis(); 
          if((scissor_delay>= 600 ) && (rshaken >=3 || lshaken>=3) )
          {
            if((throwtimer-t1)>=1000){
            
            }
            
            background(255,234,0);
            t=0;
            vib=true;
            countdown=false;
           
          }
        }
        else{
        
          if(rshaken==1 )
          {
            font2 = createFont("04B_30__.TTF", 60);
            
            background(255,234,0);
            textFont(font2); 
            text("ROCK" , width/2-540, 200);
          }
          
          
          if(rshaken==2 )
          {
            background(255,234,0);
            text("PAPER" , width/2-540, 400);
          }
          if(rshaken==3 )
          {
            background(255,234,0);
            text("SCISSORS" , width/2-540, 600);
            scissor_delay+=20;            
          picker2=int(round(random(2.1)));
          switch(picker2){
          case 0: picker2='r';
                  break;
          case 1: picker2='p';
                  break;
          case 2: picker2='s';
                  break;
          
          }
          
          print("random");
        
        
          
        }
          /*if(t==1600)
          {
            background(255,234,0);
            text("SHOOT!" , width/2-150, 200);
            picker1=int(random(2.1));
            picker2=int(random(2.1));
          }*/
          if(scissor_delay==100 && rshaken ==3 )
          {
            background(255,234,0);
            t=0;
            vib=true;
            countdown=false;
           
          }
        
        
        
        }
        
        }
        else if(vib)  
        {  
          if(t==0)
          {
            general_log();
          }
          t=t+40;
          switch(picker1)
          {
            case 'r':
                    image(rock,xlocal1,ylocal+4.5*sin(deltay),imgsize,imgsize);
                    
                    break;
            case 'p':
                    image(paper,xlocal1,ylocal+4.5*sin(deltay),imgsize,imgsize);
                    
                    break;   
            case 's':
                    image(scl,xlocal1,ylocal+4.5*sin(deltay),imgsize,imgsize);
                    
                    break;
          }
          switch(picker2)
          {
            case 'r':
                    image(rockl,xlocal2,ylocal+4.5*sin(deltay),imgsize,imgsize);
                    break;
            case 'p':
                    image(paperl,xlocal2,ylocal+4.5*sin(deltay),imgsize,imgsize);
                    break;
            case 's':
                    image(scll,xlocal2,ylocal+4.5*sin(deltay),imgsize,imgsize);
                    break;
          }
          deltay=deltay+0.2;
          if(deltay>6)
          {
            deltay=0;
          }
          if(t==400)
          {
            if((picker1=='5')||(picker2=='5'))
              text("INVALID GAME" , width/2-540, 800);
            else
            { 
              {
                if(picker1==(picker2))
                {
                  text("It is a draw, nobody wins" , width/2-540, 800); 
                }
                else if(picker1=='p' && picker2=='s')
                {
                  text(PL2+" wins" , width/2-540, 300);
                  sc2_counter=sc2_counter+1;  
                }
                else if(picker1=='r' && picker2=='p')  
                {
                  text(PL2+" wins" , width/2-540, 300);
                  sc2_counter=sc2_counter+1;            
                }
                else if(picker1=='s' && picker2=='r')
                {
                  text(PL2+" wins" , width/2-540, 300);
                  sc2_counter=sc2_counter+1;  
                }
                else
                {
                  text(PL1+" wins" , width/2-540, 300);
                  sc1_counter=sc1_counter+1;  
                }
              }  
            }
            round_counter+=1;
          }
          else if(t==2800)
          {
            scissor_delay=0;
            t=0;
            c_down=true;
            countdown=false;
            vib=false;
          }          
        }        
      }  
}
void general_log()
{
  font2 = createFont("04B_30__.TTF", 30);
  textFont(font2);
  fill(0);
  textSize(30);
  text("Round " + round_counter, width/2-80, 50);  
  text(PL1 + sc1_counter, width-270, 50);
  text(PL2 + sc2_counter, 20, 50);
  font2 = createFont("04B_30__.TTF", 60);
  textFont(font2);
  stroke(0);
  
  fill(255,234,0);
  rect(width/2-80,height-120,160,100,20);
  textSize(20);
  fill(1);
  textSize(30);
  text("QUIT",width/2-45,height-60);
textSize(50);
}
void serialEvent(Serial p) 
{ if(countdown){
    char tom=(char)myPort.read();
    if(tom =='1'||tom =='p'||tom=='s'||tom=='r'||tom=='2')
    {val=val+tom;
    
  }
    
    
    if(val.length()==2)
    {
      print(val);
      if(val.charAt(0)=='1')
      {rshaken=rshaken+1;
      
          picker1=val.charAt(1);
          
          t2=millis();
          t1=millis();     
      }
      else 
      {lshaken=lshaken+1;
         picker2=val.charAt(1);
        t1=millis();
         t2=millis();
         if(!multiplayer){
          picker1=picker2;
        rshaken=rshaken+1;
        if(lshaken==3 || rshaken==3){
        scis=millis();
        }
        }
      }
      val="";
      
    p.clear();
    
  }
 if((rshaken >= 3 || lshaken >=3) && throwtimer-t1>=1000  || (throwtimer-t2)>=1000  ){
 print("check");
   picker1='5';
 picker2='5';
 
 } 
  
}
}
void keyPressed()
{
   if(counter_for==0)
   {
       if((key>='a'&&key<='z')||(key>='A'&&key<='Z'))
       {
           PL1=PL1+key;
       }
       else if(key==ENTER)
       { 
         counter_for++;
         print(counter_for);
         PL1=PL1+key;
       }
    } 
    else if(counter_for==1)
    {
      if((key>='a'&&key<='z')||(key>='A'&&key<='Z'))
       {
           PL2=PL2+key;
       }
       else if(key==ENTER)
       { 
         counter_for++;
         print(counter_for);
         PL2=PL2+key;
       }
    }
}
void mousePressed() {
  if ((mouseX >=width/2-120 && mouseX<= width/2+80 ) && (mouseY>=height-120 && mouseY<=height-20)) { 
    background(250,234,0);
    exit();}
  if ((mouseX >=width/2-500 && mouseX<= width/2 ) && (mouseY>=height-720 && mouseY<=height-720+240) && j<=1280 ){ 
     multiplayer=false;
     selected=true;
}
else   if ((mouseX >=width/2-500 && mouseX<= width/2 ) && (mouseY>=height-300 && mouseY<=height-300+240 && j<=1280)) { 
    multiplayer=true;
  selected=true;
}
}
