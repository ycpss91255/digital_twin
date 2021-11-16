#!/usr/bin/env python3
# -*- coding: utf-8 -*-

""" Include system files """
import sys
import socket

""" python socket module

Module can use host, IPv4 or IPv6 as socket
"""


class socket_node(object):
    def __init__(self, family: str = "IPv4", type: str = "TCP"):
        """ Create socket interface

        If the creation fails, the program will be closed

        Args:
            family: Divided into host, IPv4, IPv6
            type: Divided into TCP/UDP
        """

        family_switcher = {
            "host": socket.AF_UNIX,
            "IPv4": socket.AF_INET,
            "IPv6": socket.AF_INET6
        }
        type_switcher = {
            "TCP": socket.SOCK_STREAM,
            "UDP": socket.SOCK_DGRAM
        }
        socket_family = family_switcher.get(family, "none")
        socket_type = type_switcher.get(type, "none")

        if socket_family == "none":
            sys.exit("Socket family value is not correct")
        elif socket_type == "none":
            sys.exit("Socket type value is not correct")
        else:
            self.s = socket.socket(socket_family, socket_type)

    def server(self, host: "x.x.x.x", port: int, conn_num: int = 1):
        """ Set the socket module type to the server

        Args:
            host: Server IP address
            port: Server port number
            conn_num: client connection number
        """
        # TODO : check host and port is correct
        self.s.bind((host, port))
        self.s.listen(conn_num)
        self.type = "server"
        print('server start at: %s:%s' % (host, port))
        print('wait for connection...')

        self.client_conn, self.client_addr = self.s.accept()
        print("Connected by " + str(self.client_addr))

    def client(self, host: "x.x.x.x", port: int):
        """ Set the socket module type to the client

        Args:
            host: Server IP address
            port: Server port number
        """
        self.type = "client"
        self.s.connect((self.host, self.port))

    def publish(self, msg: str):
        """ Publish a message

        Args:
            msg: Message waiting to be published
        """

        if self.type == "server":
            self.client_conn.send(msg.encode)
        elif self.type == "client":
            self.s.send(msg.encode)

    def subscribe(self, msg_len: int = 1024):
        """ Wait for input message and decode message

        Args:
            msg_len: Message max length

        Return:
            Decode message
        """

        if self.type == "server":
            self.client_conn.recv(msg_len)
        elif self.type == "client":
            self.s.recv(msg_len)

    def close(self):
        """ Close socket interface """

        if self.type == "server":
            self.client_conn.close()
        elif self.type == "client":
            self.s.close()
