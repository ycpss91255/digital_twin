#include <sstream>

#include "geometry_msgs/Twist.h"
#include "motion/parameter.h"
#include "ros/ros.h"

void pub_fn(float, float, float, float);

ros::Publisher chatter_pub;
geometry_msgs::Twist msg;

int main(int argc, char **argv) {
  ros::init(argc, argv, "talker");
  ros::NodeHandle n;

  chatter_pub = n.advertise<geometry_msgs::Twist>(MOTION_TOPIC_NAME, 1000);

  sleep(1);

  float speed = 100.0;
  float time = 3;
  printf("+y\n");
  pub_fn(0, speed, 0, time);
  pub_fn(0, 0, 0, 1);

  printf("-x\n");
  pub_fn(-speed, 0, 0, time);
  pub_fn(0, 0, 0, 1);

  printf("-y\n");
  pub_fn(0, -speed, 0, time);
  pub_fn(0, 0, 0, 1);

  printf("+x\n");
  pub_fn(speed, 0, 0, time);
  pub_fn(0, 0, 0, 1);

  return 0;
}

void pub_fn(float x, float y, float z, float t) {
  msg.linear.x = x;
  msg.linear.y = y;
  msg.angular.z = z;
  chatter_pub.publish(msg);
  sleep(t);
}
