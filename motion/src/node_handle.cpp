#include "motion/node_handle.h"

MotionNodeHandle::MotionNodeHandle(int argc, char **argv) {
  ros::init(argc, argv, "motion");
  this->n = new ros::NodeHandle();
  MotorEnc_pub = n->advertise<geometry_msgs::Twist>(motor_enc_topic_name, 1000);
  CmdVal_sub = n->subscribe<geometry_msgs::Twist>(
      motion_topic_name, 1000, &MotionNodeHandle::CmdVelBack, this);
#ifdef DEBUG
  printf("Motion_nodeHandle(DEBUG)\n");
#endif
}

MotionNodeHandle::~MotionNodeHandle() {
  ros::shutdown();
#ifdef DEBUG
  printf("~Motion_nodeHandle(DEBUG)\n");
#endif
}

void MotionNodeHandle::pub_MotorEnc() {
  // geometry_msgs::Twist Enc;

  // Enc.linear.x = MotorEnc.x;
  // Enc.linear.y = MotorEnc.y;
  // Enc.angular.z = MotorEnc.yaw;
  // MotorEnc_pub.publish(Enc);
}

void MotionNodeHandle::CmdVelBack(const geometry_msgs::Twist::ConstPtr &msg) {
  this->MotionCmd.x = msg->linear.x;
  this->MotionCmd.y = msg->linear.y;
  this->MotionCmd.yaw = msg->angular.z;
#ifdef DEBUG
  printf("CmdVelBack(DEBUG)\n");
  printf("x : %f\n", msg->linear.x);
  printf("y : %f\n", msg->linear.y);
  printf("z : %f\n", msg->angular.z);
#endif
}


// void MotionNodeHandle::Set
