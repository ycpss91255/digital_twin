#ifndef SERIAL_H
#define SERIAL_H
/*******************************
 * Include system header files
 ******************************/
#include <errno.h> /* Error number definitions */
#include <fcntl.h> /* File control definitions */
#include <stdio.h> /* Standard input/output definitions */
#include <stdlib.h>
#include <sys/signal.h>
#include <sys/types.h>
#include <termios.h> /* POSIX terminal control definitions */
#include <unistd.h>  /* UNIX standard function definitions */

#include <charconv>     // Char conversion
#include <cmath>
#include <iostream>
#include <stdexcept>    // std::out_of_range
#include <string>
#include <vector>
/*******************************
 ** Include msg header files
 ******************************/
#include "motion/IMU.h"
#include "motion/MotorStates.h"
/*******************************
 * Include header files
 ******************************/
#include "serial/parameter.h"
/*******************************
 * Define
 ******************************/
#define _POSIX_SOURCE 1 /* POSIX compliant source */

#define DEBUG
#define P_PUBLISH
#define P_SUBSCRIBE

using namespace std;
/*******************************
 ** Function
 ******************************/
// Initial function
void SerialInit(const char*, uint32_t);
void DataInit();
void SerialClose();

// Publish and subscribe functions
/** 起始封包(1byte): 0xAA

* 狀態位元(1Byte): bit0: 上一筆的Nios的TX資料 CRC有錯

* 4顆馬達方向(1bytes): {4'b0000, MD(1bit), MC(1bit), MB(1bit), MA(1bit)}

* 4顆馬達速度(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes),
MC(short_uint_2bytes), MD(short_uint_2bytes)

* CRC (1 byte ): 所有資料的 bytes 相加後取最低的 Byte 當檢查碼，不包含(封包頭)

* 結束位元(1byte): 0xEE

* 以上host封包總共13Bytes
*/

void pub_MotorSpeed(vector<float>&);
/** 起始封包(1byte): 0xAA

* TimeStamp(3Byte): 時間戳記(MSB,...,LSB)

* 狀態位元(1Byte): bit0: 上一筆的Host的TX資料 CRC有錯

* 4顆馬達PWM(4bytes): MA(1Bytes), MB(1Bytes), MC(1Bytes), MD(1Bytes)

* 4顆馬達方向(1bytes): {4'b0000, MD(1bit), MC(1bit), MB(1bit), MA(1bit)}

* 4顆馬達Encoder(16bytes): MA(int_4bytes), MB(int_4bytes), MC(int_4bytes),
MD(int_4bytes)

* 4顆馬達速度(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes),
MC(short_uint_2bytes), MD(short_uint_2bytes)
* MSB為資料是否有更新(max +-31)

* 4顆馬達電壓(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes),
MC(short_uint_2bytes), MD(short_uint_2bytes)
* 2850 = 11.87

* 4顆馬達電流(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes),
MC(short_uint_2bytes), MD(short_uint_2bytes)
* 70 max

* IMU Accelerometer(4Bytes): {Z[29:20],Y[19:10],X[9:0]}

* IMU GyroScope(4Bytes): {Z[29:20],Y[19:10],X[9:0]}

* IMU Magneticmeter(4Bytes): {Z[29:20],Y[19:10],X[9:0]}

* CRC(1byte): 以上49bytes相加後取最低那個Byte當檢查碼，不包含(封包頭)

* 結束位元(1byte): 0xEE

* 以上Nios封包總共64Bytes
*/
int sub_FeedBack();

// Support functions
vector<uint8_t> BuildMsg(vector<float>&);
void unbuild_msg();
int check_msg();
uint8_t calculation_crc(vector<uint8_t>&);
static void signal_handler_IO(int); /* definition of signal handler */
void printf_hex(vector<uint8_t>&);
void printf_hex(vector<uint8_t>&, const char*);

// get functions
vector<uint8_t> get_sub_msg();
motion::IMU get_IMU_data();
motion::MotorStates get_MotorStates(int);

#endif  // SERIAL_H
