cmake_minimum_required(VERSION 3.0.2)
project(strategy)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  motion
)

catkin_package()
include_directories(
  ${catkin_INCLUDE_DIRS}
)

add_subdirectory(src/asr)
