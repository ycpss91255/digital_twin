cmake_minimum_required(VERSION 3.0.2)
project(digital_twin)

# sim_control
set(SC_LIST
  sim_control.cpp
)
add_executable(sim_control ${SC_LIST})
target_link_libraries(sim_control ${catkin_LIBRARIES})
