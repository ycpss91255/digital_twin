cmake_minimum_required(VERSION 3.0.2)
project(digital_twin)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  geometry_msgs
  sensor_msgs
  motion
)

catkin_package()

include_directories(
  ${CMAKE_CURRENT_LIST_DIR}/include
  ${catkin_INCLUDE_DIRS}
)

add_subdirectory(src)
