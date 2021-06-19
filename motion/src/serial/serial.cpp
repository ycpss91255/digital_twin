#include "serial/serial.h"

int fd;                 // file descriptor
struct termios opt;     // serial config
struct sigaction saio;  // definition of signal action

vector<uint8_t> sub_msg;
bool wait_flag = true;
int tmp_msg_len = 0;
bool sub_start_flag = false;
uint8_t check_status = 0x00;

int time_stamp = 0;
int crc_status = 0;  // last data status
vector<motion::MotorStates> M_data;
motion::IMU imu_data;

/**
 * @brief create a serial port and setup config
 * @param port serial port
 * @param baud_rate universal baud rate
 * @param mode 0 = rx, 1 = tx
 */
void SerialInit(const char* port, uint32_t baud_rate) {
  /**
   * O_RDWR    : Read and write mode
   * O_NOCTTY  : Does not control the TTY interface
   * O_NDELAY  : Ignore the status of the RS-232 DCD singal
   */
  fd = open(port, O_RDWR | O_NOCTTY | O_NDELAY);

  if (fd == -1) {
    perror("Unable to open designated serial port - ");
    exit(EXIT_FAILURE);
  } else {
    /* install the signal handler before making the device asynchronous */
    saio.sa_handler = signal_handler_IO;
    sigemptyset(&saio.sa_mask);
    saio.sa_flags = 0;
    saio.sa_restorer = NULL;
    sigaction(SIGIO, &saio, NULL);

    vector<int> speed_vec = {B0,    B50,   B75,    B110,   B134,   B150,
                             B200,  B300,  B600,   B1200,  B1800,  B2400,
                             B4800, B9600, B19200, B38400, B57600, B115200};
    vector<int> name_vec = {0,    50,   75,    110,   134,   150,
                            200,  300,  600,   1200,  1800,  2400,
                            4800, 9600, 19200, 38400, 57600, 115200};

    tcgetattr(fd, &opt);  // get serial port config

    // allow the process to receive SIGIO
    fcntl(fd, F_SETOWN, getpid());
    // Serial non-blocking
    // fcntl(fd, F_SETFL, 0);
    fcntl(fd, F_SETFL, FASYNC);

    for (int i = 0; i < speed_vec.size(); i++) {
      if (baud_rate == name_vec[i]) {
        tcflush(fd, TCIOFLUSH);  // clear input and output
        try {
          cfsetispeed(&opt, speed_vec.at(i));  // publish baud rate
          cfsetospeed(&opt, speed_vec.at(i));  // subscribe baud rate
        } catch (const out_of_range& e) {
          perror("not find baud rate reference!");
          exit(EXIT_FAILURE);
        }
        tcflush(fd, TCIOFLUSH);
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
     */
    opt.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG);
    /**
     * INPCK   : parity check
     * ICRNL   : Map CR to NL
     * IXON    : Software flow control (outgoing)
     * IXOFF   : Software flow control (incoming)
     * IXANY   : Allow any character to start flow again
     */
    opt.c_iflag &= ~INPCK;
    opt.c_iflag &= ~(INLCR | ICRNL);
    opt.c_iflag &= ~(IXON | IXOFF | IXANY);
    /**
     * OPOST   : Postprocess output (not set = raw output)
     */
    opt.c_oflag &= ~OPOST;
    tcflush(fd, TCIOFLUSH);

    int status = tcsetattr(fd, TCSANOW, &opt);  // set Serial port config
    if (status != 0) {
      perror("tcsetattr fd");
      exit(EXIT_FAILURE);
    }
  }
  DataInit();
}

/**
 * @brief set publish and subscribe msg size
 */
void DataInit() {
  sub_msg.resize(SUB_MSG_LEN);
  M_data.resize(4);
}

/**
 * @brief close serial port
 */
void SerialClose() { close(fd); }

/**
 * @brief publish motor speed command
 * @param speed range -31 ~ 31
 */
void pub_MotorSpeed(vector<float>& speed) {
  if (speed.size() == 4) {
    vector<uint8_t> msg = BuildMsg(speed);
    /* Publish msg to serial */
    for (int i = 0, n = 0; i < msg.size(); i++) {
      n += write(fd, &msg.at(i), 1);
      if (n < 0) {
        // If remove the USB device, will enter this loop, causing a crash
        printf("write() of %d/%d bytes failed!\n", n, PUB_MSG_LEN);
      }
    }
  }
}

/**
 * @brief build motor commamd save to publish buffer
 * @param speed range -31 ~ 31, 31 is motor 12v max feedback pulse value
 */
vector<uint8_t> BuildMsg(vector<float>& speed) {
  /* Build msg */
  vector<uint8_t> pub_msg(PUB_MSG_LEN, 0x00);
  vector<bool> dir(4, false);

  // write start and end packet
  pub_msg.at(0) = PUB_START_PACKET;
  pub_msg.at(PUB_MSG_LEN - 1) = PUB_END_PACKET;

  for (int i = 0; i < 4; i++) {
    dir.at(i) = (speed.at(i) > 0 ? 1 : 0);

    float abs_spd = abs(speed.at(i));
    int pwm_msg = abs_spd > 31 ? 31 : abs_spd;

    // int = 4 bytes, but char = 1 byte, so disassemble int into HIGH and Low
    // byte
    pub_msg.at(i * 2 + 3) = (pwm_msg & 0xFF00) >> 8;
    pub_msg.at(i * 2 + 4) = pwm_msg & 0x00FF;
  }
  // clear old direction and write new direction
  pub_msg.at(2) &= 0x00;
  pub_msg.at(2) |= dir.at(0) << 0;
  pub_msg.at(2) |= dir.at(2) << 1;
  pub_msg.at(2) |= dir.at(1) << 2;
  pub_msg.at(2) |= dir.at(3) << 3;

  // write last data crc check is it right or not, 0 = right, 1 = not
  pub_msg.at(1) = check_status;
  // write crc
  pub_msg.at(PUB_MSG_LEN - 2) = calculation_crc(pub_msg);

#ifdef P_PUBLISH
  printf_hex("pub_msg :", pub_msg);
#endif  // P_PUBLISH

  return pub_msg;
}

/**
 * @brief subscribe Nios feed back messages
 * @return subscribe status, -1 = error, 0 = receiving or no data, 1 = right
 */
int sub_FeedBack() {
  uint8_t msg = 0x00;
  if (wait_flag != true) {
    int n = read(fd, &msg, 1);
    if (n < 0) {
      // receive msg error, clear current msg, wait next message
      printf("n = %d, read() of 1 bytes failed!\n", n);
      for (int i = 0; i < SUB_MSG_LEN; i++) sub_msg.at(i) = 0x00;
      sub_start_flag = false;
      return -1;
    } else {
      // Confirm whether the first msg matches
      if ((msg == SUB_START_PACKET) || sub_start_flag) {
        sub_start_flag = true;
        sub_msg[tmp_msg_len] = msg;
        if (tmp_msg_len != SUB_MSG_LEN - 1) {  // msg buffer is not full
          tmp_msg_len++;
          return 0;
        } else {  // msg buffer is full
          tmp_msg_len = 0;
          sub_start_flag = false;
          wait_flag = true;
          int status = check_msg();
          return status;
        }
      }
      // msg is not start packet and sub start flag = 0
      else {
#ifdef DEBUG
        printf("msg %02X, sub_start_flag = %d\n", msg, sub_start_flag);
#endif  // DEBUG
        wait_flag = true;
        return -1;
      }
    }
  }
  return 0;
}

/**
 * @brief check Nios feed back message
 * @return message check status, -1 = error , 1 = right
 */
int check_msg() {
  // confirm that the start and end packets of the subscription message are
  // correct
  if (sub_msg[0] == SUB_START_PACKET &&
      sub_msg[SUB_MSG_LEN - 1] == SUB_END_PACKET) {
    uint8_t crc = calculation_crc(sub_msg);
    if (sub_msg[SUB_MSG_LEN - 2] == crc) {
      check_status = 0x00;
      return 1;
    } else {
      printf("Incorrect crc check, msg = %02X, crc = %02X\n",
             sub_msg[SUB_MSG_LEN - 2], crc);
#ifdef P_SUBSCRIBE
      printf_hex("sub_msg :", sub_msg);
#endif  // P_SUBSCRIBE
      check_status = 0x01;
      return -1;
    }
  } else {
    printf("Incorrect start and end packet, packet = %02X, %02X\n", sub_msg[0],
           sub_msg[SUB_MSG_LEN - 1]);
    return -1;
  }
}

/**
 * @brief unbuild Nios feed back message
 */
void unbuild_msg() {
  time_stamp = sub_msg[TIME_STAMP_ORDER + 2] << 16 |
               sub_msg[TIME_STAMP_ORDER + 1] << 8 | sub_msg[TIME_STAMP_ORDER];
  crc_status = sub_msg[STATUS_ORDER] & 0x01;

  for (int i = 0; i < 4; i++) {
    M_data[i].PWM = sub_msg[MOTOR_PWM_ORDER + i];

    M_data[i].Encoder = sub_msg[MOTOR_ENABLE_ORDER + (i * 4) + 3] << 24 |
                        sub_msg[MOTOR_ENABLE_ORDER + (i * 4) + 2] << 16 |
                        sub_msg[MOTOR_ENABLE_ORDER + (i * 4) + 1] << 8 |
                        sub_msg[MOTOR_ENABLE_ORDER + (i * 4)];

    M_data[i].Speed = sub_msg[MOTOR_SPEED_ORDER + (i * 2) + 1] << 8 |
                      sub_msg[MOTOR_SPEED_ORDER + (i * 2)];

    M_data[i].Voltage = sub_msg[MOTOR_VOLTAGE_ORDER + (i * 2)] << 8 |
                        sub_msg[MOTOR_VOLTAGE_ORDER + (i * 2)];

    M_data[i].Current = sub_msg[MOTOR_CURRENT_ORDER + (i * 2)] << 8 |
                        sub_msg[MOTOR_CURRENT_ORDER + (i * 2)];
  }
  M_data[0].DIR = sub_msg[MOTOR_DIR_ORDER] & (0x01 << 0);
  M_data[1].DIR = (sub_msg[MOTOR_DIR_ORDER] & (0x01 << 2)) >> 2;
  M_data[2].DIR = (sub_msg[MOTOR_DIR_ORDER] & (0x01 << 1)) >> 1;
  M_data[3].DIR = (sub_msg[MOTOR_DIR_ORDER] & (0x01 << 3)) >> 3;

  /* IMU data is 10 bit, MSB is symbol */
  // Combine the Accelerometer information in sub_msg
  int accel_byte = sub_msg[IMU_ACCELEROMETER_ORDER + 3] << 24 |
                   sub_msg[IMU_ACCELEROMETER_ORDER + 2] << 16 |
                   sub_msg[IMU_ACCELEROMETER_ORDER + 1] << 8 |
                   sub_msg[IMU_ACCELEROMETER_ORDER];

  // Get accelerometer data
  imu_data.Accelerometer.x = accel_byte & 0x1FF;
  imu_data.Accelerometer.y = accel_byte & 0x1FF << 10;
  imu_data.Accelerometer.z = accel_byte & 0x1FF << 20;
  // Judging positive and negative
  imu_data.Accelerometer.x = ((accel_byte & 0x200) >> 9) == 0
                                 ? imu_data.Accelerometer.x
                                 : -imu_data.Accelerometer.x;
  imu_data.Accelerometer.y = ((accel_byte & 0x200 << 10) >> 19) == 0
                                 ? imu_data.Accelerometer.y
                                 : -imu_data.Accelerometer.y;
  imu_data.Accelerometer.z = ((accel_byte & 0x200 << 20) >> 29) == 0
                                 ? imu_data.Accelerometer.z
                                 : -imu_data.Accelerometer.z;
  // Combine the Gyroscope information in sub_msg
  int gyro_byte = sub_msg[IMU_GYROSCOPE_ORDER + 3] << 24 |
                  sub_msg[IMU_GYROSCOPE_ORDER + 2] << 16 |
                  sub_msg[IMU_GYROSCOPE_ORDER + 1] << 8 |
                  sub_msg[IMU_GYROSCOPE_ORDER];
  // Get accelerometer data
  imu_data.Gyroscope.x = gyro_byte & 0x1FF;
  imu_data.Gyroscope.y = gyro_byte & 0x1FF << 10;
  imu_data.Gyroscope.z = gyro_byte & 0x1FF << 20;
  // Judging positive and negative
  imu_data.Gyroscope.x = ((gyro_byte & 0x200) >> 9) == 0
                             ? imu_data.Gyroscope.x
                             : -imu_data.Gyroscope.x;
  imu_data.Gyroscope.y = ((gyro_byte & 0x200 << 10) >> 19) == 0
                             ? imu_data.Gyroscope.y
                             : -imu_data.Gyroscope.y;
  imu_data.Gyroscope.z = ((gyro_byte & 0x200 << 20) >> 29) == 0
                             ? imu_data.Gyroscope.z
                             : -imu_data.Gyroscope.z;
  // Combine the Magneticmeter information in sub_msg
  int magnetic_byte = sub_msg[IMU_MAGNETICMETER_ORDER + 3] << 24 |
                      sub_msg[IMU_MAGNETICMETER_ORDER + 2] << 16 |
                      sub_msg[IMU_MAGNETICMETER_ORDER + 1] << 8 |
                      sub_msg[IMU_MAGNETICMETER_ORDER];
  imu_data.Magneticmeter.x = magnetic_byte & 0x1FF;
  imu_data.Magneticmeter.y = magnetic_byte & 0x1FF << 10;
  imu_data.Magneticmeter.z = magnetic_byte & 0x1FF << 20;
  // Judging positive and negative
  imu_data.Magneticmeter.x = ((magnetic_byte & 0x200) >> 9) == 0
                                 ? imu_data.Magneticmeter.x
                                 : -imu_data.Magneticmeter.x;
  imu_data.Magneticmeter.y = ((magnetic_byte & 0x200 << 10) >> 19) == 0
                                 ? imu_data.Magneticmeter.y
                                 : -imu_data.Magneticmeter.y;
  imu_data.Magneticmeter.z = ((magnetic_byte & 0x200 << 20) >> 29) == 0
                                 ? imu_data.Magneticmeter.z
                                 : -imu_data.Magneticmeter.z;

#ifdef P_SUBSCRIBE
  if (crc_status == 0x01) {
    printf("last data error\n");
    printf_hex("sub_msg :", sub_msg);
  }
  // MOTOR Data
  for (int i = 0; i < 4; i++) {
    printf("motor %d : PWM %d, DIR %d, Enc %d, Spd %d, V %d, C %d\n", i,
           M_data.at(i).PWM, M_data.at(i).DIR, M_data.at(i).Encoder,
           M_data.at(i).Speed, M_data.at(i).Voltage, M_data.at(i).Current);
  }
  printf("\n");
  // IMU Data
  printf("Accelerometer :\n");
  printf("x : %d, y : %d, z : %d\n", imu_data.Accelerometer.x,
         imu_data.Accelerometer.y, imu_data.Accelerometer.z);
  printf("Gyroscope :\n");
  printf("x : %d, y : %d, z : %d\n", imu_data.Gyroscope.x, imu_data.Gyroscope.y,
         imu_data.Gyroscope.z);
  printf("Magneticmeter :\n");
  printf("x : %d, y : %d, z : %d\n", imu_data.Magneticmeter.x,
         imu_data.Magneticmeter.y, imu_data.Magneticmeter.z);
#endif  // P_SUBSCRIBE
}

/**
 * @brief  calculation crc code or check crc status
 * @param  msg, message to be calculated
 * @return  crc code(1 byte) or check status(1/0) or error(-1)
 */
uint8_t calculation_crc(vector<uint8_t>& msg) {
  uint8_t crc = 0;
  for (int i = 1; i < (msg.size() - 2); i++) {
    crc += msg[i];
  }
  return crc;
}

void signal_handler_IO(int Status) { wait_flag = false; }

/**
 * @brief get all sub msg
 */
vector<uint8_t> get_sub_msg() { return sub_msg; }

/**
 * @brief get IMU data
 */
motion::IMU get_IMU_data() { return imu_data; }

/**
 * @brief get motor states
 */
motion::MotorStates get_MotorStates(int index) { return M_data.at(index); }

void printf_hex(const char* text, vector<uint8_t>& msg) {
  printf("%s\n", text);
  for (int i = 0; i < msg.size(); i++) {
    printf("%02X ", msg.at(i));
  }
  printf("\n\n");
}
