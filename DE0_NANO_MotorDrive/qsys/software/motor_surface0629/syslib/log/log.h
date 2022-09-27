/* 分模組輸出Debug
       分模組的原理和分級別的原理基本相同，可以將兩者結合起來，實現更細分的控制。
*/
#ifndef __LOG_H__
    #define __LOG_H__

    #define USE_LOG_TIME

    #include <stdio.h>
    #include <system.h>

    char g_log_buf[1048576]; /* store all message */
/*  如果需要除錯資訊請使用該巨集，如果想取消除錯資訊，請註釋掉或者*/
    #define USE_SUB_MODULE
    #define     USE_LOG_MODULE  /* export log with module */
    #define     USE_LOG_FILE    /* export log to file */
    #define     USE_LOG_StdOut  /* export log to standard output */


    typedef unsigned int uint;
    typedef unsigned char uchar;

    typedef enum
    {
        LOG_M_MAIN = 0,   /* 0, 主程式  */
        LOG_M_INIT,       /* 1, 初始化  */
        LOG_M_UART,       /* 2, UART模組 */
        LOG_M_TIMER,      /* 3, Timer模組 */
        LOG_M_LED,        /* 4, LED 模組 */
        LOG_M_MOTOR,      /* 5, 馬達模組 */
        LOG_M_PID,        /* 6, PID控制器模組 */
        LOG_M_MAX         /* 7*/
    } LOG_MODULE;

    typedef enum
    {
        LOG_T_INFO  = 0x01,   /* information */
        LOG_T_DEBUG = 0x02,   /* Debug message */
        LOG_T_WARNING = 0x04, /* Warning message */
        LOG_T_ERROR = 0x08,   /* Error message */
        LOG_T_ALL   = 0xff    /* ALL message */
    } LOG_TAG;

    void log_set_level(const uint mod, const uchar level);             /* 設定列印級別 */
    void log_p(const uint mod, const uchar level,const char *, ...);   /* 帶級別的列印 */


    #if defined(USE_LOG_MODULE)
        #define log_fl(MOD, LEVEL, FORMAT, ARGS...) \
        log_p(MOD, LEVEL, "[%s][%s][%d] "FORMAT, __FILE__, __FUNCTION__, __LINE__, ##ARGS )
    #elif defined(USE_LOG_FILE)
        #define log_fl(MOD, LEVEL, FORMAT, ARGS...) \
        log_p(MOD, LEVEL, "[%s][%s][%d] "FORMAT, __FILE__, __FUNCTION__, __LINE__, ##ARGS )
    #else
        #define log_fl(LEVEL, FORMAT, ARGS...) \
        log_p(LEVEL,"[%s][%s][%d] "FORMAT, __FILE__, __FUNCTION__, __LINE__, ##ARGS )
    #endif

#endif
