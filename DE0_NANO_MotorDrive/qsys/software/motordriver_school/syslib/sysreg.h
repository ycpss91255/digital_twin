/*
 * sysreg.h
 *
 *  Created on: 2021/6/1
 *      Author: lishyhan
 */

#ifndef SYSREG_H_
#define SYSREG_H_

#define  Reg0   r00PWMDUTY          /* motor pwm duty X4
                                        [6:0]: Motor A PWM 0~100
                                        [13:7]: Motor B PWM 0~100
                                        [20:14]: Motor C PWM 0~100
                                        [27:21]: Motor D PWM 0~100
                                        [31]   : pwm duty dval trigger
                                     */
#define  Reg1   r01MotorDriverDirection /* motor driver board direction control */
                                        /* export to motor driver  direction control,
                                              [1:0]: motor A
                                              [3:2]: motor B
                                              [5:4]: motor C
                                              [7:6]: motor D
                                        */
#define  Reg2   r02MotorFBDirection  /* motor Feedback direction,
                                          [0]: motor A feedback direction, 1:CW, 0::CCW
                                          [1]: motor B feedback direction, 1:CW, 0::CCW
                                          [2]: motor C feedback direction, 1:CW, 0::CCW
                                          [3]: motor D feedback direction, 1:CW, 0::CCW
                                     */
#define  Reg3   r03MotorControl      /* clear 4motor accumulate feedback counter,
                                        [0]: clear motor A feedback Accumulate counter
                                        [1]: clear motor B feedback Accumulate counter
                                        [2]: clear motor C feedback Accumulate counter
                                        [3]: clear motor D feedback Accumulate counter
                                        [30:4]: reserve.
                                        [31]: clear all fifo data;(include motor fb counter, speed, sensor fifo)
                                     */
#define  Reg4   r04MotorFifoStatus     /* motor fifo status register,
                                        [0]:  Motor A Speed fifo status, (1: indicated fifo not empty)
                                        [1]:  Motor B Speed fifo status, (1: indicated fifo not empty)
                                        [2]:  Motor C Speed fifo status, (1: indicated fifo not empty)
                                        [3]:  Motor D Speed fifo status, (1: indicated fifo not empty)
                                        [7:4] reserve
                                        [8]:  Motor A voltage sensor fifo status, (1: indicated fifo not empty)
                                        [9]:  Motor A current sensor fifo status, (1: indicated fifo not empty)
                                        [10]: Motor B voltage sensor fifo status, (1: indicated fifo not empty)
                                        [11]: Motor B current sensor fifo status, (1: indicated fifo not empty)
                                        [12]: Motor C voltage sensor fifo status, (1: indicated fifo not empty)
                                        [13]: Motor C current sensor fifo status, (1: indicated fifo not empty)
                                        [14]: Motor D voltage sensor fifo status, (1: indicated fifo not empty)
                                        [15]: Motor D current sensor fifo status, (1: indicated fifo not empty)
                                        [19:16] reserve
                                        [20]: IMU Accelerometer fifo status, (1: indicated fifo not empty)
                                        [21]: IMU GyroScope fifo status, (1: indicated fifo not empty)
                                        [22]: IMU Magnetic fifo status, (1: indicated fifo not empty)
                                        [31:23] reserve

                                     */
#define  Reg5   r05MotorReg     /* reserve */
#define  Reg6   r06MotorReg     /* reserve */
/* motor A*/
    #define  Reg7   r07MotorA_Encoder   /* motor A encoder feedback counter, signed number */
    #define  Reg8   r08MotorA_Speed     /* motor A Feedback speed */
    #define  Reg9   r09MotorA_Volt
    #define  Reg10  r10MotorA_Ampe
    #define  Reg11  r11MotorReg     /* reserve */
/* motor B */
    #define  Reg12  r12MotorB_Encoder
    #define  Reg13  r13MotorB_Speed
    #define  Reg14  r14MotorB_Volt
    #define  Reg15  r15MotorB_Ampe
    #define  Reg16  r16MotorReg     /* reserve */
/* motor C */
    #define  Reg17  r17MotorC_Encoder
    #define  Reg18  r18MotorC_Speed
    #define  Reg19  r19MotorC_Volt
    #define  Reg20  r20MotorC_Ampe
    #define  Reg21  r21MotorReg     /* reserve */
/* motor D */
    #define  Reg22  r22MotorD_Encoder
    #define  Reg23  r23MotorD_Speed
    #define  Reg24  r24MotorD_Volt
    #define  Reg25  r25MotorD_Ampe
    #define  Reg26  r26MotorReg     /* reserve */
/* reserve */
#define  Reg27  r00PWMDUTY
#define  Reg28  r00PWMDUTY
/* IMU */
#define  Reg29  r29IMUAcce  /* input AcceleroMeter,
                              [9:0]:   x-Axis accleration
                              [19:10]: y-Axis accleration
                              [29:20]: z-Axis accleration
                              [31]: dval
                            */
#define  Reg30  r30IMUGyro  /* input Gyroscope,
                              [9:0]:   x-Axis accleration
                              [19:10]: y-Axis accleration
                              [29:20]: z-Axis accleration
                              [31]: dval
                             */
#define  Reg31  r31IMUMagn  /* input IMU Magnetic,
                              [9:0]:   x-Axis accleration
                              [19:10]: y-Axis accleration
                              [29:20]: z-Axis accleration
                              [31]: dval
                             */


#endif /* SYSREG_H_ */
