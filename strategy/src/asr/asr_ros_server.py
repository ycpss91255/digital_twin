#!/usr/bin/env python3
# # -*- coding: utf-8 -*-
""" Include headers files """
from socket_class import socket_node

""" Instantiate ros socket module

The module can be connected to the ASR socket module for data transimission, and transmit the received data o the ROS Master
"""
family_type = "IPv4"
socket_type = "TCP"

if __name__ == '__main__':
    SocketNode = socket_node(family_type, socket_type)

    pass

