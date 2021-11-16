#!/usr/bin/env python3
# # -*- coding: utf-8 -*-
""" Include ros headers files """
from re import I
import rospy
""" Include headers files """
from socket_class import socket_node
""" Include message files """
from geometry_msgs.msg import Twist


""" Instantiate ros socket module

The module can be connected to the ASR socket module for data transimission, and transmit the received data o the ROS Master
"""
family = "IPv4"
type = "TCP"

if __name__ == '__main__':
    try:
        SocketNode = socket_node("IPv4", "TCP")
        # SocketNode.server("10.42.0.2", 22)
        # rospy.init_node("asr_socket_server", anonymous=True)
        # ASR_cmd_val_pub = rospy.Publisher("motion/cmd_val", Twist, queue_size=1000)
    except rospy.ROSInterruptException:
        pass
    except KeyboardInterrupt:
        print("shutting down")

