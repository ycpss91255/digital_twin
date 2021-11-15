#!/usr/bin/env python3
# # -*- coding: utf-8 -*-
""" Include headers files """
from socket_class import socket_node

""" Instantiate ros socket module

The module can be connected to the ASR socket module for data transimission, and transmit the received data o the ROS Master
"""

if __name__ == '__main__':
    socket_class = socket_node()
    pass

