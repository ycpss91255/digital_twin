#include <errno.h>   /* Error number definitions */
#include <fcntl.h>   /* File control definitions */
#include <stdio.h>   /* Standard input/output definitions */
#include <string.h>  /* String function definitions */
#include <termios.h> /* POSIX terminal control definitions */
#include <unistd.h>  /* UNIX standard function definitions */
// # include <stdlib.h> /* General purpose standard library */

#include <iostream>

using namespace std;
// File descriptor for the port
int fd;
// Serial configuration
termios opt;

int open_port(void) {
  /* O_RDWR = read+write mode
   *
   * The O_NOCTTY flag tells UNIX that this program doesn't want to be the
   * "controlling terminal" for that port. If you don't specify this then any
   * input (such as keyboard abort signals and so forth) will affect your
   * process. Programs like getty(1M/8) use this feature when starting the
   login
   * process, but normally a user program does not want this behavior.
   *
   * The O_NDELAY flag tells UNIX that this program doesn't care what state
   the
   * DCD signal line is in - whether the other end of the port is up and
   * running. If you do not specify this flag, your process will be put to
   sleep
   * until the DCD signal line is the space voltage.
   */
  fd = open("/dev/ttyUSB0", O_RDWR | O_NOCTTY | O_NDELAY);
  if (fd == -1) {
    perror("open_port: Unable to open /dev/ttyUSB0 - ");
  } else {
    tcgetattr(fd, &opt);

    fcntl(fd, F_SETFL, 0);
    cfsetispeed(&opt, B115200);
    cfsetospeed(&opt, B115200);

    opt.c_cflag |= (CLOCAL | CREAD);
    opt.c_cflag &= ~PARENB;
    opt.c_cflag &= ~CSTOPB;
    opt.c_cflag &= ~CSIZE;
    opt.c_cflag |= CS8;
    opt.c_cflag &= ~CRTSCTS;
    opt.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG);
    opt.c_iflag &= ~INPCK;
    opt.c_iflag &= ~(IXON | IXOFF | IXANY);
    opt.c_oflag &= ~OPOST;

    tcsetattr(fd, TCSANOW, &opt);
  }
  return (fd);
}

int main(int argc, char **argv) {
  open_port();

  int i = 0;
  char num_buf[16];
  char end_buf = 0xAA;
  char buf[] = "hello world ";
  char end_buf = 0xEE;

  while (1) {
    char pub_buf[1024] = {};
    int pub_len;

    strcat(pub_buf, buf);  // merge char array

    sprintf(num_buf, "%d", i);  // int type to char type
    strcat(pub_buf, num_buf);   // merge char array
    strcat(pub_buf, end_buf);   // merge char array
    printf("%s\n", pub_buf);
    for (int i = 0; i < (sizeof(pub_buf) / sizeof(char)); i++) {
      if (pub_buf[i] == '\n') {
        pub_len = i + 1;
        break;
      }
    }

    int n = write(fd, &pub_buf, pub_len);

    if (n > 0) {
      printf("n = %d, %s", n, pub_buf);

    } else {
      printf("n = %d, write() of %d bytes failed!\n", n, pub_len);
    }
    sleep(1);
    i++;
  }

  close(fd);
  return 0;
}

/* Uart資料:
* 起始封包(1byte): 0xAA
* 4顆馬達方向(1bytes): {4'b0000, MD(1bit), MB(1bit), MC(1bit), MA(1bit)}
* 4顆馬達速度(8bytes): MA(short_uint_2bytes), MB(short_uint_2bytes), MC(short_uint_2bytes), MD(short_uint_2bytes)
* CRC(1byte): 以上19bytes相加後取最低那個Byte當檢查碼
* 結束位元(1byte): 0xEE
* 總共 11bytes
* */
