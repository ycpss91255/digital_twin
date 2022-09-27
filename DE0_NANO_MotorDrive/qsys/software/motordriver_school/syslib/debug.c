char gc_debug_buf[1048576];
int  gi_debug_buf_idx=0;
int  msglock;
unsigned char uctmp[100];

void DebugPrintf(const char *format)
{
    msglock = 1; /*lock*/
    gi_debug_buf_idx += sprintf( (gc_debug_buf+gi_debug_buf_idx),  ("%s"), uctmp); /* �N�T���s�W��buffer�᭱ */
    msglock = 0; /*unlock*/
}

void ShowDebugMesspage(void ){
    if(msglock) { /* �P�_�O�_�Q��� */
        /* do nothing */
    }else {
        if(gi_debug_buf_idx){ /* �T�{�O�_���� */
            printf("%s", gc_debug_buf); /* �L�Xbuffer���e*/
            gi_debug_buf_idx = 0;
        }else{
            /* do nothing*/
        }
    }
}
