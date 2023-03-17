#include <sstream>

#include "motion/FourMotorCmd.h"
#include "ros/ros.h"
#include "std_msgs/Float64.h"

motion::FourMotorCmd cmd;

void RobotFB(const motion::FourMotorCmd::ConstPtr &msg) {
  cmd.w1 = msg->w1;
  cmd.w2 = msg->w2;
  cmd.w3 = msg->w3;
  cmd.w4 = msg->w4;
}

int main(int argc, char **argv) {
  ros::init(argc, argv, "talker");

  ros::NodeHandle n;

  ros::Subscriber robot_sub =
      n.subscribe<motion::FourMotorCmd>("digital/robot/command", 1000, RobotFB);

  ros::Publisher wheel1_pub =
      n.advertise<std_msgs::Float64>("digital/robot/wheel1/command", 1000);
  ros::Publisher wheel2_pub =
      n.advertise<std_msgs::Float64>("digital/robot/wheel2/command", 1000);
  ros::Publisher wheel3_pub =
      n.advertise<std_msgs::Float64>("digital/robot/wheel3/command", 1000);
  ros::Publisher wheel4_pub =
      n.advertise<std_msgs::Float64>("digital/robot/wheel4/command", 1000);

  ros::Rate loop_rate(10);

  while (ros::ok()) {
    std_msgs::Float64 w1_msg;
    std_msgs::Float64 w2_msg;
    std_msgs::Float64 w3_msg;
    std_msgs::Float64 w4_msg;

    w1_msg.data = cmd.w1;
    w2_msg.data = cmd.w2;
    w3_msg.data = cmd.w3;
    w4_msg.data = cmd.w4;

    wheel1_pub.publish(w1_msg);
    wheel2_pub.publish(w2_msg);
    wheel3_pub.publish(w3_msg);
    wheel4_pub.publish(w4_msg);

    ros::spinOnce();

    loop_rate.sleep();
  }

  return 0;
}
