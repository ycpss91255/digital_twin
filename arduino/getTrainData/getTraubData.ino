/*
 * rosserial Subscriber Example
 * Blinks an LED on callback
 */

#include <ros.h>
#include <std_msgs/Empty.h>

ros::NodeHandle nh;

void messageCb(const std_msgs::Empty& toggle_msg) {
  digitalWrite(LED_BUILTIN, HIGH - digitalRead(LED_BUILTIN));  // blink the led
}

ros::Subscriber<std_msgs::Empty> sub("toggle_led", &messageCb);

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  nh.initNode();
  nh.subscribe(sub);
}

void loop() {
  nh.spinOnce();
  delay(1);
}


// /*
//  * rosserial Publisher Example
//  * Prints "hello world!"
//  */

// #include <ros.h>
// #include <std_msgs/String.h>

// ros::NodeHandle  nh;

// std_msgs::String str_msg;
// ros::Publisher chatter("chatter", &str_msg);

// char hello[13] = "hello world!";

// void setup()
// {
//   nh.initNode();
//   nh.advertise(chatter);
// }

// void loop()
// {
//   str_msg.data = hello;
//   chatter.publish( &str_msg );
//   nh.spinOnce();
//   delay(1000);
// }
