#include <RH_ASK.h>
#include <SPI.h> 
RH_ASK driver;

void setup()
{
    Serial.begin(9600); 
    if (!driver.init())
         Serial.println("er");
}

void loop()
{
    uint8_t buf[2];
    uint8_t buflen = sizeof(buf);
    if (driver.recv(buf, &buflen)) // Non-blocking
    {
      Serial.print((char*)buf);         
    }
}
