
#ifndef DEBUG_H_
    #define DEBUG_H_

//    #define _DEBUG  /* enable DEBUG function */
/* debug message */
    extern     char gc_debug_buf[1048576]; /* printf buffer */
    extern     int  gi_debug_buf_idx;
    extern     int  msglock;

    extern void DebugPrintf(const char *format, ...);
    extern void ShowDebugMesspage(void );/* show message */
    extern unsigned char uctmp[100];


    #ifdef _DEBUG
        #define LOGD(fmt, ...) DebugPrintf( sprintf(uctmp, ("[%s:%d] "fmt), __FILE__, __LINE__,  ##__VA_ARGS__))
    #else
//        #define LOGD(fmt, ...) (0)
        #define LOGD(fmt, ...)
    #endif
#endif

