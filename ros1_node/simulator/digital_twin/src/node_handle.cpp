#include "digital_twin/node_handle.h"

SimNodeHandle::SimNodeHandle(int argc, char **argv, string RobotName,
                             uint64_t MotorNum) {
  this->MotorNum = MotorNum;
  string NodeName = "digital_wheel" + to_string(MotorNum);
  this->MotorNS = "/digital" + RobotName + "/wheel" + to_string(MotorNum);
  ros::init(argc, argv, NodeName);
  init(RobotName);
}

SimNodeHandle::~SimNodeHandle() { ros::shutdown(); }

void SimNodeHandle::init(string RobotName) {
  this->n = new ros::NodeHandle();

  MotorCmd_pub =
      this->n->advertise<std_msgs::Float64>((this->MotorNS + "/command"), 1000);
  MotorFB_pub =
      this->n->advertise<std_msgs::Float64>((this->MotorNS + "/motorFB"), 1);

  string MotorStateTopicName = "/digital" + RobotName + "/joint_states";
  MotorState_sub = this->n->subscribe<sensor_msgs::JointState>(
      MotorStateTopicName, 100, &SimNodeHandle::MotorStateBack, this);

  // Real motor
  string RealMotorTopicName =
      "/real" + RobotName + "/wheel" + to_string(this->MotorNum) + "/motorFB";
  RealMotorFB_sub = this->n->subscribe<std_msgs::Float64>(
      RealMotorTopicName, 100, &SimNodeHandle::RealMotorFBBack, this);
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
  uint64_t num = this->MotorNum - 1;
  if (init) {
    this->InitPos = msg->position[num];
    init = false;
  }
  this->MotorPos = msg->position[num] - this->InitPos;

#ifdef DEBUG
  printf("MotorSpeedBack(DEBUG)\n");
  printf("Motor%ld msg Pos : %f\n", this->MotorNum, msg->position[num] - this->InitPos);
#endif
}

void SimNodeHandle::RealMotorFBBack(const std_msgs::Float64::ConstPtr &msg) {
  this->RealMotorPos = msg->data;
}

float SimNodeHandle::getMotorPos() {
  float Pos = this->MotorPos / (2 * M_PI) * 102.8;
  return Pos;
}

float SimNodeHandle::getInitPos() {
  float Pos = this->InitPos / (2 * M_PI) * 102.8;
  return Pos;
}

float SimNodeHandle::getRealMotorPos() { return this->RealMotorPos; }
