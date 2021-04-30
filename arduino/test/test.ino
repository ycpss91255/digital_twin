// /*******************************
//  * Define
//  ******************************/
// #define Ref_V 5.0
// /*******************************
//  * Functions Declare
//  ******************************/
// float V_Conversion(float);

// /*******************************
//  * Arduino main code
//  ******************************/
// void setup() { Serial.begin(115200); }

// void loop() {
//   while (1) {
//     float v_0 = V_Conversion(analogRead(A0));
//     float v_1 = V_Conversion(analogRead(A1));
//     if (v_0 != 0 || v_1 != 0) {
//       Serial.print(v_0);
//       Serial.print("\t");
//       Serial.println(v_1);
//     }
//     // delay(1000);
//   }
// }

// /*******************************
//  * Functions Definitions
//  ******************************/
// float V_Conversion(int V) {
//   // Voltage divider rule V_out = V_in * (R2 / (R1 + R2)
//   // R1 = 30k Ohm
//   // R2 = 7.5k Ohm
//   return (float)V / 1023.0 * (Ref_V * 5.0);
// }

/*     Arduino Rotary Encoder Tutorial
 *
 *  by Dejan Nedelkovski, www.HowToMechatronics.com
 *
 */

 #define outputA 6
 #define outputB 7

 int counter = 0;
 int aState;
 int aLastState;

 void setup() {
   pinMode (outputA,INPUT);
   pinMode (outputB,INPUT);

   Serial.begin (115200);
   // Reads the initial state of the outputA
   aLastState = digitalRead(outputA);
 }

 void loop() {
   aState = digitalRead(outputA); // Reads the "current" state of the outputA
   // If the previous and the current state of the outputA are different, that means a Pulse has occured
   if (aState != aLastState){
     // If the outputB state is different to the outputA state, that means the encoder is rotating clockwise
     if (digitalRead(outputB) != aState) {
       counter ++;
     } else {
       counter --;
     }
     Serial.print("Position: ");
     Serial.println(counter);
   }
   aLastState = aState; // Updates the previous state of the outputA with the current state
 }
