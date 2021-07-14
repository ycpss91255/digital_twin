cmake_minimum_required(VERSION 3.0.2)
project(digital_twin)

# sim_control
set(NodeList_1
  motor_node.cpp
  node_handle.cpp
  motor_control.cpp
)
add_executable(motor_control ${NodeList_1})
target_link_libraries(motor_control ${catkin_LIBRARIES})

# sim_control
set(NodeList_2
  data_handle.cpp
)
add_executable(data_handle ${NodeList_2})
target_link_libraries(data_handle ${catkin_LIBRARIES})

# sim_roobot_control
set(NodeList_3
  robot_control.cpp
)
add_executable(robot_control ${NodeList_3})
target_link_libraries(robot_control ${catkin_LIBRARIES})
