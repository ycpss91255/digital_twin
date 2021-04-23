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
  std::string MotorStateTopicName = RobotNS + "/joint_states";

  MotorCmd_pub = n->advertise<std_msgs::Float64>(MotorCmdTopicName, 100);
  MotorState_sub = n->subscribe<sensor_msgs::JointState>(
      MotorStateTopicName, 100, &SimNodeHandle::MotorStateBack, this);
}

void SimNodeHandle::MotorStateBack(
    const sensor_msgs::JointState::ConstPtr &msg) {
  static bool init = true;
  if (init) {
    InitPos = msg->position[this->MotorNum];
    init = false;
  }
  MotorPos = msg->position[this->MotorNum] - InitPos;
#ifdef DEBUG
  printf("MotorSpeedBack(DEBUG)\n");
  printf("Motor%d Pos : %f\n", this->MotorNum, MotorPos);
#endif
}

void SimNodeHandle::pub_MotorCmd(float cmd) {
  std_msgs::Float64 msg;
  msg.data = cmd;
  MotorCmd_pub.publish(msg);
}
