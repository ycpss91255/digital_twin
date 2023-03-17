#include "motion/node_handle.h"

MotionNodeHandle::MotionNodeHandle(int argc, char **argv, std::string NodeName) {
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
  MotorSpeed_pub = n->advertise<motion::FourMotorCmd>(MOTOR_SPEED_TOPIC_NAME, 1000);
  CmdVal_sub = n->subscribe<geometry_msgs::Twist>(
      MOTION_TOPIC_NAME, 1000, &MotionNodeHandle::CmdVelBack, this);

#ifdef DEBUG
  printf("Motion_nodeHandle(DEBUG)\n");
#endif
}

void MotionNodeHandle::pub_MotorEnc(motion::FourMotorCmd Curr) {
  motion::FourMotorCmd EncMsg;

  EncMsg.w1 = Curr.w1;
  EncMsg.w2 = Curr.w2;
  EncMsg.w3 = Curr.w3;
  EncMsg.w4 = Curr.w4;
  MotorEnc_pub.publish(EncMsg);

#ifdef DEBUG
  printf("pub_MotorEnc(DEBUG)\n");
  printf("w1 : %f\n", EncMsg.w1);
  printf("w2 : %f\n", EncMsg.w2);
  printf("w3 : %f\n", EncMsg.w3);
  printf("w4 : %f\n", EncMsg.w4);
#endif
}

void MotionNodeHandle::pub_MotorSpeed(motion::FourMotorCmd Speed) {
  motion::FourMotorCmd SpeedMsg;

  SpeedMsg.w1 = Speed.w1;
  SpeedMsg.w2 = Speed.w2;
  SpeedMsg.w3 = Speed.w3;
  SpeedMsg.w4 = Speed.w4;
  MotorSpeed_pub.publish(SpeedMsg);

#ifdef DEBUG
  printf("pub_MotorEnc(DEBUG)\n");
  printf("w1 : %f\n", SpeedMsg.w1);
  printf("w2 : %f\n", SpeedMsg.w2);
  printf("w3 : %f\n", SpeedMsg.w3);
  printf("w4 : %f\n", SpeedMsg.w4);
#endif
}

void MotionNodeHandle::CmdVelBack(const geometry_msgs::Twist::ConstPtr &msg) {
  this->MotionCmd.linear.x = msg->linear.x;
  this->MotionCmd.linear.y = msg->linear.y;
  this->MotionCmd.angular.z = msg->angular.z;

#ifdef DEBUG
  printf("CmdVelBack(DEBUG)\n");
  printf("x : %f\n", msg->linear.x);
  printf("y : %f\n", msg->linear.y);
  printf("z : %f\n", msg->angular.z);
#endif
}
