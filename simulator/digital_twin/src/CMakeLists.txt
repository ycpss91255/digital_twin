cmake_minimum_required(VERSION 3.0.2)
project(digital_twin)

# sim_control
set(NodeList_1
  motor_node.cpp
  node_handle.cpp
)
add_executable(motor_control ${NodeList_1})
target_link_libraries(motor_control ${catkin_LIBRARIES})
