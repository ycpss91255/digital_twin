#include "motion/node_handle.h"
MotionNodeHandle::MotionNodeHandle(int argc, char **argv) {}

MotionNodeHandle::~MotionNodeHandle() {
  ros::shutdown();
#ifdef DEBUG
  std::cout << "~Motion_nodeHandle(DEBUG)\n";
#endif
}
