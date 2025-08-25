#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <EncoderButton.h>



// Declaration for an SSD1306 display connected to I2C (SDA, SCL pins)
// The pins for I2C are defined by the Wire-library. 
// On an arduino UNO, NANO EVERY:       A4(SDA), A5(SCL)
// On an arduino MEGA 2560: 20(SDA), 21(SCL)
// On an arduino LEONARDO:   2(SDA),  3(SCL), ...
#define OLED_RESET     -1 // Reset pin # (or -1 if sharing Arduino reset pin)
#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 64 // OLED display height, in pixels
#define SCREEN_ADDRESS 0x3C ///< See datasheet for Address; 0x3D for 128x64, 0x3C for 128x32
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

// Declaration for the encoder button class 
EncoderButton knob(3, 4, 2);

void onClicked(EncoderButton& eb) {
//   Serial.print("eb1 clickCount: ");
//   Serial.println(eb.clickCount());
}

void onTurned(EncoderButton& eb) {
//   Serial.print("eb1 incremented by: ");
//   Serial.println(eb.increment());
//   Serial.print("eb1 position is: ");
//   Serial.println(eb.position());
}

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  delay(500);
  Serial.println("EncoderButton Basic Example");

  //Link the event(s) to your function
  eb1.setClickHandler(onClicked);
  eb1.setEncoderHandler(onTurned);
}

void loop() {
  // put your main code here, to run repeatedly:
  // You must call update() for every defined EncoderButton.
  // This will update the state of the encoder & button and 
  // fire the appropriat events.
  knob.update();
}