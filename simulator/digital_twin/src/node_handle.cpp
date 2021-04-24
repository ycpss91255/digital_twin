#include "digital_twin/node_handle.h"

SimNodeHandle::SimNodeHandle(int argc, char **argv, std::string RobotNS,
                             int MotorNum) {
  std::string NodeName = "sim_Motor" + std::to_string(MotorNum);

  ros::init(argc, argv, NodeName);
  init(RobotNS, MotorNum);
}

SimNodeHandle::~SimNodeHandle() {
  ros::shutdown();

#ifdef DEBUG
  printf("~SimNodeHandle(DEBUG)\n");
#endif
}

void SimNodeHandle::init(std::string RobotNS, int MotorNum) {
  this->MotorNum = MotorNum - 1;
  this->n = new ros::NodeHandle();
  std::string MotorCmdTopicName =
      RobotNS + "/wheel" + std::to_string(MotorNum) + "/command";
  std::string MotorFBTopicName =
      RobotNS + "/wheel" + std::to_string(MotorNum) + "/motorFB";

  std::string MotorStateTopicName = RobotNS + "/joint_states";

  MotorCmd_pub = n->advertise<std_msgs::Float64>(MotorCmdTopicName, 100);
  MotorFB_pub = n->advertise<std_msgs::Float64>(MotorFBTopicName, 100);

  MotorState_sub = n->subscribe<sensor_msgs::JointState>(
      MotorStateTopicName, 100, &SimNodeHandle::MotorStateBack, this);

  // real motor
  std::string RealMotorFBTopicName = "real/robot/wheel1/motorFB";

  RealMotorFB_sub = n->subscribe<std_msgs::Float64>(
      RealMotorFBTopicName, 100, &SimNodeHandle::MotorFBBack, this);
}

void SimNodeHandle::pub_MotorCmd(float cmd) {
  std_msgs::Float64 msg;
  msg.data = cmd;
  MotorCmd_pub.publish(msg);
}
// pub enc
void SimNodeHandle::pub_MotorFB(float motorFB) {
  std_msgs::Float64 msg;
  msg.data = motorFB;
  MotorFB_pub.publish(msg);
}

void SimNodeHandle::MotorStateBack(
    const sensor_msgs::JointState::ConstPtr &msg) {
  static bool init = true;
  if (init) {
    this->InitPos = msg->position[this->MotorNum];
    init = false;
  }
  this->MotorPos = msg->position[this->MotorNum] - this->InitPos;
#ifdef DEBUG
  printf("MotorSpeedBack(DEBUG)\n");
  printf("Motor%d Pos : %f\n", this->MotorNum, MotorPos);
#endif
}

void SimNodeHandle::MotorFBBack(const std_msgs::Float64::ConstPtr &msg) {
  this->RealMotorFB = msg->data;
}
