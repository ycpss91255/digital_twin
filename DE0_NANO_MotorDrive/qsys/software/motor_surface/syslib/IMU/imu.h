/*
 * uart.h
 *
 *  Created on: 2021/5/17
 *      Author: lishyhan
 */

#ifndef IMU_H_
#define IMU_H_
/* nios2 system library */
#include <system.h>
#include <sys/alt_irq.h>
#include <priv/alt_legacy_irq.h> /* define alt_irq_register() */
#include <stdio.h>
#include <io.h>

//#define DEBUG_IMU

#define BufLength 128

/* uart structure variable */
typedef struct {

     /* Accelerometer */
     int   iAccX;               /* Accelerometer X-axis */
     int   iAccY;               /* Accelerometer Y-axis */
     int   iAccZ;               /* Accelerometer Z-axis */
     unsigned int   uiRawAcce;  /* Accelerometer raw data */
     /* Gyroscope */
     int   iGyroX;              /* Gyroscope X-axis */
     int   iGyroY;              /* Gyroscope Y-axis */
     int   iGyroZ;              /* Gyroscope Z-axis */
     unsigned int   uiRawGyro;  /* Gyroscope raw data */
     /* Magnetic */
     int   iMagnX;              /* Magnetic X-axis */
     int   iMagnY;              /* Magnetic Y-axis */
     int   iMagnZ;              /* Magnetic Z-axis */
     unsigned int   uiRawMagn;  /* Magnetic raw data */
} sIMU_s;


#endif /* IMU_H_ */
