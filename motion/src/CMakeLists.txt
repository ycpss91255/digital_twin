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
add_dependencies(motion ${catkin_EXPORTED_TARGETS})
add_dependencies(motion ${PROJECT_NAME}_gencpp)

# serial_tx
set(ST_LIST
  ./serial/serial_tx.cpp
  ./serial/serial.cpp
  ./serial/node_handle.cpp
)
add_executable(serial_tx ${ST_LIST})
target_link_libraries(serial_tx ${catkin_LIBRARIES})
add_dependencies(serial_tx ${PROJECT_NAME}_gencpp)

# serial_rx
set(SR_LIST
  ./serial/serial_rx.cpp
  ./serial/serial.cpp
  ./serial/node_handle.cpp
)
add_executable(serial_rx ${SR_LIST})
target_link_libraries(serial_rx ${catkin_LIBRARIES})
add_dependencies(serial_rx ${PROJECT_NAME}_gencpp)
