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

// When a packet is received, send it via USB
void onReceive(int packetSize) {
    //Do stuff
    Serial.print("Received packet with RSSI ");
    Serial.println(LoRa.packetRssi());
}

// CPU #0
void telemetry_task(void* param) {
    vTaskDelete(NULL);
}

// CPU #1
// Perform cycle:
// 1. Read commands from USB
// 2. Send commands via LoRa
void control_task(void* param) {
    while(1){
        // Read commands from USB
        // Do Stuff
        if (Serial.available() > 0) {
            incomingByte = Serial.read();
            
            // Send LoRa packet to receiver
            LoRa.beginPacket();
            LoRa.write(buffer, length); // MAX 255 bytes
            LoRa.endPacket();
        }
    }
    vTaskDelete(NULL);
}

void setup() {
    //Initialize Serial comms
    Serial.begin(115200);
    Serian.println("Starting controller...");

    //SPI LoRa pins
    SPI.begin(SCK, MISO, MOSI, SS);
    //setup LoRa transceiver module
    LoRa.setPins(SS, RST, DIO0);
    if(!LoRa.begin(BAND)) {
        println("LoRa init error.");
        while(1);
    }
    Serial.println("LoRa Initializing OK!");
    //Puts the radio in continuous receive mode
    LoRa.receive();
    LoRa.onReceive(onReceive);

    // Init telemetry and control tasks
    xTaskCreate(control_task, "Control", 10000, NULL, 1, NULL, 0);
    xTaskCreate(telemetry_task, "Telemetry", 10000, NULL, 1, NULL, 1);
}

// Do nothing
void loop() {
    delay(2147483647L);
}
