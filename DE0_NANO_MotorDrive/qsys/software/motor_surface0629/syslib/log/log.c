#include "log.h"
#include <stdarg.h>
#include <string.h>
#include <sys/time.h>
#include <time.h>

static uchar g_log_modu_str[][20] =
{
    "M_MAIN",
    "M_INIT",
    "M_UART",
    "M_TIMER",
    "M_LED",
    "M_MOTOR",
    "M_PID",
    "M_MAX",
};

static uchar g_level[LOG_M_MAX] = {0}; /* LOG_M_MAX is 7*/


#ifdef USE_SUB_MODULE
    void log_set_level(const uint mod, const uchar level)
    {
        if (mod >= LOG_M_MAX)
        {
            return ;
        }
        g_level[mod] = level;
        return ;
    }

    void log_p(const uint mod, const uchar level,const char *va_alist, ...)
    {
        if (mod >= LOG_M_MAX || !(g_level[mod] & level))
        {
            return ;
        }
        va_list args;
        uchar buf[128] = {0};
        snprintf(buf, sizeof(buf), "[%s]", g_log_modu_str[mod]);
        switch (level & g_level[mod])
        {
            case LOG_T_INFO:
                strcat(buf, "[T_INFO] ");
                break;
            case LOG_T_DEBUG:
                strcat(buf, "[T_DEBUG] ");
                break;
            case LOG_T_WARNING:
                strcat(buf, "[T_WARNING] ");
                break;
            case LOG_T_ERROR:
                strcat(buf, "[T_ERROR] ");
                break;
            default:
                return ;
        }
        fprintf(stdout, buf);
        va_start(args, va_alist);
        vfprintf(stdout, va_alist, args);
        va_end(args);
        fflush(stdout);
        return ;
    }
#endif


#define LOG_FILE_NAME "log.txt"

int file_write(char* buf, size_t buf_len, char* file_name, char* type)
{
#ifdef ALTERA_HOSTFS_NAME
    if ( buf == NULL || buf_len <= 0 ||\
    file_name == NULL || file_name[0] == 0)
    {
        return 0;
    }
    FILE *fd = fopen(file_name, type);
    if (fd == NULL)
    {
        perror("fopen");
        return 0;
    }
    fwrite(buf, 1, buf_len, fd);
    fclose(fd);
    return 1;
#else
    printf("No Host file system find.\n");
#endif

}

/* log資訊寫回到檔案 */
int log_write_file(char* buf, size_t buf_len, char* file_name)
{
    return file_write(buf, buf_len, file_name, "a ");
}

void log_to_file(const uint mod, const uchar level, const char *va_alist, ...)
{
    if (mod >= LOG_M_MAX || !(g_level[mod] & level))
    {
        printf("Error with mod.\n");
        return ;
    }
    va_list args;
    char buf[128] = {0};
    snprintf(buf, sizeof(buf), "[%s]", g_log_modu_str[mod]);
    switch (level & g_level[mod])
    {
        case LOG_T_INFO:
            strcat(buf, "[T_INFO] ");
            break;
        case LOG_T_DEBUG:
            strcat(buf, "[T_DEBUG] ");
            break;
        case LOG_T_WARNING:
            strcat(buf, "[T_WARNING] ");
            break;
        case LOG_T_ERROR:
            strcat(buf, "[T_ERROR] ");
            break;
        default:
            return ;
    }

    log_write_file(buf, strlen(buf), LOG_FILE_NAME);
    va_start(args, va_alist);
    memset(buf, 0, sizeof(buf));
    vsnprintf(buf, sizeof(buf), va_alist, args);
    log_write_file(buf, strlen(buf), LOG_FILE_NAME);
    va_end(args);
    return ;
}

#define LOG_INI_FILE "log.ini"

void log_init(void)
{

    return ;
}
