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
    opt.c_cflag &= ~CRTSCTS;  // dis 硬體控制
    opt.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG);
    opt.c_iflag &= ~INPCK;
    opt.c_iflag &= ~(INLCR | ICRNL);
    opt.c_iflag &= ~(IXON | IXOFF | IXANY);
    opt.c_oflag &= ~OPOST;

    tcsetattr(this->fd, TCSANOW, &opt);
  }
}

Serial::~Serial() { close(this->fd); }

/**

* @brief  calculation crc code or check crc status

* @param  msg, message to be calculated

* @param  mode, 0 = return mode, 1 = check mode

* @return  crc code(1 byte) or check status(1/0) or error(-1)

*/
char Serial::calculation_crc(char* msg, int len) {
  // CRC Calculation
  int crc = 0;
  for (int i = 1; i < (len - 2); i++) {
    crc += msg[i];
    // printf("msg[%d]: %02X\n", i, msg[i]);
  }
  crc = crc & 0xFF;
  return (char)crc;
}

void Serial::build_msg(float pwm[4]) {
  // write start and end packet
  this->pub_msg[0] = this->pub_start_buf;
  this->pub_msg[11] = this->pub_end_buf;
  // pwm values process
  bool dir[4] = {false};
  int tmp_pwm[4] = {0};

  for (int i = 0; i < 4; i++) {
    dir[i] = pwm[i] > 0 ? 1 : 0;
    // After obtaining dir, pwm is converted to unsigned
    float abs_pwm = abs(pwm[i]);
    // speed 0 ~ 100 conversion to 0 ~ 65535
    tmp_pwm[i] = abs_pwm > 100 ? 65535 : int(round(abs_pwm * 655.35));
    // tmp_pwm type = 2 bytes = 16 bits, but msg type is char(1 byte), so
    // disassemble tmp_pwm into HIGH and Low byte
    this->pub_msg[2 + i * 2] = (tmp_pwm[i] & 0xFF00) >> 8;
    this->pub_msg[3 + i * 2] = tmp_pwm[i] & 0x00FF;
  }

  // write dir to msg[1] low bit
  this->pub_msg[1] &= 0x00;
  this->pub_msg[1] |= dir[0] << 0;
  this->pub_msg[1] |= dir[2] << 1;
  this->pub_msg[1] |= dir[1] << 2;
  this->pub_msg[1] |= dir[3] << 3;

  // write crc
  this->pub_msg[10] = calculation_crc(this->pub_msg, 12);

#ifdef DEBUG
  // vector<string> text = {
  //     "dir     :", "MA H_spd:", "MA L_spd:", "MB H_spd:", "MB L_spd:",
  //     "MC H_spd:", "MC L_spd:", "MD H_spd:", "MD L_spd:", "CRC     :"};
  // printf_binary(text, this->pub_msg, 12);

  printf_hex("pub_msg(hex) :", this->pub_msg, 12);

#endif  // DEBUG
}

void Serial::pub_motor_pwm(float pwm[4]) {
  build_msg(pwm);

  int n = write(this->fd, this->pub_msg, 12);
  if (n < 0) {
    printf("n = %d, write() of %d bytes failed!\n", n, 12);
  }
}

int Serial::unbuild_msg(int byte) {
// check subscribe message start and end packet is correct
#ifdef DEBUG
  printf("packet start and end = %02X, %02X\n", (uint8_t)this->sub_msg[0],
         (uint8_t)this->sub_msg[byte - 1]);
#endif  // DEBUG
  if (this->sub_msg[0] == this->sub_start_buf &&
      this->sub_msg[byte - 1] == this->sub_end_buf) {
    char crc = calculation_crc(this->sub_msg, byte);
    // printf()
#ifdef DEBUG
    printf("data = %02X, crc = %02X, A : %d\n",
           (unsigned char)this->sub_msg[byte - 2], (unsigned char)crc,
           (this->sub_msg[byte - 2] == crc) ? 1 : 0);
    //  printf("this->sub_msg[byte - 2] type = %s\n");
    printf("msg = %s, %02X, crc = %s, %02X",
           typeid(this->sub_msg[byte - 2]).name(),
           (int8_t)this->sub_msg[byte - 2], typeid(crc).name(), (int8_t)crc);

#endif  // DEBUG

    if (this->sub_msg[byte - 2] == crc) {
#ifdef DEBUG
      printf_hex("sub_msg :", this->sub_msg, byte);
#endif  // DEBUG

      return 1;
    } else {
#ifdef DEBUG
      printf("crc check error\n");
#endif  // DEBUG

      return -1;
    }
  } else {
    printf("msg start and end packet error\n");
    return -1;
  }
}

int Serial::sub_feedback(int byte) {
  char msg = 0x00;
  int n = read(this->fd, &msg, 1);
  if (n < 0) {
    printf("n = %d, read() of %d bytes failed!\n", n, 1);
    return -1;
  } else {
    // #ifdef DEBUG
    //     printf("msg[%d] = 0x%02X\n", this->tmp_msg_len, (uint8_t)msg);
    // #endif  // DEBUG

    if ((msg == (char)0xAA) || this->sub_start) {
      sub_start = true;
      this->sub_msg[this->tmp_msg_len] = msg;
      // printf("msg %d = %02X\n", this->tmp_msg_len, (uint8_t)msg);
      if (this->tmp_msg_len != byte - 1) {
        this->tmp_msg_len++;
        return 0;
      } else {
        this->tmp_msg_len = 0;
        this->sub_start = false;

        int status = unbuild_msg(byte);
        return status;
      }
    } else {
#ifdef DEBUG
      printf("msg %02X = 0xAA ? %d, sub_start = %d\n", (uint8_t)msg,
             (msg == (char)0xAA), this->sub_start);
#endif  // DEBUG
      return -2;
    }
  }
}

char* Serial::get_sub_msg() { return this->sub_msg; }

#ifdef DEBUG
void Serial::printf_binary(vector<string> text, char* msg, int len) {
  for (int j = 0; j < len; j++) {
    printf("%s ", text.at(j).c_str());
    for (int i = 7; i >= 0; i--) {
      unsigned char u_msg = (unsigned char)msg[j];
      printf("%d", ((msg[j] >> i) & 0x01));
      if (i == 4) printf(" ");
    }
    printf("\n");
  }
  printf("\n");
}
void Serial::printf_hex(const char* text, char* msg, int len) {
  printf("%s\n", text);
  for (int j = 1; j < len - 1; j++) {
    unsigned char u_msg = (unsigned char)msg[j];
    printf("%02X", u_msg);
    printf(" ");
  }
  printf("\n\n");
}
#endif  // DEBUG
