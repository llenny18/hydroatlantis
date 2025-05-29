/*
 * ATLANTIS MPC Pump Controller
 * Receives pump timing data from Python MPC script
 * Controls 5 pumps: pH Down, pH Up, Magnesium, Calcium, NPK
 * Data format: "pHdn_time,pHup_time,Mg_time,Ca_time,NPK_time\n"
 */

// Pin definitions for pump relays
#define PUMP_pH_DOWN_PIN    2
#define PUMP_pH_UP_PIN      3
#define PUMP_MG_PIN         4
#define PUMP_CA_PIN         5
#define PUMP_NPK_PIN        6
#define LED_STATUS_PIN      13

// Pump timing variables (in milliseconds)
float pumpTimes[5] = {0, 0, 0, 0, 0}; // pH_down, pH_up, Mg, Ca, NPK
unsigned long pumpStartTimes[5] = {0, 0, 0, 0, 0};
bool pumpActive[5] = {false, false, false, false, false};
int pumpPins[5] = {PUMP_pH_DOWN_PIN, PUMP_pH_UP_PIN, PUMP_MG_PIN, PUMP_CA_PIN, PUMP_NPK_PIN};

// Communication variables
String inputString = "";
bool stringComplete = false;
unsigned long lastDataReceived = 0;
const unsigned long TIMEOUT_MS = 10000; // 10 seconds timeout

void setup() {
  // Initialize serial communication
  Serial.begin(9600);
  
  // Initialize pump control pins
  for (int i = 0; i < 5; i++) {
    pinMode(pumpPins[i], OUTPUT);
    digitalWrite(pumpPins[i], LOW); // Pumps OFF initially
  }
  
  // Initialize status LED
  pinMode(LED_STATUS_PIN, OUTPUT);
  digitalWrite(LED_STATUS_PIN, LOW);
  
  // Reserve string buffer
  inputString.reserve(200);
  
  Serial.println("ATLANTIS MPC Pump Controller Ready");
  Serial.println("Waiting for pump timing data...");
}

void loop() {
  // Check for incoming serial data
  if (stringComplete) {
    processPumpData(inputString);
    inputString = "";
    stringComplete = false;
    lastDataReceived = millis();
    
    // Blink status LED when data received
    digitalWrite(LED_STATUS_PIN, HIGH);
    delay(50);
    digitalWrite(LED_STATUS_PIN, LOW);
  }
  
  // Control pumps based on timing
  controlPumps();
  
  // Check for communication timeout
  if (millis() - lastDataReceived > TIMEOUT_MS && lastDataReceived > 0) {
    Serial.println("Warning: No data received for 10 seconds");
    stopAllPumps();
  }
  
  delay(10); // Small delay for stability
}

void serialEvent() {
  while (Serial.available()) {
    char inChar = (char)Serial.read();
    inputString += inChar;
    
    if (inChar == '\n') {
      stringComplete = true;
    }
  }
}

void processPumpData(String data) {
  // Parse comma-separated values: pHdn,pHup,Mg,Ca,NPK
  data.trim(); // Remove whitespace and newlines
  
  int commaIndex[4];
  int startIndex = 0;
  int commaCount = 0;
  
  // Find comma positions
  for (int i = 0; i < data.length() && commaCount < 4; i++) {
    if (data.charAt(i) == ',') {
      commaIndex[commaCount] = i;
      commaCount++;
    }
  }
  
  if (commaCount == 4) {
    // Extract pump times
    pumpTimes[0] = data.substring(0, commaIndex[0]).toFloat();                    // pH Down
    pumpTimes[1] = data.substring(commaIndex[0] + 1, commaIndex[1]).toFloat();    // pH Up
    pumpTimes[2] = data.substring(commaIndex[1] + 1, commaIndex[2]).toFloat();    // Magnesium
    pumpTimes[3] = data.substring(commaIndex[2] + 1, commaIndex[3]).toFloat();    // Calcium
    pumpTimes[4] = data.substring(commaIndex[3] + 1).toFloat();                   // NPK
    
    // Convert seconds to milliseconds and apply safety limits
    for (int i = 0; i < 5; i++) {
      pumpTimes[i] = pumpTimes[i] * 1000; // Convert to milliseconds
      pumpTimes[i] = constrain(pumpTimes[i], 0, 30000); // Max 30 seconds per pump
    }
    
    // Start pumps if timing > 0
    startPumps();
    
    // Print received data
    Serial.print("Received pump times (ms): ");
    Serial.print("pH_Down="); Serial.print(pumpTimes[0]);
    Serial.print(", pH_Up="); Serial.print(pumpTimes[1]);
    Serial.print(", Mg="); Serial.print(pumpTimes[2]);
    Serial.print(", Ca="); Serial.print(pumpTimes[3]);
    Serial.print(", NPK="); Serial.print(pumpTimes[4]);
    Serial.println();
    
  } else {
    Serial.println("Error: Invalid data format received");
  }
}

void startPumps() {
  unsigned long currentTime = millis();
  
  for (int i = 0; i < 5; i++) {
    if (pumpTimes[i] > 0) {
      pumpStartTimes[i] = currentTime;
      pumpActive[i] = true;
      digitalWrite(pumpPins[i], HIGH);
      
      // Print pump activation
      String pumpNames[5] = {"pH_Down", "pH_Up", "Magnesium", "Calcium", "NPK"};
      Serial.print("Starting "); Serial.print(pumpNames[i]); 
      Serial.print(" pump for "); Serial.print(pumpTimes[i]); Serial.println(" ms");
    }
  }
}

void controlPumps() {
  unsigned long currentTime = millis();
  
  for (int i = 0; i < 5; i++) {
    if (pumpActive[i]) {
      // Check if pump should be turned off
      if (currentTime - pumpStartTimes[i] >= pumpTimes[i]) {
        digitalWrite(pumpPins[i], LOW);
        pumpActive[i] = false;
        
        // Print pump deactivation
        String pumpNames[5] = {"pH_Down", "pH_Up", "Magnesium", "Calcium", "NPK"};
        Serial.print("Stopping "); Serial.print(pumpNames[i]); Serial.println(" pump");
      }
    }
  }
}

void stopAllPumps() {
  for (int i = 0; i < 5; i++) {
    digitalWrite(pumpPins[i], LOW);
    pumpActive[i] = false;
    pumpTimes[i] = 0;
  }
  Serial.println("All pumps stopped");
}

// Emergency stop function (can be called from serial command)
void emergencyStop() {
  stopAllPumps();
  Serial.println("EMERGENCY STOP: All pumps halted");
}

// Status reporting function
void reportStatus() {
  Serial.println("=== Pump Status ===");
  String pumpNames[5] = {"pH_Down", "pH_Up", "Magnesium", "Calcium", "NPK"};
  
  for (int i = 0; i < 5; i++) {
    Serial.print(pumpNames[i]); Serial.print(": ");
    if (pumpActive[i]) {
      unsigned long remaining = pumpTimes[i] - (millis() - pumpStartTimes[i]);
      Serial.print("ACTIVE ("); Serial.print(remaining); Serial.println(" ms remaining)");
    } else {
      Serial.println("INACTIVE");
    }
  }
  Serial.println("==================");
}

// Handle serial commands for debugging
void serialEvent() {
  while (Serial.available()) {
    char inChar = (char)Serial.read();
    
    // Handle special commands
    if (inChar == 'S' || inChar == 's') {
      reportStatus();
      return;
    } else if (inChar == 'E' || inChar == 'e') {
      emergencyStop();
      return;
    }
    
    inputString += inChar;
    
    if (inChar == '\n') {
      stringComplete = true;
    }
  }
}