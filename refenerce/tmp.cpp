/**
 *@brief  設置串口通信速率
 *@param  fd     類型 int  打開串口的文件控制碼
 *@param  speed  類型 int  串口速度
 *@return  void
 */
void set_speed(int fd, int speed) {
  int speed_arr[] = {B0,    B50,   B75,    B110,   B134,   B150,
                     B200,  B300,  B600,   B1200,  B1800,  B2400,
                     B4800, B9600, B19200, B38400, B57600, B1152000};

  int name_arr[] = {0,    50,   75,   110,  134,  150,   200,   300,   600,
                    1200, 1800, 2400, 4800, 9600, 19200, 38400, 57600, 115200};

  tcgetattr(fd, &Opt);
  for (int i = 0; i < (sizeof(speed_arr) / sizeof(int)); i++) {
    if (speed == name_arr[i]) {
      tcflush(fd, TCIOFLUSH);

      cfsetispeed(&Opt, speed_arr[i]);
      cfsetospeed(&Opt, speed_arr[i]);

      int status = tcsetattr(fd, TCSANOW, &Opt);
      if (status != 0) {
        perror("tcsetattr fd1");
        return;
      }

      tcflush(fd, TCIOFLUSH);
    }
  }
}

int open_port(int fd, int speed) {
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
    tcgetattr(fd, &Opt);

    fcntl(fd, F_SETFL, 0);

    set_speed(fd, speed);

    Opt.c_cflag |= (CLOCAL | CREAD);
    Opt.c_cflag &= ~PARENB;
    Opt.c_cflag &= ~CSTOPB;
    Opt.c_cflag &= ~CSIZE;
    Opt.c_cflag |= CS8;
    Opt.c_cflag &= ~CRTSCTS;
    Opt.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG);
    Opt.c_iflag &= ~INPCK;
    Opt.c_iflag &= ~(IXON | IXOFF | IXANY);
    Opt.c_oflag &= ~OPOST;

    tcsetattr(fd, TCSANOW, &Opt);
  }
  return (fd);
}

int main(int argc, char **argv) {
  open_port(fd, 9600);
  int i = 0;
  char num_buf[16];

  char buf[] = "hello world ";
  char end_buf[] = "\r";
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
    strcat(pub_buf, end_buf);

    int n = write(fd, &pub_buf, buf_len);

    if (n < 0) {
      printf("n = %d, write() of %d bytes failed!\n", n, buf_len);
    }
    sleep(1);
    i++;
  }

  close(fd);
  return 0;
}
