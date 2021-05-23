#include "serial/serial.h"

Serial::Serial(const char* port, unsigned int baud) {
  this->fd = open(port, O_RDWR | O_NOCTTY | O_NDELAY);

  if (this->fd == -1) {
    perror("open_port: Unable to open /dev/ttyUSB0 - ");
  } else {
    tcgetattr(this->fd, &opt);  // get serial port config
    fcntl(this->fd, F_SETFL, 0);

    int speed_arr[] = {B0,    B50,   B75,    B110,   B134,   B150,
                       B200,  B300,  B600,   B1200,  B1800,  B2400,
                       B4800, B9600, B19200, B38400, B57600, B115200};
    int name_arr[] = {0,    50,   75,    110,   134,   150,
                      200,  300,  600,   1200,  1800,  2400,
                      4800, 9600, 19200, 38400, 57600, 115200};
    int status;
    tcgetattr(this->fd, &opt);
    for (int i = 0; i < sizeof(speed_arr) / sizeof(int); i++) {
      if (baud == name_arr[i]) {
        tcflush(this->fd, TCIOFLUSH);
        cfsetispeed(&opt, speed_arr[i]);
        cfsetospeed(&opt, speed_arr[i]);
        status = tcsetattr(this->fd, TCSANOW, &opt);
        if (status != 0) {
          perror("tcsetattr fd");
          return;
        }
        tcflush(this->fd, TCIOFLUSH);
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

    tcsetattr(this->fd, TCSANOW, &opt);
  }
}

Serial::~Serial() { close(this->fd); }

void Serial::set_msg(float pwm[4]) {
  // write start and end packat
  this->msg[0] = start_buf;
  this->msg[11] = end_buf;

  // pwm values process
  bool dir[4] = {false};
  int tmp_pwm[4] = {0};

  for (int i = 0; i < 4; i++) {
    dir[i] = pwm[i] > 0 ? 1 : 0;

    // After obtaining dir, pwm is converted to unsigned
    pwm[i] = abs(pwm[i]);
    // speed 0 ~ 100 conversion to 0 ~ 65535
    tmp_pwm[i] = pwm[i] > 100 ? 65535 : int(round((pwm[i]) * 655.35));
    // tmp_pwm type = 2 bytes = 16 bits, but msg type is char(1 byte), so
    // disassemble tmp_pwm into HIGH and Low byte
    this->msg[2 + i * 2] = (tmp_pwm[i] & 0xFF00) >> 8;
    this->msg[3 + i * 2] = tmp_pwm[i] & 0x00FF;
  }

  // write dir to msg[1] low bit
  this->msg[1] |= dir[0] << 0;
  this->msg[1] |= dir[2] << 1;
  this->msg[1] |= dir[1] << 2;
  this->msg[1] |= dir[3] << 3;

  // CRC Calculation
  int crc = 0;
  for (int i = 0; i < 9; i++) {
    crc += this->msg[i + 1];
    crc = crc & 0xFF;
  }
  this->msg[10] = crc;

#ifdef DEBUG
  printf_binary("dir: ", this->msg[1]);
  printf("\n");
  printf_binary("MA H_Spd: ", this->msg[2]);
  printf_binary("MA L_Spd: ", this->msg[3]);
  printf("\n");
  printf_binary("MB H_Spd: ", this->msg[4]);
  printf_binary("MB L_Spd: ", this->msg[5]);
  printf("\n");
  printf_binary("MC H_Spd: ", this->msg[6]);
  printf_binary("MC L_Spd: ", this->msg[7]);
  printf("\n");
  printf_binary("MD H_Spd: ", this->msg[8]);
  printf_binary("MD L_Spd: ", this->msg[9]);
  printf("\n");
  printf_binary("CRC     : ", this->msg[10]);
#endif  // DEBUG
}

void Serial::pub_motor_pwm(float pwm[4]) {
  set_msg(pwm);

  int n = write(this->fd, this->msg, 12);
}

// void Serial::

#ifdef DEBUG
void Serial::printf_binary(const char* text, char hex_msg) {
  printf("%s", text);
  for (int i = 7; i >= 0; i--) {
    printf("%d", ((hex_msg >> i) & 0x01));
    if (i == 4) printf(" ");
  }
  printf("\n");
}
#endif  // DEBUG
