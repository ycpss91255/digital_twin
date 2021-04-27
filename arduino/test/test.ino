/*******************************
 * Define
 ******************************/
#define Ref_V 5
/*******************************
 * Functions Declare
 ******************************/
float V_Conversion(float);

/*******************************
 * Arduino main code
 ******************************/
void setup() { Serial.begin(115200); }

void loop() {
  while (1) {
     float v = V_Conversion(analogRead(A0));
    Serial.println(v);
    delay(100);
  }
}

/*******************************
 * Functions Definitions
 ******************************/
float V_Conversion(int V) {
    return ((float)Ref_V * 5 / 1023);
}
