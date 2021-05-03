
/*******************************
 * include header file
 ******************************/
#include "ros_handle_config.h"
/*******************************
 * Define control
 ******************************/
// #define SER_PR
/*******************************
 * Define
 ******************************/
#define Ref_V 5.0
/*******************************
 * Functions Declare
 ******************************/
float V_Conversion(float);
/*******************************
 * Variables Declare
 ******************************/

/*******************************
 * Arduino main code
 ******************************/
void setup() {
#ifndef SER_PR
  nh.initNode();
  nh.advertise(MotorCmdV_pub);

#else
  Serial.begin(115200);
#endif
}

void loop() {
  // positive and negative
  float pos_v = V_Conversion(analogRead(A0));
  float neg_v = V_Conversion(analogRead(A1));
  if (pos_v > neg_v) {
    CmdV_msg.data = pos_v;
  } else if (pos_v < neg_v) {
    CmdV_msg.data = -neg_v;
  } else {
    CmdV_msg.data = 0;
  }
#ifndef SER_PR
  MotorCmdV_pub.publish(&CmdV_msg);
  nh.spinOnce();
#else
  Serial.print((pos_v > neg_v) ? "+" : "-");
  Serial.print("\t");
  Serial.println(CmdV_msg.data);
#endif
}

/*******************************
 * Functions Definitions
 ******************************/
float V_Conversion(int V) {
  // Voltage divider rule V_out = V_in * (R2 / (R1 + R2)
  // R1 = 30k Ohm
  // R2 = 7.5k Ohm
  return (float)V / 1023.0 * (Ref_V * 5.0);
}
