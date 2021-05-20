cmake_minimum_required(VERSION 3.0.2)
project(motion)

# motion
set(M_LIST
  motion.cpp
  ./motion/node_handle.cpp
  ./motion/base_control.cpp
)
add_executable(motion ${M_LIST})
target_link_libraries(motion ${catkin_LIBRARIES})
