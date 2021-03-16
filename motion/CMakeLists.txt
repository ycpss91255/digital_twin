cmake_minimum_required(VERSION 3.0.2)
project(motion)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
)
catkin_package()

include_directories(
  ${catkin_INCLUDE_DIRS}
)

# add_executable(talker src/talker.cpp)
# target_link_libraries(talker ${catkin_LIBRARIES})
# add_dependencies(talker beginner_tutorials_generate_messages_cpp)

# add_executable(listener src/listener.cpp)
# target_link_libraries(listener ${catkin_LIBRARIES})
# add_dependencies(listener beginner_tutorials_generate_messages_cpp)
