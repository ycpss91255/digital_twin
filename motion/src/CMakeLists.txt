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

# # serial
# set(S_LIST
#   motion.cpp
#   ./serial/node_handle.cpp
#   ./serial/serial.cpp
# )
# add_executable(motion ${M_LIST})
# target_link_libraries(motion ${catkin_LIBRARIES})
