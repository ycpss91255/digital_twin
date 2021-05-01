// --------------------------------------------------------------------
// Copyright (c) 2007 by Terasic Technologies Inc. 
// --------------------------------------------------------------------
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// --------------------------------------------------------------------
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// --------------------------------------------------------------------
#include "terasic_includes.h"
#include "I2C.h"

// Note. Remember to reset device befroe acceess I2C interface
#ifdef DEBUG_I2C
    #define I2C_DEBUG(x)    DEBUG(x)  
#else
    #define I2C_DEBUG(x)
#endif


//#define E2_I2C_SCL_BASE         PIO_ID_EEPROM_SCL_BASE
//#define E2_I2C_DAT_BASE         PIO_ID_EEPROM_DAT_BASE

//void dump_message(char *pMessage);
//#define DEBUG_DUMP dump_message

#define SDA_DIR_IN(data_base)   IOWR_ALTERA_AVALON_PIO_DIRECTION(data_base,0)
#define SDA_DIR_OUT(data_base)  IOWR_ALTERA_AVALON_PIO_DIRECTION(data_base,1) 
#define SDA_HIGH(data_base)     IOWR_ALTERA_AVALON_PIO_DATA(data_base, 1)
#define SDA_LOW(data_base)      IOWR_ALTERA_AVALON_PIO_DATA(data_base, 0)
#define SDA_READ(data_base)     IORD_ALTERA_AVALON_PIO_DATA(data_base)
#define SCL_HIGH(clk_base)     IOWR_ALTERA_AVALON_PIO_DATA(clk_base, 1)
#define SCL_LOW(clk_base)      IOWR_ALTERA_AVALON_PIO_DATA(clk_base, 0)

#define SCL_DELAY    usleep(1)


void i2c_start(alt_u32 clk_base, alt_u32 data_base);
void i2c_stop(alt_u32 clk_base, alt_u32 data_base);
bool i2c_write(alt_u32 clk_base, alt_u32 data_base, alt_u8 Data);
void i2c_read(alt_u32 clk_base, alt_u32 data_base, alt_u8 *pData, bool bAck);



bool I2C_Write(alt_u32 clk_base, alt_u32 data_base, alt_8 DeviceAddr, alt_u8 ControlAddr, alt_u8 ControlData){
    bool bSuccess = TRUE;
    //alt_u8 DeviceAddr;
    
    // device id
    //DeviceAddr = HMB_E2_I2C_ID;

    i2c_start(clk_base, data_base);
    if (!i2c_write(clk_base, data_base, DeviceAddr)){  // send ID
        bSuccess = FALSE;
        I2C_DEBUG(("I2C HMB_E2 Fail: Address NACK!\n"));
    }
    if (bSuccess && !i2c_write(clk_base, data_base, ControlAddr)){ // send sub-address
        bSuccess = FALSE;
        I2C_DEBUG(("I2C HMB_E2 Fail: SubAddress NACK!\n"));
    }            
    if (bSuccess && !i2c_write(clk_base, data_base, ControlData)){  
        bSuccess = FALSE;
        I2C_DEBUG(("I2C HMB_E2 Fail: write NACK!\n"));
    }
    i2c_stop(clk_base, data_base);
    
    usleep(7*1000); // delay to wait EE2 ready (at least 5 ms delay is required)
    
    return bSuccess;

    
}

bool I2C_Read(alt_u32 clk_base, alt_u32 data_base, alt_8 DeviceAddr, alt_u8 ControlAddr, alt_u8 *pControlData){
    bool bSuccess = TRUE;
    //alt_u8 DeviceAddr;
   
    // device id
    //DeviceAddr = HMB_E2_I2C_ID;

    i2c_start(clk_base, data_base);
    if (!i2c_write(clk_base, data_base, DeviceAddr)){  // send ID
        bSuccess = FALSE;
        I2C_DEBUG(("I2C HMB_E2 Fail: Address NACK!\n"));
    }
    if (bSuccess && !i2c_write(clk_base, data_base, ControlAddr)){ // send sub-address
        bSuccess = FALSE;
        I2C_DEBUG(("I2C HMB_E2 Fail: SubAddress NACK!\n"));
    }            
    i2c_start(clk_base, data_base);  // restart
    DeviceAddr |= 1; // Read
    if (bSuccess && !i2c_write(clk_base, data_base, DeviceAddr)){  // send id
        bSuccess = FALSE;
        I2C_DEBUG(("I2C HMB_E2 Fail: Address+1 NACK!\n"));
    }
    
    if (bSuccess){
        i2c_read(clk_base, data_base, pControlData, FALSE);  // read
    }        
    i2c_stop(clk_base, data_base);
    
    return bSuccess;
}


bool I2C_MultipleWrite(alt_u32 clk_base, alt_u32 data_base, alt_8 DeviceAddr, alt_u8 ControlAddr, alt_u8 *pData, alt_u16 len){
    bool bSuccess = TRUE;
    int i;

    i2c_start(clk_base, data_base);
    if (!i2c_write(clk_base, data_base, DeviceAddr)){  // send ID
        bSuccess = FALSE;
        I2C_DEBUG(("I2C HMB_E2 Fail: Address NACK!\n"));
    }
    if (bSuccess && !i2c_write(clk_base, data_base, ControlAddr)){ // send sub-address
        bSuccess = FALSE;
        I2C_DEBUG(("I2C HMB_E2 Fail: SubAddress NACK!\n"));
    }            
    if (bSuccess){
        for(i=0;i<len && bSuccess;i++){
            bSuccess = i2c_write(clk_base, data_base, *pData);
            pData++;
        }
        if (!bSuccess)         
            I2C_DEBUG(("I2C HMB_E2 Fail: write NACK!\n"));
    }
    i2c_stop(clk_base, data_base);
    
    usleep(7*1000); // delay to wait EE2 ready (at least 5 ms delay is required)
    
    return bSuccess;

    
}

bool I2C_MultipleRead(alt_u32 clk_base, alt_u32 data_base, alt_8 DeviceAddr, alt_u8 ControlAddr, alt_u8 *pBuf, alt_u16 len){
    int i;
    bool bSuccess = TRUE;
    
   
    // device id
    //DeviceAddr = HMB_E2_I2C_ID;

    i2c_start(clk_base, data_base);
    if (!i2c_write(clk_base, data_base, DeviceAddr)){  // send ID
        bSuccess = FALSE;
        I2C_DEBUG(("I2C HMB_E2 Fail: Address NACK!\n"));
    }
    if (bSuccess && !i2c_write(clk_base, data_base, ControlAddr)){ // send sub-address
        bSuccess = FALSE;
        I2C_DEBUG(("I2C HMB_E2 Fail: SubAddress NACK!\n"));
    }    
    if (bSuccess)        
        i2c_start(clk_base, data_base);  // restart
    DeviceAddr |= 1; // Read
    if (bSuccess && !i2c_write(clk_base, data_base, DeviceAddr)){  // send id
        bSuccess = FALSE;
        I2C_DEBUG(("I2C HMB_E2 Fail: Address+1 NACK!\n"));
    }
    
    if (bSuccess){
        for(i=0;i<len && bSuccess;i++){
            i2c_read(clk_base, data_base, pBuf, (i==(len-1))?FALSE:TRUE);  // read
            pBuf++;
        }            
    }        
    i2c_stop(clk_base, data_base);
    
    return bSuccess;    
    
}




/////////////////////////////////////////////////////////////////////////////////////////////
///////////// Interncal function (i2cXXX) body //////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////


//SDA 1->0 while SCL=1
void i2c_start(alt_u32 clk_base, alt_u32 data_base){
    
    // make sure it is in normal state
    SDA_DIR_OUT(data_base);  // data output enabled
    
    
    
    // start condition
    SDA_HIGH(data_base); // data high
    SCL_HIGH(clk_base);
    SCL_DELAY;
     
    SDA_LOW(data_base); // data low
    SCL_DELAY; 
    SCL_LOW(clk_base); // clock low
    SCL_DELAY;
}

// SDA 0->1 while SCL=1
void i2c_stop(alt_u32 clk_base, alt_u32 data_base){
    // assume SCL = 0
    
    SDA_DIR_OUT(data_base);  // data output enabled
    SDA_LOW(data_base); // Data Low
    //SCL_DELAY; 
    SCL_HIGH(clk_base);  // clock high
    SCL_DELAY; // clock high long delay
    SDA_HIGH(data_base); // data high
    SCL_DELAY; // data high delay
    

    
}

bool i2c_write(alt_u32 clk_base, alt_u32 data_base, alt_u8 Data){ // return true if device response ack
    alt_u8 Mask = 0x80;
    bool bAck;
    int i;
    
    // assume, SCL = 0
    
    SDA_DIR_OUT(data_base);  // data write mode
    
    for(i=0;i<8;i++){
        SCL_LOW(clk_base);  // new, make sure data change at clk low
        // output data on bus
        if (Data & Mask){ // there is a delay in this command
            SDA_HIGH(data_base);
        }else{    
            SDA_LOW(data_base);
        }
        Mask >>= 1; // there is a delay in this command
        // clock high
        SCL_HIGH(clk_base);
        SCL_DELAY;
        SCL_LOW(clk_base);
        SCL_DELAY;
    }
    
    //===== get ack
    SDA_DIR_IN(data_base);  // data read mode
    //SCL_DELAY;
    // clock high
    SCL_HIGH(clk_base);  // clock high
    SCL_DELAY;  // clock high delay
    bAck = SDA_READ(data_base)?FALSE:TRUE;  // get ack
    //SCL_DELAY;
    //SDA_DIR_OUT;
    SCL_LOW(clk_base); // clock low         
    SCL_DELAY; // clock low delay
    return bAck;
}    

void i2c_read(alt_u32 clk_base, alt_u32 data_base, alt_u8 *pData, bool bAck){ // return true if device response ack
    alt_u8 Data=0;
    int i;
    
    // assume SCL = low
    
    SDA_DIR_IN(data_base);  // set data read mode
    SCL_LOW(clk_base); // clock low
    SCL_DELAY; // clock low delay

    for(i=0;i<8;i++){
        Data <<= 1;
        SCL_HIGH(clk_base);  // clock high
        SCL_DELAY;
        if (SDA_READ(data_base))  // read data   
            Data |= 0x01;
        SCL_LOW(clk_base);  // clock log  
        SCL_DELAY;
    }
    
    // send ACK
    SCL_LOW(clk_base);  // new, make sure data change at clk low
    SDA_DIR_OUT(data_base);  // set data write mode
    if (bAck)
        SDA_LOW(data_base);
    else
        SDA_HIGH(data_base);
    SCL_HIGH(clk_base); // clock high
    SCL_DELAY; // clock high  delay
    SCL_LOW(clk_base); // clock low
    SCL_DELAY; // clock low delay
    SDA_LOW(data_base);  // data low
    SCL_DELAY; // data low delay
//    SDA_DIR_IN;  // set data read mode
    
    *pData = Data;
}

//==========================================================
// function for verify

bool i2c_data_verify(alt_u32 scl_base, alt_u32 sda_base, alt_u8 ControlAddr){
    bool bPass;
    const alt_8 DeviceAddr = 0xA0;
    alt_u8 OrgData, TestData, Data;
    
    TestData = alt_nticks();
    if (TestData == 0)
        TestData = 0x12;
    
    bPass = I2C_Read(scl_base, sda_base, DeviceAddr, ControlAddr, &OrgData);
    if (bPass) // write
        bPass = I2C_Write(scl_base, sda_base, DeviceAddr, ControlAddr, TestData);
    if (bPass) // read        
        bPass = I2C_Read(scl_base, sda_base, DeviceAddr, ControlAddr, &Data);
    if (bPass && (Data != TestData)) // verify
        bPass = FALSE;        
    // restore        
    if (bPass) // write back
        bPass = I2C_Write(scl_base, sda_base, DeviceAddr, ControlAddr, OrgData);
    if (bPass) // read        
        bPass = I2C_Read(scl_base, sda_base, DeviceAddr, ControlAddr, &Data);
    if (bPass && (Data != OrgData)) // verify
        bPass = FALSE; 
        
    return bPass;
}




bool I2C_Verify(alt_u32 scl_base, alt_u32 sda_base, alt_u32 size){
    bool bPass;
    if (size <= 256){
        // less or equal to 256 Bytes
        bPass = i2c_data_verify(scl_base, sda_base, 0);
        if (bPass)
            bPass = i2c_data_verify(scl_base, sda_base, size-1);
    }else{
        bPass = FALSE;
        /*
        bPass = i2cl_data_verify(scl_base, sda_base, 0);
        if (bPass)
            bPass = i2cl_data_verify(scl_base, sda_base, size-1);
            */
    }
    return bPass;
}
