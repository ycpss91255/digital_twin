cmake_minimum_required(VERSION 3.0.2)
project(digital_twin)

# node_handle_test
set(NHT_LIST
  node_handle_test.cpp
  ../src/node_handle.cpp
)
add_executable(node_handle_test ${NHT_LIST})
target_link_libraries(node_handle_test ${catkin_LIBRARIES})
