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
#include <stdexcept>  // std::out_of_range
#include <string>
#include <vector>

#define DEBUG

using namespace std;

class Serial {
  // functions
 public:
  Serial(const char*, unsigned int);
  ~Serial();

 public:
  /** publish UART data:

  * start packat: 0xAA

  * 4 motor direction(1 byte ): {4'b0000, MD(1bit), MB(1bit), MC(1bit),
  MA(1bit)}

  * 4 motor speed    (8 bytes): {MA(short_uint_2bytes), MB(short_uint_2bytes),
  MC(short_uint_2bytes), MD(short_uint_2bytes)}

  * CRC (1 byte ): after adding the above 9 bytes, use the lowest byte as the
  check code

  * end packat       (1 byte ): 0xEE

  * total 12 bytes
  */
  void pub_motor_pwm(float[]);

  /* Uart資料:
  * 起始封包(1byte): 0xAA
  * 4顆馬達方向(1bytes): {4'b0000, MD(1bit), MB(1bit), MC(1bit), MA(1bit)}

  * 4顆馬達Encoder(16bytes): MA(int_4bytes), MB(int_4bytes), MC(int_4bytes),
  MD(int_4bytes)

  * 4顆馬達速度(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes),
  MC(short_uint_2bytes), MD(short_uint_2bytes)

  * 4顆馬達電壓(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes),
  MC(short_uint_2bytes), MD(short_uint_2bytes)

  * 4顆馬達電流(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes),
  MC(short_uint_2bytes), MD(short_uint_2bytes)

  * CRC(1byte): 以上41bytes相加後取最低那個Byte當檢查碼

  * 結束位元(1byte): 0xEE

  * 總共 44bytes
  * */
  bool sub_feedback();

  char* get_sub_msg();

 private:
  void build_msg(float[]);
  int unbuild_msg();
  int calculation_crc(char*);

  // variables
 public:
 private:
  const char* port = nullptr;
  int fd;
  termios opt;
  // pub msg and default values is zero
  char pub_msg[12] = {0};
  // custom pub start and end packat
  char pub_start_buf = 0xAA;
  char pub_end_buf = 0xEE;
  // sub msg and default values is zero
  char sub_msg[44] = {0};
  // custom start and end packat
  char sub_start_buf = 0xAA;
  char sub_end_buf = 0xEE;

#ifdef DEBUG
  void printf_binary(vector<string>, char*, int);
  void printf_hex(const char*, char*, int);
#endif  // DEBUG
};

#endif  // SERIAL_H
