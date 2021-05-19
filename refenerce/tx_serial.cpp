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
    // cfsetispeed(&opt, B115200);
    // cfsetospeed(&opt, B115200);
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

  char buf[] = "hello world ";

  while (1) {
    // int type to char type
    sprintf(num_buf, "%d", i);
    // merge char array
    // strcat(buf, num_buf);

    // int buf_len = sizeof(buf) / sizeof(char);
    int buf_len = 1024;
    char pub_buf[buf_len] = {};
    strcpy(pub_buf, buf);
    strcat(pub_buf, num_buf);

    int n = write(fd, &pub_buf, buf_len);
    printf("%s\n", pub_buf);

    if (n < 0) {
      printf("write() of %d bytes failed!\n", buf_len);
    }
    sleep(1);
    i++;
  }

  close(fd);
  return 0;
}
