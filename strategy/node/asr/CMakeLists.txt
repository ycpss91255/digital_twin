cmake_minimum_required(VERSION 3.0.2)
project(strategy)

catkin_install_python(
    PROGRAMS
    asr_cmd_val
    server
    client
    DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

