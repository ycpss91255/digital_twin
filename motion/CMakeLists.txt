cmake_minimum_required(VERSION 3.0.2)
project(motion)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
)
catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES ${PROJECT_NAME}
#  CATKIN_DEPENDS roscpp
#  DEPENDS system_lib
)

include_directories(
  ${CMAKE_CURRENT_LIST_DIR}/include
  ${catkin_INCLUDE_DIRS}
)

file(GLOB SRC_LIST "src/*.cpp")
# message("${SRC_LIST}")
file(GLOB INCLUDE_LIST "include/*.h")
# message("${INCLUDE_LIST}")

add_library(
  ${PROJECT_NAME}
  ${INCLUDE_LIST}
  ${SRC_LIST}
)

target_link_libraries(motion ${catkin_LIBRARIES})
add_dependencies(motion ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

# add_executable(four_wheel_kinematics src/four_wheel_kinematics.cpp)
# target_link_libraries(four_wheel_kinematics ${catkin_LIBRARIES})
# add_dependencies(talker beginner_tutorials_generate_messages_cpp)

# add_executable(listener src/listener.cpp)
# target_link_libraries(listener ${catkin_LIBRARIES})
# add_dependencies(listener beginner_tutorials_generate_messages_cpp)
