cmake_minimum_required(VERSION 3.0.2)
project(digital_twin)

# sim_control_test
set(SCT_LIST
  sim_control_test.cpp

)
add_executable(sim_control_test ${SCT_LIST})
target_link_libraries(sim_control_test ${catkin_LIBRARIES})
