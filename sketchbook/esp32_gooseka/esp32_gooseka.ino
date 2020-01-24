#include <SPI.h>
#include <LoRa.h>

//define the pins used by the LoRa transceiver module
#define SCK 5
#define MISO 19
#define MOSI 27
#define SS 18
#define RST 14
#define DIO0 26

//433E6 for Asia
//866E6 for Europe
//915E6 for North America
#define BAND 866E6

// CPU #0
// Perform cycle:
// 1. Receive each motor duty via LoRa
// 2. Set PWM of each motor
void control_task(void* param) {
    vTaskDelete(NULL);
}

// CPU #1
// Perform cycle:
// 1. Read telemetry from ESC
// 2. Send telemetry via LoRa
void telemetry_task(void* param) {
    while(1){
        //Read telemetry from ESC

        //Send LoRa packet to receiver
        LoRa.beginPacket();
        LoRa.write(buffer, length); // MAX 255 bytes
        LoRa.endPacket();
    }
    vTaskDelete(NULL);
}

// When a packet is received, configure both ESC PWMs.
void onReceive(int packetSize) {
    //Do stuff
}

// Init ESC comms
// Init LoRa comms
// Init telemetry and control tasks
void setup() {
    // ESC
    // Do stuff
    
    //SPI LoRa pins
    SPI.begin(SCK, MISO, MOSI, SS);
    //setup LoRa transceiver module
    LoRa.setPins(SS, RST, DIO0);
    LoRa.begin(BAND);
    //Puts the radio in continuous receive mode
    LoRa.receive();
    LoRa.onReceive(onReceive);

    // Init telemetry and control tasks
    xTaskCreate(control_task, "Control", 10000, NULL, 1, NULL, 0);
    xTaskCreate(telemetry_task, "Telemetry", 10000, NULL, 1, NULL, 1);
}

// Do nothing
void loop {
    delay(2147483647L);
}