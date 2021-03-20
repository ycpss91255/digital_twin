cmake_minimum_required(VERSION 3.0.2)
project(motion)

# base_control_test
set(BCT_LIST
  base_control_test.cpp
  ../src/base_control.cpp
)
add_executable(base_control_test ${BCT_LIST})
target_link_libraries(base_control_test ${catkin_LIBRARIES})
