//Player 2
#include <RH_ASK.h>
#include <SPI.h>
#include <MPU6050_tockn.h>
#include <Wire.h>


#define F1 8
#define F2 7
#define F3 6
#define F4 4
#define VIB A3
//pin 12 for transmitting


const float accel_threshhold=2.75;//set this



void send_state();//send hand state to Processing
String get_state();//get hand state as a string
bool shake();//detect shake
void buzz();//vibrate the hand
void test();


MPU6050 mpu6050(Wire);

RH_ASK driver;


void setup()
{
  pinMode(VIB, OUTPUT);
  pinMode(F1, INPUT_PULLUP);
  pinMode(F2, INPUT_PULLUP);
  pinMode(F3, INPUT_PULLUP);
  pinMode(F4, INPUT_PULLUP);
  Serial.begin(9600);
  Wire.begin();
  mpu6050.begin();
  //mpu6050.calcGyroOffsets(true);
  
  while(!driver.init())
  {
    buzz();
    delay(1000);
  }
    
}

void loop() 
{
  //test();
  mpu6050.update();
  if(shake())
  {
    
    buzz();
    delay(100);//delay after shaking the hand to avoid simultneous transmission
    send_state();
    
  }

}

String get_state()
{
    String a= String(digitalRead(F1)) + String(digitalRead(F2)) + String(digitalRead(F3)) + String(digitalRead(F4));
    return a;
}
void send_state()//added tolerances, remove if option selectipn implemented
{
  String state=get_state();
  char *msg;
  if(state=="0000" || state =="0001" || state=="0011")
    msg="2r";
  else if(state=="1100" || state=="1110")
    msg="2s";
  else if(state=="1111")
    msg="2p";
   
  driver.send((uint8_t *)msg, strlen(msg));
  driver.waitPacketSent();
}
bool shake()
{
  float accel,x,y,z;
  x= mpu6050.getAccX();
  y= mpu6050.getAccY();
  z= mpu6050.getAccZ();
  accel=sqrt(x*x+y*y+z*z);
  if(accel>accel_threshhold)
    return 1;
  else
    return 0;
  
}
void buzz()
{
  digitalWrite(VIB, HIGH);
  delay(300);
  digitalWrite(VIB,LOW);
}
void test()
{
  while(1)
  {
    mpu6050.update();
    float accel,x,y,z;
    x= mpu6050.getAccX();
    y= mpu6050.getAccY();
    z= mpu6050.getAccZ();
    accel=sqrt(x*x+y*y+z*z);
    Serial.println(accel);
  }
}
