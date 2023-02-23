char gc_debug_buf[1048576];
int  gi_debug_buf_idx=0;
int  msglock;
unsigned char uctmp[100];

void DebugPrintf(const char *format)
{
    msglock = 1; /*lock*/
    gi_debug_buf_idx += sprintf( (gc_debug_buf+gi_debug_buf_idx),  ("%s"), uctmp); /* 將訊息新增到buffer後面 */
    msglock = 0; /*unlock*/
}

void ShowDebugMesspage(void ){
    if(msglock) { /* 判斷是否被鎖住 */
        /* do nothing */
    }else {
        if(gi_debug_buf_idx){ /* 確認是否有值 */
            printf("%s", gc_debug_buf); /* 印出buffer內容*/
            gi_debug_buf_idx = 0;
        }else{
            /* do nothing*/
        }
    }
}
