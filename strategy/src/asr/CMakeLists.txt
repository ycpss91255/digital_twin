cmake_minimum_required(VERSION 3.0.2)
project(strategy)

catkin_install_python(
    PROGRAMS
    socket_class.py
    server.py
    client.py
    ros_server.py
    ros_client.py
    DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

