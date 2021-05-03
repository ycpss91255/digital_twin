
/*******************************
 * include header file
 ******************************/
#include "ros_handle_config.h"
/*******************************
 * Define
 ******************************/
// #define SER_PR

#define Ref_V 5.0
#define BAUD 57600
/*******************************
 * Arduino main code
 ******************************/
void setup() {
#ifndef SER_PR
  nh.getHardware()->setBaud(BAUD);
  nh.initNode();
  nh.advertise(MotorCmdV_pub);

#else
  Serial.begin(BAUD);
#endif
}

void loop() {
  // Voltage divider rule V_out = V_in * (R2 / (R1 + R2)
  // R1 = 30k Ohm
  // R2 = 7.5k Ohm
  // return (float)V / 1023.0 * (Ref_V * 5.0);

  // positive and negative
  float pos_v = (float)analogRead(A0) / 40.92;
  float neg_v = (float)analogRead(A1) / 40.92;

  if (pos_v > neg_v)
    CmdV_msg.data = pos_v;
  else if (pos_v < neg_v)
    CmdV_msg.data = -neg_v;
  else
    CmdV_msg.data = 0;

    // if ((micros() - time) >= 1500) {
#ifndef SER_PR
  MotorCmdV_pub.publish(&CmdV_msg);
  nh.spinOnce();
#else
  Serial.print((pos_v > neg_v) ? "+" : "-");
  Serial.print("\t");
  Serial.println(CmdV_msg.data);
#endif
}
