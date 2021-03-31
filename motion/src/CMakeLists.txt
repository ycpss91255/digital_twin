cmake_minimum_required(VERSION 3.0.2)
project(motion)

# motion
set(M_LIST
  motion.cpp
  ../src/node_handle.cpp
  ../src/base_control.cpp
)
add_executable(motion ${M_LIST})
target_link_libraries(motion ${catkin_LIBRARIES})
