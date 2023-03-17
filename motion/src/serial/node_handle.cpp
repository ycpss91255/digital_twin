#include "serial/node_handle.h"

/**
 * @brief Build serial node handler
 * @param NodeName ROS node name
 * @param mode is TX_MODE or RX_MODE
 */
SerialNodeHandle::SerialNodeHandle(int argc, char **argv, std::string NodeName,
                                   bool mode) {
  ros::init(argc, argv, NodeName);
  ROS_init(mode);
  Data_init();
}

/**
 * @brief Unbuild Serial node handler
 */
SerialNodeHandle::~SerialNodeHandle() { ros::shutdown(); }

/**
 * @brief initial ROS related stuff
 * @param mode is TX_MODE or RX_MODE
 */
void SerialNodeHandle::ROS_init(bool mode) {
  this->n = new ros::NodeHandle();
  if (mode == RX_MODE) {
    MotorState_pub.resize(4);
    for (int i = 0; i < 4; i++) {
      MotorState_pub.at(i) = this->n->advertise<motion::MotorStates>(
          MOTOR_STATE_TOPIC_NAME + to_string(i), 1000);
    }
    IMU_State_pub = this->n->advertise<motion::IMU>(IMU_STATE_TOPIC_NAME, 1000);
  }
  if (mode == TX_MODE) {
    MotorSpeed_sub = this->n->subscribe<motion::FourMotorCmd>(
        MOTOR_SPEED_TOPIC_NAME, 1000, &SerialNodeHandle::sub_MotorSpeed, this);
  }
  if (mode != TX_MODE && mode != RX_MODE) {
    printf("Node mode is not TX_MODE or RX_MODE\n");
    exit(EXIT_FAILURE);
  }
}

/**
 * @brief initial data related stuff
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
void SerialNodeHandle::pub_MotorState(int num, motion::MotorStates msg) {
  MotorState_pub.at(num).publish(msg);
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
