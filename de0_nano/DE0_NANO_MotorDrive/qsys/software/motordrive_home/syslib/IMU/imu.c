#include "imu.h"

void ReadIMU(sIMU_s *sIMU){
    unsigned int uiFifoStatus;
    int uiIMUdata, iTmp;
    uiFifoStatus = IORD(SYSREG_BASE, 4); /* read sensor fifo register */
    if(uiFifoStatus & 0x100000) { /* 20th bit, Accelerometer fifo */
        uiIMUdata = IORD(SYSREG_BASE, 29); /* read accelerometer value*/
        sIMU->uiRawAcce = uiIMUdata;    /* store raw data */
        iTmp = (int) (uiIMUdata & 0x000003FF) << 22;    /* [9:0]bit is X-asis */
        sIMU->iAccX = (int) (iTmp) >> 22;          /* X-asis */
        iTmp = (int) (uiIMUdata & 0x000FFC00) << 12;  /* [19:10]bit is Y-asis */
        sIMU->iAccY = (int) (iTmp) >> 22;          /* Y-asis */
        iTmp = (int) (uiIMUdata & 0x3FF00000) << 2; /* [29:20]bit is Z-asis */
        sIMU->iAccZ = (int) (iTmp) >> 22;          /* Z-asis */
#ifdef DEBUG_IMU
        printf("[MSG][IMU]Acce: x(%4d), Y(%4d), Z(%4d)\n",sIMU->iAccX, sIMU->iAccY, sIMU->iAccZ);
#endif
    }else{
        sIMU->uiRawAcce = 0xDeadBeef;   /* no data */
        sIMU->iAccX = 0xDeadBeef;      /* no data */
        sIMU->iAccY = 0xDeadBeef;      /* no data */
        sIMU->iAccZ = 0xDeadBeef;      /* no data */
    }
    if(uiFifoStatus & 0x200000){ /*21th bit, Gyroscope fifo */
        uiIMUdata = IORD(SYSREG_BASE, 30); /* read accelerometer value*/
        sIMU->uiRawGyro = uiIMUdata;    /* store raw data */
        iTmp = (int) (uiIMUdata & 0x000003FF) << 22;    /* [9:0]bit is X-asis */
        sIMU->iGyroX = (int) (iTmp) >> 22;               /* X-asis */
        iTmp = (int) (uiIMUdata & 0x000FFC00) << 12;    /* [19:10]bit is Y-asis */
        sIMU->iGyroY = (int) (iTmp) >> 22;               /* Y-asis */
        iTmp = (int) (uiIMUdata & 0x3FF00000) << 2;     /* [29:20]bit is Z-asis */
        sIMU->iGyroZ = (int) (iTmp) >> 22;               /* Z-asis */
//        printf("Gyro: x(%4d), Y(%4d), Z(%4d)\n",sIMU->iGyroX, sIMU->iGyroY, sIMU->iGyroZ);
    }else{
        sIMU->uiRawGyro = 0xDeadBeef;   /* no data */
        sIMU->iGyroX = 0xDeadBeef;      /* no data */
        sIMU->iGyroY = 0xDeadBeef;      /* no data */
        sIMU->iGyroZ = 0xDeadBeef;      /* no data */
    }
    if(uiFifoStatus & 0x400000){ /*22th bit, Magnetic fifo */
        uiIMUdata = IORD(SYSREG_BASE, 31); /* read Magneticmeter value*/
        sIMU->uiRawMagn = uiIMUdata;    /* store raw data */
        iTmp = (int) (uiIMUdata & 0x000003FF) << 22;    /* [9:0]bit is X-asis */
        sIMU->iMagnX = (int) (iTmp) >> 22;               /* X-asis */
        iTmp = (int) (uiIMUdata & 0x000FFC00) << 12;    /* [19:10]bit is Y-asis */
        sIMU->iMagnY = (int) (iTmp) >> 22;               /* Y-asis */
        iTmp = (int) (uiIMUdata & 0x3FF00000) << 2;     /* [29:20]bit is Z-asis */
        sIMU->iMagnZ = (int) (iTmp) >> 22;               /* Z-asis */
//        printf("Magn: x(%4d), Y(%4d), Z(%4d)\n",sIMU->iMagnX, sIMU->iMagnY, sIMU->iMagnZ);
    }else{
        sIMU->uiRawMagn = 0xDeadBeef;   /* no data */
        sIMU->iMagnX = 0xDeadBeef;      /* no data */
        sIMU->iMagnY = 0xDeadBeef;      /* no data */
        sIMU->iMagnZ = 0xDeadBeef;      /* no data */
    }
}
