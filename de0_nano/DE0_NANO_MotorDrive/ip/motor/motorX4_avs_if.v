// ============================================================================
// Copyright (c) 2021 by TKU I.C.LAB. 
// ============================================================================
// Major Functions/Design Description:
//
//   sensor register and Motor Control, feedbkac sensor register.
//
// ============================================================================
// Revision History:
// ============================================================================
//   Ver.: |Author:      |Mod. Date:    |Changes Made:
//   V1.0  |Shih-An Li  |2021.5.4       | initial 
//   V2.0  |Shih-An Li  |2021.5.30      | add gsensor register
// ============================================================================
module motorX4_avs_if (
                // clock reset interface 
                clk,
                reset_n,
                
                // slave signal
                avs_s1_address,          // address
                avs_s1_byteenable,       // byte enable
                avs_s1_read,             // read
                avs_s1_write,            // write
                avs_s1_waitrequest,      // waitrequest
                avs_s1_readdata,         // readdata
                avs_s1_writedata,        // writedata
        
        
                // export IMU
                avs_s1_export_iIMUAcc,   /* input AcceleroMeter, 
                                          [9:0]:   x-Axis accleration 
                                          [19:10]: y-Axis accleration 
                                          [29:20]: z-Axis accleration 
                                          [31]: dval  
                                         */
                avs_s1_export_iIMUGYro,  /* input Gyroscope, 
                                          [9:0]:   x-Axis accleration 
                                          [19:10]: y-Axis accleration 
                                          [29:20]: z-Axis accleration 
                                          [31]: dval  
                                         */
                avs_s1_export_iIMUMagn,  /* input IMU Magnetic, 
                                          [9:0]:   x-Axis accleration 
                                          [19:10]: y-Axis accleration 
                                          [29:20]: z-Axis accleration 
                                          [31]: dval  
                                         */ 
                // export motor signal
                avs_s1_export_iMotorClk,        /* motor module clock */
                avs_s1_export_oPWMduty,         /* 4 motor PWM duty */
                avs_s1_export_oMotorDir,        /* export to motor driver direction */
                avs_s1_export_iMotorFifoStatus, /* motor fifo status */

                avs_s1_export_iMotorA_Encoder,  /* motor A encoder feedback counter, signed number */
                avs_s1_export_iMotorA_Speed,    /* motor A Feedback speed */
                avs_s1_export_iMotorA_Sensor,   /* {volt_t(1), Ampe_t(1), voltage, current} of motor A */
                avs_s1_export_iMotorB_Encoder,  /* motor B encoder feedback counter, signed number */
                avs_s1_export_iMotorB_Speed,    /* motor B Feedback speed */
                avs_s1_export_iMotorB_Sensor,   /* {volt_t(1), Ampe_t(1), voltage, current} of motor B */
                avs_s1_export_iMotorC_Encoder,  /* motor C encoder feedback counter, signed number */
                avs_s1_export_iMotorC_Speed,    /* motor C Feedback speed */
                avs_s1_export_iMotorC_Sensor,   /* {volt_t(1), Ampe_t(1), voltage, current} of motor C */
                avs_s1_export_iMotorD_Encoder,  /* motor D encoder feedback counter, signed number */
                avs_s1_export_iMotorD_Speed,    /* motor D Feedback speed */
                avs_s1_export_iMotorD_Sensor,   /* {volt_t(1), Ampe_t(1), voltage, current} of motor D */
                
                

                avs_s1_export_iMotorFBDirection, /* motor Feedback direction */
                avs_s1_export_oMotorCtrl         /* motor control signals 
                                                        [3:0]: clear 4motor accumulate feedback counter 
                                                        [9:8]: driver [2,1] enable/disable#
                                                 */

                );
//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================
                // clock reset interface
input               clk;
input               reset_n;
                
                // slave signal
input  [4:0]        avs_s1_address;  /* total have 32 register */
input  [3:0]        avs_s1_byteenable;
input               avs_s1_read;
input               avs_s1_write;
output reg [31:0]   avs_s1_readdata;
input  [31:0]       avs_s1_writedata;
output reg          avs_s1_waitrequest;

                // export signal
input               avs_s1_export_iMotorClk;        /* motor module clock */

output  [31:0]      avs_s1_export_oPWMduty;  /* motor pwm duty X4 
                                                [6:0]: Motor A PWM 0~100
                                                [13:7]: Motor B PWM 0~100
                                                [20:14]: Motor C PWM 0~100
                                                [27:21]: Motor D PWM 0~100
                                                [31]   : pwm duty dval trigger
                                             */ 
input   [31:0]      avs_s1_export_iIMUAcc; /* input AcceleroMeter, 
                                              [9:0]:   x-Axis accleration 
                                              [19:10]: y-Axis accleration 
                                              [29:20]: z-Axis accleration 
                                              [31]: dval  
                                             */
input   [31:0]      avs_s1_export_iIMUGYro; /* input Gyroscope, 
                                              [9:0]:   x-Axis accleration 
                                              [19:10]: y-Axis accleration 
                                              [29:20]: z-Axis accleration 
                                              [31]: dval  
                                             */
input   [31:0]      avs_s1_export_iIMUMagn; /* input IMU Magnetic, 
                                              [9:0]:   x-Axis accleration 
                                              [19:10]: y-Axis accleration 
                                              [29:20]: z-Axis accleration 
                                              [31]: dval  
                                             */                                             
output  [31:0]      avs_s1_export_oMotorDir; /* export to motor driver  direction control, 
                                                      [1:0]: Motor A direction 
                                                      [3:2]: Motor B direction 
                                                      [5:4]: Motor C direction 
                                                      [7:6]: Motor D direction 
                                             */
input   [31:0]      avs_s1_export_iMotorFifoStatus; /* motor fifo status */
input   [31:0]      avs_s1_export_iMotorA_Encoder;  /* motor A encoder feedback counter, signed number */
input   [31:0]      avs_s1_export_iMotorA_Speed;    /* motor A Feedback speed */
input   [33:0]      avs_s1_export_iMotorA_Sensor;   /* {volt_t(1), Ampe_t(1), voltage, current} of motor A */
input   [31:0]      avs_s1_export_iMotorB_Encoder;  /* motor B encoder feedback counter, signed number  */
input   [31:0]      avs_s1_export_iMotorB_Speed;    /* motor B Feedback speed */
input   [33:0]      avs_s1_export_iMotorB_Sensor;   /* {volt_t(1), Ampe_t(1), voltage, current} of motor B  */
input   [31:0]      avs_s1_export_iMotorC_Encoder;  /* motor C encoder feedback counter, signed number */
input   [31:0]      avs_s1_export_iMotorC_Speed;    /* motor C Feedback speed */
input   [33:0]      avs_s1_export_iMotorC_Sensor;   /* {volt_t(1), Ampe_t(1), voltage, current} of motor C  */
input   [31:0]      avs_s1_export_iMotorD_Encoder;  /* motor D encoder feedback counter, signed number */
input   [31:0]      avs_s1_export_iMotorD_Speed;    /* motor D Feedback speed */
input   [33:0]      avs_s1_export_iMotorD_Sensor;   /* {volt_t(1), Ampe_t(1), voltage, current} of motor D  */
input   [31:0]      avs_s1_export_iMotorFBDirection;/* motor Feedback direction */
output  [31:0]      avs_s1_export_oMotorCtrl;       /* motor control signals 
                                                        [3:0]: clear 4motor accumulate feedback counter individually
                                                        [9:8]: driver [2,1] enable/disable#
                                                        
                                                    */


///////////////////////////////////////////////////////////////////
//=============================================================================
// REG/WIRE declarations
//=============================================================================
 
 reg    [31:0]  r00PWMDUTY;          /* motor pwm duty X4 
                                        [6:0]:   motor A PWM 0~100
                                        [13:7]:  motor B PWM 0~100
                                        [20:14]: motor C PWM 0~100
                                        [27:21]: motor D PWM 0~100
                                        [31]   : pwm duty dval trigger
                                     */ 
 reg    [31:0]  r01MotorDriverDirection;   /* export to motor driver  direction control, 
                                              [1:0]: motor A 
                                              [3:2]: motor B 
                                              [5:4]: motor C
                                              [7:6]: motor D
                                     */
 reg    [31:0]  r02MotorFBDir;       /* motor Feedback direction, 
                                              [0]: motor A feedback direction, 1:CW, 0::CCW
                                              [1]: motor B feedback direction, 1:CW, 0::CCW
                                              [2]: motor C feedback direction, 1:CW, 0::CCW
                                              [3]: motor D feedback direction, 1:CW, 0::CCW
                                     */
 reg    [31:0]  r03MotorControl;     /* clear 4motor accumulate feedback counter,
                                        [0]: clear motor A feedback Accumulate counter 
                                        [1]: clear motor B feedback Accumulate counter 
                                        [2]: clear motor C feedback Accumulate counter 
                                        [3]: clear motor D feedback Accumulate counter 
                                        [30:4]: reserve.
                                        [31]: clear all fifo data;(include motor fb counter, speed, sensor fifo)
                                     */
 wire   [31:0]  w04MotorFifoStatus;     /* motor fifo status register,
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
 reg    [31:0]  r05MotorReg;        /* reserve */
 reg    [31:0]  r06MotorReg;        /* reserve */
 
 reg    [31:0]  rMotorFBCnt[3:0];   /*  reg 7: motro A feedback accumulate counter
                                        reg 12: motro A feedback accumulate counter
                                        reg 17: motro A  eedback accumulate counter
                                        reg 22: motro A feedback accumulate counter
                                    */
 wire   [31:0]  wMotorSpeed[3:0];   /* four motor Speed, [31] reflash data flag
                                         reg 8: motro A speed counter
                                        reg 13: motro B speed counter
                                        reg 18: motro C speed counter
                                        reg 23: motro D speed counter
                                    */
/*       reg 9: motro A Voltage [15:0]= {1'b0,channel[2:0], adcdata[11:0]}
        reg 14: motro B Voltage [15:0]= {1'b0,channel[2:0], adcdata[11:0]}
        reg 19: motro C Voltage [15:0]= {1'b0,channel[2:0], adcdata[11:0]}
        reg 24: motro D Voltage [15:0]= {1'b0,channel[2:0], adcdata[11:0]}
*/
/*
 *      reg 10: motro A current [15:0]= {1'b0,channel[2:0], adcdata[11:0]}
        reg 15: motro B current [15:0]= {1'b0,channel[2:0], adcdata[11:0]}
        reg 20: motro C current [15:0]= {1'b0,channel[2:0], adcdata[11:0]}
        reg 25: motro D current [15:0]= {1'b0,channel[2:0], adcdata[11:0]}
 * */
/* fifo signals */
wire    [15:0]  wMotorSensorVolt[3:0];
reg     [3:0]   rReadVoltFifo;
wire    [15:0]  wMotorSensorAmpe[3:0];
reg     [3:0]   rReadAmpeFifo;
wire    [3:0]   wSpeedFifoNotEmpty; /* speed fifo not empty */
wire    [3:0]   wVoltFifoNotEmpty;  /* vlotage fifo not empty */
wire    [3:0]   wAmpeFifoNotEmpty;  /* current fifo not empty */
//=============================================================================
// Structural coding
//=============================================================================
                // export signal
assign      avs_s1_export_oPWMduty = r00PWMDUTY;  /* motor pwm duty X4 
                                                [6:0]:   motor A PWM 0~100
                                                [13:7]:  motor B PWM 0~100
                                                [20:14]: motor C PWM 0~100
                                                [27:21]: motor D PWM 0~100
                                                [31]   : pwm duty dval trigger
                                             */ 
assign      avs_s1_export_oMotorDir = r01MotorDriverDirection; 
                                             /* export to motor driver  direction control, 
                                                      [1:0]: motor A direction
                                                      [3:2]: motor B direction
                                                      [5:4]: motor C direction
                                                      [7:6]: motor D direction
                                             */
assign      avs_s1_export_oMotorCtrl = r03MotorControl;
                                     /* clear 4motor accumulate feedback counter,
                                        [0]: clear motor A feedback Accumulate counter 
                                        [1]: clear motor B feedback Accumulate counter 
                                        [2]: clear motor C feedback Accumulate counter 
                                        [3]: clear motor D feedback Accumulate counter 
                                        [30:4]: reserve.
                                        [31]: clear all fifo data;(include motor fb counter, speed, sensor fifo)
                                     */
                                     
assign      w04MotorFifoStatus[3:0] = wSpeedFifoNotEmpty;    
assign      w04MotorFifoStatus[9:8]   = {wAmpeFifoNotEmpty[0], wVoltFifoNotEmpty[0]};
assign      w04MotorFifoStatus[11:10] = {wAmpeFifoNotEmpty[1], wVoltFifoNotEmpty[1]};    
assign      w04MotorFifoStatus[13:12] = {wAmpeFifoNotEmpty[2], wVoltFifoNotEmpty[2]};    
assign      w04MotorFifoStatus[15:14] = {wAmpeFifoNotEmpty[3], wVoltFifoNotEmpty[3]};    
assign      w04MotorFifoStatus[22:20] = {wMagnFifoNotEmpty, wGyroFifoNotEmpty, wAccFifoNotEmpty};    

                                     /* Fifo status register,
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

reg [3:0]   rTmpSpeedTrig;   /* store speed trigger */
//reg [1:0]   rDlySensor[3:0]; /* store sensor trigger */
reg [3:0]   rReadSpeedFifo;  /* readreq speed fifo */
integer I;
always@(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
        rTmpSpeedTrig <= 0; 
        rReadSpeedFifo <= 0;
        r00PWMDUTY <= 0; r01MotorDriverDirection <= 0;
        rReadAccFifo <= 0; rReadGyroFifo <= 0; rReadMagnFifo <= 0;

        r03MotorControl <=0;
        r05MotorReg <= 0; r06MotorReg <= 0;
        rReadVoltFifo <= 0; rReadAmpeFifo <= 0;
    end
    else begin
        avs_s1_waitrequest <= 0;
        /*------------ no change begin ------------*/
        rReadAccFifo <= 0; rReadGyroFifo <= 0; rReadMagnFifo <= 0;
        r00PWMDUTY <= r00PWMDUTY; rReadSpeedFifo <= 0;
        rReadVoltFifo <= 0; rReadAmpeFifo <= 0;
        r01MotorDriverDirection <= r01MotorDriverDirection;
        r03MotorControl <= r03MotorControl;
        r05MotorReg <= r05MotorReg; r06MotorReg <= r06MotorReg;
        /*------------ no change end -------------*/

//        r02MotorFBDir   <= avs_s1_export_iMotorFBDirection;
        
        /* motor feedback speed and sensor */
//        for (I=0;I<4;I=I+1) begin
////            rMotorSpeed[I] <= rMotorSpeed[I];
//            rMotorSensor[I] <= rMotorSensor[I];
//        end
        /* encoder feedback */
//        rMotorFBCnt[0] <= avs_s1_export_iMotorA_Encoder;
//        rMotorFBCnt[1] <= avs_s1_export_iMotorB_Encoder;
//        rMotorFBCnt[2] <= avs_s1_export_iMotorC_Encoder;
//        rMotorFBCnt[3] <= avs_s1_export_iMotorD_Encoder;

        /* avalon-slave proceess */
        if(avs_s1_read) begin
            case(avs_s1_address)
                0: begin   /* RW, motor pwm duty cycle register  */ 
                    avs_s1_readdata <= r00PWMDUTY;
                end
                1: begin   /* RW, export to motor driver direction control register */
                    avs_s1_readdata <= r01MotorDriverDirection;
                end
                2: begin   /* R, motor Feedback direction */ 
                    avs_s1_readdata <= avs_s1_export_iMotorFBDirection;
                end
                3: begin   /* RW, motor control register */
                    avs_s1_readdata <= r03MotorControl;
                 end
                4: begin   /* R, motor fifo status register,  */
                    avs_s1_readdata <= w04MotorFifoStatus;
                end
                5: begin   /* reserve */
                    avs_s1_readdata <= 32'hdeadbeef;
                end
                6: begin   /* reserve */
                    avs_s1_readdata <= 32'hdeadbeef;
                end
                 /* 1st motot */
                    7: begin /* 1st motor Feedback counter */
                        avs_s1_readdata <= avs_s1_export_iMotorA_Encoder;
                    end
                    8: begin /* 1st motor speed */
                        avs_s1_readdata <= wMotorSpeed[0];
                        rReadSpeedFifo[0] <= 1'b1;
//                        rMotorSpeed[0] <= 32'hdeadbeef;
                    end
                    9: begin /* 1st motor voltage */
                        avs_s1_readdata <= {20'h0, wADCVolt[0]};
                        rReadVoltFifo[0] <= 1'b1;
                    end
                    10: begin /* 1st motor current  */
                        avs_s1_readdata <= {20'h0, wADCAmpe[0]};
                        rReadAmpeFifo[0] <= 1'b1;
                    end
                    11: begin /* reserve */
                        avs_s1_readdata <= 32'hdeadbeef;
                    end
                 /* 2nd motot */
                    12: begin /* 2nd motor Feedback counter */
                        avs_s1_readdata <= avs_s1_export_iMotorB_Encoder;
                    end
                    13: begin /* 2nd motor speed */
                        avs_s1_readdata <= wMotorSpeed[1];
                        rReadSpeedFifo[1] <= 1'b1;
                     end
                    14: begin /* 2nd motor voltage */
                        avs_s1_readdata <= {20'h0, wADCVolt[1]};
                        rReadVoltFifo[1] <= 1'b1;
                    end
                    15: begin /* 2nd motor current  */
                        avs_s1_readdata <= {20'h0, wADCAmpe[1]};
                        rReadAmpeFifo[1] <= 1'b1;
                    end
                    16: begin /* reserve */
                        avs_s1_readdata <= 32'hdeadbeef;
                    end
                 /* 3rd motot */
                    17: begin /* 3rd motor Feedback counter */
                        avs_s1_readdata <= avs_s1_export_iMotorC_Encoder;
                    end
                    18: begin /* 3rd motor speed */
                        avs_s1_readdata <= wMotorSpeed[2];
                        rReadSpeedFifo[2] <= 1'b1;
                    end
                    19: begin /* 3rd motor voltage */
                        avs_s1_readdata <= {20'h0, wADCVolt[2]};
                        rReadVoltFifo[2] <= 1'b1;
                    end
                    20: begin /* 3rd motor current  */
                        avs_s1_readdata <= {20'h0, wADCAmpe[2]};
                        rReadAmpeFifo[2] <= 1'b1;
                    end
                    21: begin /* reserve */
                        avs_s1_readdata <= 32'hdeadbeef;
                    end
                 /* 4th motot */
                    22: begin /* 4th motor Feedback counter */
                        avs_s1_readdata <= avs_s1_export_iMotorD_Encoder;
                    end
                    23: begin /* 4th motor speed */
                        avs_s1_readdata <= wMotorSpeed[3];
                        rReadSpeedFifo[3] <= 1'b1;
                    end
                    24: begin /* 4th motor voltage */
                        avs_s1_readdata <= {20'h0, wADCVolt[3]};
                        rReadVoltFifo[3] <= 1'b1;
                    end
                    25: begin /* 4th motor current  */
                        avs_s1_readdata <= {20'h0, wADCAmpe[3]};
                    end
                    26: begin /* reserve */
                        avs_s1_readdata <= 32'hdeadbeef;
                    end
                29: begin /* IMU accelerometer */
                    avs_s1_readdata <= {1'b0, wAcceleroMeter[30:0]};
                    rReadAccFifo <= 1'b1;
                end
                30: begin /* IMU gyroscope */
                    avs_s1_readdata <= {1'b0, wGyro[30:0]};
                    rReadGyroFifo <= 1'b1;                
                end
                31: begin /* IMU magnetic */
                    avs_s1_readdata <= {1'b0, wMegnetic[30:0]};
                    rReadMagnFifo <= 1'b1;                
                end
            endcase  // case(avs_s1_address)
        end
        else if(avs_s1_write) begin
            case(avs_s1_address)
                0: begin    // 
                    r00PWMDUTY <= avs_s1_writedata;  /* motor pwm duty X4 
                                                        [6:0]:   Motor A PWM 0~100
                                                        [13:7]:  Motor B PWM 0~100
                                                        [20:14]: Motor C PWM 0~100
                                                        [27:21]: Motor D PWM 0~100
                                                        [31]   : PWM duty dval trigger
                                                     */ 
                end
                1: begin 
                    r01MotorDriverDirection <= avs_s1_writedata;
                end
                3: begin
                    r03MotorControl <= avs_s1_writedata;
                end

                
                /* case 2 ~ 10, only read, cant write */
             endcase //case(avs_s1_address)
        end
    end
end

/*--------- Speed Begin --------- */


    SensorFifoShowAhead #(.DW(32))
        motorAspeedfifo (
            .aclr   (r03MotorControl[31]),
            /* write side */
            .wrclk  (avs_s1_export_iMotorClk),
            .wrreq  (avs_s1_export_iMotorA_Speed[31]),
            .data   ({1'b0, avs_s1_export_iMotorA_Speed[30:0]}),
            .wrfull (),
            /* read side */
            .rdclk  (clk),
            .rdreq  (rReadSpeedFifo[0]),
            .q      (wMotorSpeed[0]),
            .rdNoEmpty(wSpeedFifoNotEmpty[0])
        );

    SensorFifoShowAhead #(.DW(32))
        motorBspeedfifoB (
            .aclr   (r03MotorControl[31]),
            /* write side */
            .wrclk  (avs_s1_export_iMotorClk),
            .wrreq  (avs_s1_export_iMotorB_Speed[31]),
            .data   ({1'b0, avs_s1_export_iMotorB_Speed[30:0]}),
            .wrfull (),
            /* read side */
            .rdclk  (clk),
            .rdreq  (rReadSpeedFifo[1]),
            .q      (wMotorSpeed[1]),
            .rdNoEmpty(wSpeedFifoNotEmpty[1])
        );

    SensorFifoShowAhead #(.DW(32))
        motorCspeedfifo (
            .aclr   (r03MotorControl[31]),
            /* write side */
            .wrclk  (avs_s1_export_iMotorClk),
            .wrreq  (avs_s1_export_iMotorC_Speed[31]),
            .data   ({1'b0, avs_s1_export_iMotorC_Speed[30:0]}),
            .wrfull (),
            /* read side */
            .rdclk  (clk),
            .rdreq  (rReadSpeedFifo[2]),
            .q      (wMotorSpeed[2]),
            .rdNoEmpty(wSpeedFifoNotEmpty[2])
        );
        
    SensorFifoShowAhead #(.DW(32))
        motorDspeedfifo (
            .aclr   (r03MotorControl[31]),
            /* write side */
            .wrclk  (avs_s1_export_iMotorClk),
            .wrreq  (avs_s1_export_iMotorD_Speed[31]),
            .data   ({1'b0, avs_s1_export_iMotorD_Speed[30:0]}),
            .wrfull (),
            /* read side */
            .rdclk  (clk),
            .rdreq  (rReadSpeedFifo[3]),
            .q      (wMotorSpeed[3]),
            .rdNoEmpty(wSpeedFifoNotEmpty[3])
        );
/*-----speed end ---------*/

/*--------- Voltage Begin --------- */
wire    [11:0] wADCVolt[3:0];
assign wADCVolt[0] = wMotorSensorVolt[0][11:0];
assign wADCVolt[1] = wMotorSensorVolt[1][11:0];
assign wADCVolt[2] = wMotorSensorVolt[2][11:0];
assign wADCVolt[3] = wMotorSensorVolt[3][11:0];

    SensorFifoShowAhead #(.DW(16))
            motorAVoltfifo (
            .aclr   (r03MotorControl[31]),
            /* write side */
            .wrclk  (avs_s1_export_iMotorClk),
            .wrreq  (avs_s1_export_iMotorA_Sensor[33]),
            .data   (avs_s1_export_iMotorA_Sensor[31:16] ),
            .wrfull (),
            /* read side */
            .rdclk  (clk),
            .rdreq  (rReadVoltFifo[0]),
            .q      (wMotorSensorVolt[0]),
            .rdNoEmpty(wVoltFifoNotEmpty[0])
        );

    SensorFifoShowAhead #(.DW(16))
            motorBVoltfifo (
            .aclr   (r03MotorControl[31]),
            /* write side */
            .wrclk  (avs_s1_export_iMotorClk),
            .wrreq  (avs_s1_export_iMotorB_Sensor[33]),
            .data   (avs_s1_export_iMotorB_Sensor[31:16]),
            .wrfull (),
            /* read side */
            .rdclk  (clk),
            .rdreq  (rReadVoltFifo[0]),
            .q      (wMotorSensorVolt[1]),
            .rdNoEmpty(wVoltFifoNotEmpty[1])
        );

    SensorFifoShowAhead #(.DW(16))
            motorCVoltfifo (
            .aclr   (r03MotorControl[31]),
            /* write side */
            .wrclk  (avs_s1_export_iMotorClk),
            .wrreq  (avs_s1_export_iMotorC_Sensor[33]),
            .data   (avs_s1_export_iMotorC_Sensor[31:16]),
            .wrfull (),
            /* read side */
            .rdclk  (clk),
            .rdreq  (rReadVoltFifo[0]),
            .q      (wMotorSensorVolt[2]),
            .rdNoEmpty(wVoltFifoNotEmpty[2])
        );
        
    SensorFifoShowAhead #(.DW(16))
            motorDVoltfifo (
            .aclr   (r03MotorControl[31]),
            /* write side */
            .wrclk  (avs_s1_export_iMotorClk),
            .wrreq  (avs_s1_export_iMotorD_Sensor[33]),
            .data   (avs_s1_export_iMotorD_Sensor[31:16]),
            .wrfull (),
            /* read side */
            .rdclk  (clk),
            .rdreq  (rReadVoltFifo[0]),
            .q      (wMotorSensorVolt[3]),
            .rdNoEmpty(wVoltFifoNotEmpty[3])
        );
/*--------- Voltage end --------- */

/*--------- current Begin --------- */
wire    [12:0] wADCAmpe[3:0];
assign wADCAmpe[0] = wMotorSensorAmpe[0][11:0];
assign wADCAmpe[1] = wMotorSensorAmpe[1][11:0];
assign wADCAmpe[2] = wMotorSensorAmpe[2][11:0];
assign wADCAmpe[3] = wMotorSensorAmpe[3][11:0];


    SensorFifoShowAhead #(.DW(16))
            motorAAmpefifo (
            .aclr   (r03MotorControl[31]),
            /* write side */
            .wrclk  (avs_s1_export_iMotorClk),
            .wrreq  (avs_s1_export_iMotorA_Sensor[32]),
            .data   (avs_s1_export_iMotorA_Sensor[15:0]),
            .wrfull (),
            /* read side */
            .rdclk  (clk),
            .rdreq  (rReadAmpeFifo[0]),
            .q      (wMotorSensorAmpe[0]),
            .rdNoEmpty(wAmpeFifoNotEmpty[0])
        );

    SensorFifoShowAhead #(.DW(16))
            motorBAmpefifo (
            .aclr   (r03MotorControl[31]),
            /* write side */
            .wrclk  (avs_s1_export_iMotorClk),
            .wrreq  (avs_s1_export_iMotorB_Sensor[32]),
            .data   (avs_s1_export_iMotorB_Sensor[15:0]),
            .wrfull (),
            /* read side */
            .rdclk  (clk),
            .rdreq  (rReadAmpeFifo[1]),
            .q      (wMotorSensorAmpe[1]),
            .rdNoEmpty(wAmpeFifoNotEmpty[1])
        );

    SensorFifoShowAhead #(.DW(16))
            motorCAmpefifo (
            .aclr   (r03MotorControl[31]),
            /* write side */
            .wrclk  (avs_s1_export_iMotorClk),
            .wrreq  (avs_s1_export_iMotorC_Sensor[32]),
            .data   (avs_s1_export_iMotorC_Sensor[15:0]),
            .wrfull (),
            /* read side */
            .rdclk  (clk),
            .rdreq  (rReadAmpeFifo[2]),
            .q      (wMotorSensorAmpe[2]),
            .rdNoEmpty(wAmpeFifoNotEmpty[2])
        );
        
    SensorFifoShowAhead #(.DW(16))
            motorDAmpefifo (
            .aclr   (r03MotorControl[31]),
            /* write side */
            .wrclk  (avs_s1_export_iMotorClk),
            .wrreq  (avs_s1_export_iMotorD_Sensor[32]),
            .data   (avs_s1_export_iMotorD_Sensor[15:0]),
            .wrfull (),
            /* read side */
            .rdclk  (clk),
            .rdreq  (rReadAmpeFifo[3]),
            .q      (wMotorSensorAmpe[3]),
            .rdNoEmpty(wAmpeFifoNotEmpty[3])
        );
/*--------- Current end --------- */

/*--------- Gsensor Begin --------- */
wire    [31:0] wAcceleroMeter, wGyro, wMegnetic;
reg     rReadAccFifo, rReadGyroFifo, rReadMagnFifo;
wire    wAccFifoNotEmpty, wGyroFifoNotEmpty, wMagnFifoNotEmpty;
 
    SensorFifoShowAhead #(.DW(32))
            AcceleroMeter (
            .aclr   (r03MotorControl[31]),
            /* write side */
            .wrclk  (avs_s1_export_iMotorClk),
            .wrreq  (avs_s1_export_iIMUAcc[31]),
            .data   (avs_s1_export_iIMUAcc),
            .wrfull (),
            /* read side */
            .rdclk  (clk),
            .rdreq  (rReadAccFifo),
            .q      (wAcceleroMeter),
            .rdNoEmpty(wAccFifoNotEmpty)
        );
        
    SensorFifoShowAhead #(.DW(32))
            Gyroscope (
            .aclr   (r03MotorControl[31]),
            /* write side */
            .wrclk  (avs_s1_export_iMotorClk),
            .wrreq  (avs_s1_export_iIMUGYro[31]),
            .data   (avs_s1_export_iIMUGYro),
            .wrfull (),
            /* read side */
            .rdclk  (clk),
            .rdreq  (rReadGyroFifo),
            .q      (wGyro),
            .rdNoEmpty(wGyroFifoNotEmpty)
        );
    SensorFifoShowAhead #(.DW(32))
            Magnetic (
            .aclr   (r03MotorControl[31]),
            /* write side */
            .wrclk  (avs_s1_export_iMotorClk),
            .wrreq  (avs_s1_export_iIMUGYro[31]),
            .data   (avs_s1_export_iIMUGYro),
            .wrfull (),
            /* read side */
            .rdclk  (clk),
            .rdreq  (rReadMagnFifo),
            .q      (wMegnetic),
            .rdNoEmpty(wMagnFifoNotEmpty)
        );
/*--------- Gsensor end --------- */
 
endmodule
