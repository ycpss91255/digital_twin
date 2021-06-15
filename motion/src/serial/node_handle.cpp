#include "serial/node_handle.h"
SerialNodeHandle::SerialNodeHandle(int argc, char **argv,
                                   std::string NodeName) {
  ros::init(argc, argv, NodeName);
  ROS_init();
  Data_init();
}

SerialNodeHandle::~SerialNodeHandle() { ros::shutdown(); }


/**
 * @brief initial
 */
void SerialNodeHandle::ROS_init() {
  this->n = new ros::NodeHandle();
  // ROS publisher
  MotorState_pub =
      this->n->advertise<motion::MotorStates>(MOTOR_STATE_TOPIC_NAME, 1000);
  IMU_State_pub = this->n->advertise<motion::IMU>(IMU_STATE_TOPIC_NAME, 1000);
  // ROS subscriber
  MotorSpeed_sub = this->n->subscribe<motion::FourMotorCmd>(
      MOTOR_SPEED_TOPIC_NAME, 1000, &SerialNodeHandle::sub_MotorSpeed, this);
}

/**
 * @brief initial data related
 */
void SerialNodeHandle::Data_init() { this->MotorCmd.resize(4); }

/**
 * @brief publish msg to IMU_State_pub topic
 */
void SerialNodeHandle::pub_IMU_State(motion::IMU msg) {
  IMU_State_pub.publish(msg);
}

/**
 * @brief publish msg to MotorState_pub topic
 */
void SerialNodeHandle::pub_MotorState(motion::MotorStates msg) {
  MotorState_pub.publish(msg);
}

/**
 * @brief handle MotorSpeed_sub msg
 */
void SerialNodeHandle::sub_MotorSpeed(
    const motion::FourMotorCmd::ConstPtr &msg) {
  MotorCmd.at(0) = msg->w1;
  MotorCmd.at(1) = msg->w2;
  MotorCmd.at(2) = msg->w3;
  MotorCmd.at(3) = msg->w4;
}

/**
 * @brief get motor cmd
 * @return vector<float>, MotorCmd
 */
vector<float> SerialNodeHandle::get_MotorCmd() { return this->MotorCmd; }
