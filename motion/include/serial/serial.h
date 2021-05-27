#ifndef SERIAL_H
#define SERIAL_H

#include <errno.h> /* Error number definitions */
#include <fcntl.h> /* File control definitions */
#include <stdio.h> /* Standard input/output definitions */
#include <stdlib.h>
#include <termios.h> /* POSIX terminal control definitions */
#include <unistd.h>  /* UNIX standard function definitions */

#include <cmath>
#include <iostream>
#include <stdexcept>  // std::out_of_range
#include <string>
#include <vector>

#include "serial/parameter.h"

// #define DEBUG
#define P_PUBLISH
#define P_SUBSCRIBE

using namespace std;

// TODO: char* array convert to char vector
class Serial {
  // functions
 public:
  Serial(const char*, uint32_t);
  ~Serial();

 public:
  /** 起始封包(1byte): 0xAA

  * 4顆馬達方向(1bytes): {4'b0000, MD(1bit), MB(1bit), MC(1bit), MA(1bit)}

  * 4顆馬達速度(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes),
  MC(short_uint_2bytes), MD(short_uint_2bytes)

  * 狀態位元(1Byte): bit0: 上一筆的Nios的TX資料 CRC有錯

  * CRC (1 byte ): 所有資料的 bytes 相加後取最低的 Byte 當檢查碼，不包含(封包頭)

  * 結束位元(1byte): 0xEE

  * 以上host封包總共13Bytes
  */
  void pub_motor_pwm(vector<float>&);

  /** 起始封包(1byte): 0xAA

  * TimeStamp(3Byte): 時間戳記(MSB,...,LSB)

  * 4顆馬達PWM(4bytes): PWMA(1Bytes), PWMB(1Bytes), PWMC(1Bytes), PWMD(1Bytes)

  * 4顆馬達方向(1bytes): {4'b0000, MD(1bit), MB(1bit), MC(1bit), MA(1bit)}

  * 4顆馬達Encoder(16bytes): MA(int_4bytes), MB(int_4bytes), MC(int_4bytes),
  MD(int_4bytes)

  * 4顆馬達速度(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes),
  MC(short_uint_2bytes), MD(short_uint_2bytes)

  * 4顆馬達電壓(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes),
  MC(short_uint_2bytes), MD(short_uint_2bytes)

  * 4顆馬達電流(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes),
  MC(short_uint_2bytes), MD(short_uint_2bytes)

  * 狀態位元(1Byte): bit0: 上一筆的Host的TX資料 CRC有錯

  * CRC(1byte): 以上49bytes相加後取最低那個Byte當檢查碼，不包含(封包頭)

  * 結束位元(1byte): 0xEE

  * 以上Nios封包總共52Bytes
  */
  int sub_feedback();

  vector<uint8_t> get_sub_msg();

 private:
  void serial_init(const char*, uint32_t);
  void data_init();

  void build_msg(vector<float>&);
  int check_msg();
  uint8_t calculation_crc(vector<uint8_t>&);

  void unbuild_msg();
  void printf_hex(const char*, vector<uint8_t>&);
  // variables
 public:
 private:
  int fd;
  termios opt;

  vector<uint8_t> pub_msg;
  vector<uint8_t> sub_msg;

  // // sub msg and default values is zero
  // char sub_msg[SUB_MSG_LEN] = {0};
  // // custom start and end packet
  // char sub_start_buf = 0xAA;
  // char sub_end_buf = 0xEE;

  int tmp_msg_len = 0;
  bool sub_start_flag = false;
  char check_status = 0x00;
};

#endif  // SERIAL_H
