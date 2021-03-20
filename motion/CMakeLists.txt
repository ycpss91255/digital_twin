cmake_minimum_required(VERSION 3.0.2)
project(motion)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  geometry_msgs
)
catkin_package(
 INCLUDE_DIRS include
#  LIBRARIES ${PROJECT_NAME}
#  CATKIN_DEPENDS roscpp
#  DEPENDS system_lib
)

include_directories(
  ${CMAKE_CURRENT_LIST_DIR}/include
  ${catkin_INCLUDE_DIRS}
)

add_subdirectory(src)
add_subdirectory(test)

# file(GLOB SRC_LIST "src/*.cpp")
# message("src_list = ${SRC_LIST}")

# file(GLOB TEST_LIST "test/*.cpp")
# message("test_list = ${TEST_LIST}")

# file(GLOB INCLUDE_LIST "include/motion/*.h")
# message("include_list = ${INCLUDE_LIST}")

# add_library(
#   ${PROJECT_NAME}
#   ${INCLUDE_LIST}
#   ${SRC_LIST}
#   ${TEST_LIST}
# )
