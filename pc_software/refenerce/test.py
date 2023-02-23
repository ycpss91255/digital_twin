#!/usr/bin/env python3
#-*-coding:UTF-8 -*-
import socket

def socket_case(arg):
    switcher = {
        0: socket.AF_INET,
        "host": socket.AF_INET6
    }
    text = switcher.get(arg,"none")
    return text

if __name__ == '__main__':
    a = socket_case("host")
    print("1234")
    print(a)

