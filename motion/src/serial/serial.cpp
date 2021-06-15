#include "serial/serial.h"

/**
 * @param port serial port
 * @param baud_rate universal baud rate
 */
Serial::Serial(const char* port, uint32_t baud_rate) {
  serial_init(port, baud_rate);
  data_init();
}

/**
 * @brief close serial port
 */
Serial::~Serial() { close(this->fd); }

/**
 * @brief create a serial port and setup config
 * @param port serial port
 * @param baud_rate universal baud rate
 */
void Serial::serial_init(const char* port, uint32_t baud_rate) {
  this->fd = open(port, O_RDWR | O_NOCTTY | O_NDELAY);

  if (this->fd == -1) {
    perror("Unable to open designated serial port - ");
    exit(EXIT_FAILURE);
  } else {
    vector<int> speed_vec = {B0,    B50,   B75,    B110,   B134,   B150,
                             B200,  B300,  B600,   B1200,  B1800,  B2400,
                             B4800, B9600, B19200, B38400, B57600, B115200};
    vector<int> name_vec = {0,    50,   75,    110,   134,   150,
                            200,  300,  600,   1200,  1800,  2400,
                            4800, 9600, 19200, 38400, 57600, 115200};

    tcgetattr(this->fd, &opt);  // get serial port config

    // Serial not blocking
    fcntl(this->fd, F_SETFL, 0);
    // Serial not blocking
    // fcntl(this->fd, F_SETFL, FNDELAY);

    for (int i = 0; i < speed_vec.size(); i++) {
      if (baud_rate == name_vec[i]) {
        tcflush(this->fd, TCIOFLUSH);  // clear input and output
        try {
          cfsetispeed(&opt, speed_vec.at(i));  // publish baud rate
          cfsetospeed(&opt, speed_vec.at(i));  // subscribe baud rate
        } catch (const out_of_range& e) {
          perror("not find baud rate reference!");
          exit(EXIT_FAILURE);
        }
        tcflush(this->fd, TCIOFLUSH);
      }
    }

    /**
     * CLOCAL  : Local line - do not change "owner" of port
     * CREAD   : Enable receiver
     * PARENB  : Parity bit
     * CSTOPB  : 2 stop bits (1 otherwise)
     * CSIZE   : Bit mask for data bits
     * CS8     : 1 bytes is 8 data bits
     * CRTSCTS : Hardware flow control
     */
    opt.c_cflag |= (CLOCAL | CREAD);
    opt.c_cflag &= ~PARENB;
    opt.c_cflag &= ~CSTOPB;
    opt.c_cflag &= ~CSIZE;
    opt.c_cflag |= CS8;
    opt.c_cflag &= ~CRTSCTS;
    /**
     * ICANON  : Canonical input (else raw)
     * ECHO    : Echoing of input characters
     * ECHOE   : Echo erase character as BS-SP-BS
     * ISIG    : SIGINTR, SIGSUSP, SIGDSUSP, and SIGQUIT signals
     * INPCK   : parity check
     * ICRNL   : Map CR to NL
     * IXON    : Software flow control (outgoing)
     * IXOFF   : Software flow control (incoming)
     * IXANY   : Allow any character to start flow again
     */
    opt.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG);
    opt.c_iflag &= ~INPCK;
    opt.c_iflag &= ~(INLCR | ICRNL);
    opt.c_iflag &= ~(IXON | IXOFF | IXANY);
    /**
     * OPOST   : Postprocess output (not set = raw output)
     */
    opt.c_oflag &= ~OPOST;

    int status = tcsetattr(this->fd, TCSANOW, &opt);  // set Serial port config
    if (status != 0) {
      perror("tcsetattr fd");
      exit(EXIT_FAILURE);
    }
  }
}

/**
 * @brief set publish and subscribe msg size
 */
void Serial::data_init() {
  this->pub_msg.resize(PUB_MSG_LEN);
  this->sub_msg.resize(SUB_MSG_LEN);
  this->M_data.resize(4);
}

/**
 * @brief publish strategy speed command
 * @param pwm range -100 ~ 100
 */
void Serial::pub_motor_pwm(vector<float>& pwm) {
  build_msg(pwm);

  for (int i = 0, n = 0; i < this->pub_msg.size(); i++) {
    n += write(this->fd, &this->pub_msg.at(i), 1);
    if (n < 0) {
      // If remove the USB device, will enter this loop, causing a crash
      printf("write() of %d/%d bytes failed!\n", n, PUB_MSG_LEN);
    }
  }
}

/**
 * @brief build strategy commamd save to publish buffer
 * @param pwm range -100 ~ 100
 */
void Serial::build_msg(vector<float>& pwm) {
  // write start and end packet
  this->pub_msg[0] = PUB_START_PACKET;
  this->pub_msg[PUB_MSG_LEN - 1] = PUB_END_PACKET;

  vector<bool> dir(4, false);

  for (int i = 0; i < 4; i++) {
    dir[i] = (pwm[i] > 0 ? 1 : 0);

    float abs_pwm = abs(pwm[i]);
    // speed 0 ~ 100 conversion to 0 ~ 65535 (msg data = 2bytes)
    int pwm_msg = abs_pwm > 100 ? 65535 : int(round(abs_pwm * 655.35));
    // int = 4 bytes, but char = 1 byte, so disassemble int into HIGH and
    // Low byte
    this->pub_msg[i * 2 + 3] = (pwm_msg & 0xFF00) >> 8;
    this->pub_msg[i * 2 + 4] = pwm_msg & 0x00FF;
  }
  // clear old direction and write new direction
  this->pub_msg[2] &= 0x00;
  this->pub_msg[2] |= dir[0] << 0;
  this->pub_msg[2] |= dir[2] << 1;
  this->pub_msg[2] |= dir[1] << 2;
  this->pub_msg[2] |= dir[3] << 3;

  // write last data crc check is it right or not, 0 = right, 1 = not
  this->pub_msg[1] = this->check_status;
  // write crc
  this->pub_msg[PUB_MSG_LEN - 2] = calculation_crc(this->pub_msg);

#ifdef P_PUBLISH
  printf_hex("pub_msg :", this->pub_msg);
#endif  // P_PUBLISH
}

/**
 * @brief subscribe Nios feed back messages
 * @return subscribe status, -1 = error, 0 = receiving, 1 = right
 */
int Serial::sub_feedback() {
  uint8_t msg = 0x00;
  int n = read(this->fd, &msg, 1);

  if (n < 0) {
    // receive msg error, clear current msg, wait next message
    printf("n = %d, read() of 1 bytes failed!\n", n);
    for (int i = 0; i < SUB_MSG_LEN; i++) this->sub_msg[i] = 0;
    this->sub_start_flag = false;
    return -1;
  } else {
    // Confirm whether the first msg matches
    if ((msg == SUB_START_PACKET) || this->sub_start_flag) {
      this->sub_start_flag = true;
      this->sub_msg[this->tmp_msg_len] = msg;
      if (this->tmp_msg_len != SUB_MSG_LEN - 1) {
#ifdef DEBUG
        // printf("the msg buf is not full, %d/%d\n", this->tmp_msg_len + 1,
        //        SUB_MSG_LEN);
#endif  // DEBUG
        this->tmp_msg_len++;
        return 0;
      } else {
#ifdef DEBUG
        printf("the msg buf \n");
#endif  // DEBUG
        this->tmp_msg_len = 0;
        this->sub_start_flag = false;
        int status = check_msg();
        return status;
      }
    } else {
#ifdef DEBUG
      printf("msg %02X, sub_start_flag = %d\n", msg, this->sub_start_flag);
#endif  // DEBUG
      return -2;
    }
  }
}

/**
 * @brief check Nios feed back message
 * @return message check status
 */
int Serial::check_msg() {
  // confirm that the start and end packets of the subscription message are
  // correct
  if (this->sub_msg[0] == SUB_START_PACKET &&
      this->sub_msg[SUB_MSG_LEN - 1] == SUB_END_PACKET) {
    uint8_t crc = calculation_crc(this->sub_msg);
    if (this->sub_msg[SUB_MSG_LEN - 2] == crc) {
#ifdef P_SUBSCRIBE
      printf_hex("sub_msg :", this->sub_msg);
#endif  // P_SUBSCRIBE
      return 1;
    } else {
      printf("Incorrect crc check, msg = %02X, crc = %02X\n",
             this->sub_msg[SUB_MSG_LEN - 2], crc);
      printf_hex("sub_msg :", this->sub_msg);

      this->check_status = 0x01;
      return -1;
    }
  } else {
    printf("Incorrect start and end packet, packet = %02X, %02X\n",
           this->sub_msg[0], this->sub_msg[SUB_MSG_LEN - 1]);
    return -1;
  }
}

// TODO : wait Nios
/**
 * @brief unbuild Nios feed back message
 */
void Serial::unbuild_msg() {
    this->time_stamp = this->sub_msg[TIME_STAMP_ORDER + 2] << 16 |
                       this->sub_msg[TIME_STAMP_ORDER + 1] << 8 |
                       this->sub_msg[TIME_STAMP_ORDER];
    this->crc_status = this->sub_msg[STATUS_ORDER] & (0x01 << 0);

    for (int i = 0; i < 4; i++) {
      this->M_data[i].PWM = this->sub_msg[MOTOR_PWM_ORDER + i];

      this->M_data[i].Encoder =
          this->sub_msg[MOTOR_ENABLE_ORDER + (i * 4) + 3] << 24 |
          this->sub_msg[MOTOR_ENABLE_ORDER + (i * 4) + 2] << 16 |
          this->sub_msg[MOTOR_ENABLE_ORDER + (i * 4) + 1] << 8 |
          this->sub_msg[MOTOR_ENABLE_ORDER + (i * 4)];

      this->M_data[i].Speed =
          this->sub_msg[MOTOR_SPEED_ORDER + (i * 2) + 1] << 8 |
          this->sub_msg[MOTOR_SPEED_ORDER + (i * 2)];

      this->M_data[i].Voltage =
          this->sub_msg[MOTOR_VOLTAGE_ORDER + (i * 2)] << 8 |
          this->sub_msg[MOTOR_VOLTAGE_ORDER + (i * 2)];

      this->M_data[i].Current =
          this->sub_msg[MOTOR_CURRENT_ORDER + (i * 2)] << 8 |
          this->sub_msg[MOTOR_CURRENT_ORDER + (i * 2)];
    }
    this->M_data[0].DIR = this->sub_msg[MOTOR_DIR_ORDER] & (0x01 << 0);
    this->M_data[1].DIR = (this->sub_msg[MOTOR_DIR_ORDER] & (0x01 << 2)) >> 2;
    this->M_data[2].DIR = (this->sub_msg[MOTOR_DIR_ORDER] & (0x01 << 1)) >> 1;
    this->M_data[3].DIR = (this->sub_msg[MOTOR_DIR_ORDER] & (0x01 << 3)) >> 3;

    // IMU data is 10 bit, MSB is symbol

    // Combine the Accelerometer information in sub_msg
    int accel_byte = this->sub_msg[IMU_ACCELEROMETER_ORDER + 3] << 24 |
                     this->sub_msg[IMU_ACCELEROMETER_ORDER + 2] << 16 |
                     this->sub_msg[IMU_ACCELEROMETER_ORDER + 1] << 8 |
                     this->sub_msg[IMU_ACCELEROMETER_ORDER];
    // Get accelerometer data
    this->imu_data.Accelerometer.x = accel_byte & 0x1FF;
    this->imu_data.Accelerometer.y = accel_byte & 0x1FF << 10;
    this->imu_data.Accelerometer.z = accel_byte & 0x1FF << 20;
    // Judging positive and negative
    this->imu_data.Accelerometer.x = ((accel_byte & 0x200) >> 9) == 0
                                         ? this->imu_data.Accelerometer.x
                                         : -this->imu_data.Accelerometer.x;
    this->imu_data.Accelerometer.y = ((accel_byte & 0x200 << 10) >> 19) == 0
                                         ? this->imu_data.Accelerometer.y
                                         : -this->imu_data.Accelerometer.y;
    this->imu_data.Accelerometer.z = ((accel_byte & 0x200 << 20) >> 29) == 0
                                         ? this->imu_data.Accelerometer.z
                                         : -this->imu_data.Accelerometer.z;
    // Combine the Gyroscope information in sub_msg
    int gyro_byte = this->sub_msg[IMU_GYROSCOPE_ORDER + 3] << 24 |
                    this->sub_msg[IMU_GYROSCOPE_ORDER + 2] << 16 |
                    this->sub_msg[IMU_GYROSCOPE_ORDER + 1] << 8 |
                    this->sub_msg[IMU_GYROSCOPE_ORDER];
    // Get accelerometer data
    this->imu_data.Gyroscope.x = accel_byte & 0x1FF;
    this->imu_data.Gyroscope.y = accel_byte & 0x1FF << 10;
    this->imu_data.Gyroscope.z = accel_byte & 0x1FF << 20;
    // Judging positive and negative
    this->imu_data.Gyroscope.x = ((accel_byte & 0x200) >> 9) == 0
                                     ? this->imu_data.Gyroscope.x
                                     : -this->imu_data.Gyroscope.x;
    this->imu_data.Gyroscope.y = ((accel_byte & 0x200 << 10) >> 19) == 0
                                     ? this->imu_data.Gyroscope.y
                                     : -this->imu_data.Gyroscope.y;
    this->imu_data.Gyroscope.z = ((accel_byte & 0x200 << 20) >> 29) == 0
                                     ? this->imu_data.Gyroscope.z
                                     : -this->imu_data.Gyroscope.z;
    // Combine the Magneticmeter information in sub_msg
    int magnetic_byte = this->sub_msg[IMU_MAGNETICMETER_ORDER + 3] << 24 |
                        this->sub_msg[IMU_MAGNETICMETER_ORDER + 2] << 16 |
                        this->sub_msg[IMU_MAGNETICMETER_ORDER + 1] << 8 |
                        this->sub_msg[IMU_MAGNETICMETER_ORDER];
    this->imu_data.Magneticmeter.x = accel_byte & 0x1FF;
    this->imu_data.Magneticmeter.y = accel_byte & 0x1FF << 10;
    this->imu_data.Magneticmeter.z = accel_byte & 0x1FF << 20;
    // Judging positive and negative
    this->imu_data.Magneticmeter.x = ((accel_byte & 0x200) >> 9) == 0
                                         ? this->imu_data.Magneticmeter.x
                                         : -this->imu_data.Magneticmeter.x;
    this->imu_data.Magneticmeter.y = ((accel_byte & 0x200 << 10) >> 19) == 0
                                         ? this->imu_data.Magneticmeter.y
                                         : -this->imu_data.Magneticmeter.y;
    this->imu_data.Magneticmeter.z = ((accel_byte & 0x200 << 20) >> 29) == 0
                                         ? this->imu_data.Magneticmeter.z
                                         : -this->imu_data.Magneticmeter.z;
}

// AA 03 0D 0D 0D 0D 80 00 80 00 00 37 EE

/**
 * @brief  calculation crc code or check crc status
 * @param  msg, message to be calculated
 * @return  crc code(1 byte) or check status(1/0) or error(-1)
 */
uint8_t Serial::calculation_crc(vector<uint8_t>& msg) {
  int crc = 0;
  for (int i = 1; i < (msg.size() - 2); i++) {
    crc += msg[i];
  }
  crc = crc & 0xFF;
  return (uint8_t)crc;
}

vector<uint8_t> Serial::get_sub_msg() { return this->sub_msg; }

void Serial::printf_hex(const char* text, vector<uint8_t>& msg) {
  printf("%s\n", text);
  for (int i = 0; i < msg.size(); i++) {
    printf("%02X", msg.at(i));
    printf(" ");
  }
  printf("\n\n");
}
