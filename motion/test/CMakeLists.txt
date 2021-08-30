cmake_minimum_required(VERSION 3.0.2)
project(motion)

# base_control_test
set(BCT_LIST
  ./motion/base_control_test.cpp
  ../src/motion/base_control.cpp
)
add_executable(base_control_test ${BCT_LIST})
target_link_libraries(base_control_test ${catkin_LIBRARIES})
add_dependencies(base_control_test ${catkin_EXPORTED_TARGETS})
add_dependencies(base_control_test ${PROJECT_NAME}_gencpp)

# node_handle_test
set(NHT_LIST
  ./motion/node_handle_test.cpp
  ../src/motion/node_handle.cpp
)
add_executable(node_handle_test ${NHT_LIST})
target_link_libraries(node_handle_test ${catkin_LIBRARIES})
add_dependencies(node_handle_test ${catkin_EXPORTED_TARGETS})
add_dependencies(node_handle_test ${PROJECT_NAME}_gencpp)

# motion_test
set(MT_LIST
  motion_test.cpp
  ../src/motion/node_handle.cpp
  ../src/motion/base_control.cpp
)
add_executable(motion_test ${MT_LIST})
target_link_libraries(motion_test ${catkin_LIBRARIES})
add_dependencies(motion_test ${catkin_EXPORTED_TARGETS})
add_dependencies(motion_test ${PROJECT_NAME}_gencpp)

# tx_serial_test
set(TST_LIST
  ./serial/tx_serial_test.cpp
  ../src/serial/serial.cpp
)
add_executable(tx_serial_test ${TST_LIST})
target_link_libraries(tx_serial_test ${catkin_LIBRARIES})
add_dependencies(tx_serial_test ${catkin_EXPORTED_TARGETS})
add_dependencies(tx_serial_test ${PROJECT_NAME}_gencpp)

# rx_serial_test
set(RST_LIST
  ./serial/rx_serial_test.cpp
  ../src/serial/serial.cpp
)
add_executable(rx_serial_test ${RST_LIST})
target_link_libraries(rx_serial_test ${catkin_LIBRARIES})
add_dependencies(rx_serial_test ${PROJECT_NAME}_gencpp)

# ros_tx_serial_test
set(RTST_LIST
  ./serial/ros_tx_serial_test.cpp
  ../src/serial/serial.cpp
  ../src/serial/node_handle.cpp
)
add_executable(ros_tx_serial_test ${RTST_LIST})
target_link_libraries(ros_tx_serial_test ${catkin_LIBRARIES})
add_dependencies(ros_tx_serial_test ${PROJECT_NAME}_gencpp)

# ros_rx_serial_test
set(RRST_LIST
  ./serial/ros_rx_serial_test.cpp
  ../src/serial/serial.cpp
  ../src/serial/node_handle.cpp
)
add_executable(ros_rx_serial_test ${RRST_LIST})
target_link_libraries(ros_rx_serial_test ${catkin_LIBRARIES})
add_dependencies(ros_rx_serial_test ${PROJECT_NAME}_gencpp)

set(PT_LIST
  ./pub_topic.cpp
)
add_executable(pub_topic ${PT_LIST})
target_link_libraries(pub_topic ${catkin_LIBRARIES})
add_dependencies(pub_topic ${PROJECT_NAME}_gencpp)
