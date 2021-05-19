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

  // int read_len = sizeof(read_buf) / sizeof(char);
  int read_len = 1024;
  char cmd_buf[read_len] = {};
  while (1) {
    char read_buf[read_len] = {};
    // Read bytes. The behaviour of read() (e.g. does it block?,
    // how long does it block for?) depends on the configuration
    // settings above, specifically VMIN and VTIME
    int n = read(fd, &read_buf, read_len);
    if (n > 0) {
      printf("n = %d, %s\n", n, read_buf);
      // printf("%ld\n", sizeof(read_buf) / sizeof(char));
      // strcat(cmd_buf, read_buf);
    }

    if (n < 0) {
      printf("n = %d, read() of %d bytes failed!\n", n, read_len);
    }
    // printf("read : %d\n", n);

    // printf("%d\n", fcntl(fd, F_SETFL, FNDELAY));
    // printf("%d\n", fcntl(fd, F_SETFL, 0));
  }
  close(fd);
  return 0;
}
