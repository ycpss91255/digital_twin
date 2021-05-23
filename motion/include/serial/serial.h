#ifndef SERIAL_H
#define SERIAL_H

#include <errno.h> /* Error number definitions */
#include <fcntl.h> /* File control definitions */
#include <stdio.h> /* Standard input/output definitions */
#include <stdlib.h>
#include <string.h>  /* String function definitions */
#include <termios.h> /* POSIX terminal control definitions */
#include <unistd.h>  /* UNIX standard function definitions */

#include <cmath>
#include <string>

#define DEBUG

using namespace std;

class Serial {
  // functions
 public:
  Serial(const char*, unsigned int);
  ~Serial();

 public:
  /*
  *@param float [] min to max

  * public UART data:

  * start packat: 0xAA

  * 4 motor direction(1 byte ): {4'b0000, MD(1bit), MB(1bit), MC(1bit),
  MA(1bit)}

  * 4 motor speed    (8 bytes): {MA(short_uint_2bytes), MB(short_uint_2bytes),
  MC(short_uint_2bytes), MD(short_uint_2bytes)}

  * CRC (1 byte ): after adding the above 9 bytes, use the lowest byte as the check code

  * end packat       (1 byte ): 0xEE

  * total 12 bytes
  */
  // AA FF FF FF EE;
  void pub_motor_pwm(float[]);

 private:
  // variables
 public:
 private:
  const char* port = nullptr;
  int fd;
  termios opt;

  // custon start and end single
  int start_buf = 0xAA;
  int end_buf = 0xEE;

#ifdef DEBUG
  void printf_binary(const char*, char);
#endif  // DEBUG
};

#endif  // SERIAL_H
