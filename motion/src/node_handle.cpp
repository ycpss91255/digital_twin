#include "motion/node_handle.h"

MotionNodeHandle::MotionNodeHandle(int argc, char **argv,
                                   std::string NodeName) {
  ros::init(argc, argv, NodeName);
  init();
}

MotionNodeHandle::~MotionNodeHandle() {
  ros::shutdown();

#ifdef DEBUG
  printf("~Motion_nodeHandle(DEBUG)\n");
#endif
}

void MotionNodeHandle::init() {
  this->n = new ros::NodeHandle();
  MotorEnc_pub = n->advertise<motion::MotorData>(motor_enc_topic_name, 1000);
  MotorSpeed_pub = n->advertise<motion::MotorData>(motor_enc_topic_name, 1000);
  CmdVal_sub = n->subscribe<geometry_msgs::Twist>(
      motion_topic_name, 1000, &MotionNodeHandle::CmdVelBack, this);

#ifdef DEBUG
  printf("Motion_nodeHandle(DEBUG)\n");
#endif
}

void MotionNodeHandle::pub_MotorEnc(RobotSpeed Curr) {
  motion::MotorData Enc;

  Enc.w1 = Curr.w1;
  Enc.w2 = Curr.w2;
  Enc.w3 = Curr.w3;
  Enc.w4 = Curr.w4;
  MotorEnc_pub.publish(Enc);

#ifdef DEBUG
  printf("pub_MotorEnc(DEBUG)\n");
  printf("w1 : %f\n", Enc.w1);
  printf("w2 : %f\n", Enc.w2);
  printf("w3 : %f\n", Enc.w3);
  printf("w4 : %f\n", Enc.w4);
#endif
}

void MotionNodeHandle::pub_MotorSpeed(RobotSpeed Curr) {}

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
