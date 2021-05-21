#include "serial/serial.h"

Serial::Serial(const char* port, unsigned int baud) {
  fd = open(port, O_RDWR | O_NOCTTY | O_NDELAY);

  if (fd == -1) {
    perror("open_port: Unable to open /dev/ttyUSB0 - ");
  } else {
    tcgetattr(fd, &opt);  // get serial port config
    fcntl(fd, F_SETFL, 0);

    int speed_arr[] = {B0,    B50,   B75,    B110,   B134,   B150,
                       B200,  B300,  B600,   B1200,  B1800,  B2400,
                       B4800, B9600, B19200, B38400, B57600, B115200};
    int name_arr[] = {0,    50,   75,    110,   134,   150,
                      200,  300,  600,   1200,  1800,  2400,
                      4800, 9600, 19200, 38400, 57600, 115200};
    int status;
    tcgetattr(fd, &opt);
    for (int i = 0; i < sizeof(speed_arr) / sizeof(int); i++) {
      if (baud == name_arr[i]) {
        tcflush(fd, TCIOFLUSH);
        cfsetispeed(&opt, speed_arr[i]);
        cfsetospeed(&opt, speed_arr[i]);
        status = tcsetattr(fd, TCSANOW, &opt);
        if (status != 0) {
          perror("tcsetattr fd");
          return;
        }
        tcflush(fd, TCIOFLUSH);
      }
    }

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
}

Serial::~Serial() { close(fd); }

void Serial::pub_motor_pwm(float pwm[4]) {
  char msg[5] = {0, 0, 0, 0,
                 0};  //{AA, (dir, speedA), (speedB, speedC), (speedD, CRC), EE}
  for (int i = 0; i < 4; i++) {
    pwm[i] = pwm[i] > 100 ? 100 : pwm[i] < -100 ? -100 : pwm[i];
    bool dir = pwm[i] > 0 ? 1 : 0;
    msg[1] |= dir << 7 - i;
  }
  printf_binary("msg[1]:", msg[1]);

  //   int n = write(fd, msg, 12);
  // #ifdef DEBUG
  //   if (n < 0) {
  //     printf("n = %d, write() of 12 bytes failed!\n", n);
  //   }
  // #endif  // DEBUG
}

#ifdef DEBUG
void Serial::printf_binary(const char* text, char hex_msg) {
  printf("%s ", text);
  for (int i = 7; i >= 0; i--) {
    printf("%d", ((hex_msg >> i) & 0x01));
    if (i == 4) printf(" ");
  }
  printf("\n");
}
#endif  // DEBUG
