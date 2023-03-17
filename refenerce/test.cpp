/*******************************
 * Include system header files
 ******************************/
#include <errno.h> /* Error number definitions */
#include <fcntl.h> /* File control definitions */
#include <stdio.h> /* Standard input/output definitions */
#include <stdlib.h>
#include <sys/signal.h>
#include <sys/types.h>
#include <termios.h> /* POSIX terminal control definitions */
#include <unistd.h>  /* UNIX standard function definitions */

#include <cmath>
#include <iostream>
#include <stdexcept>  // std::out_of_range
#include <string>
#include <vector>

int main(int argc, char *argv[]) {
  uint8_t a1 = 0x00;
  // uint8_t a2 = a1    0x01;
  printf("0x%02X\n", a2);
  // al = 1 << 1;
  // uint8_t a2 = 0xf >> 4 << 3;

  // printf("%02X\n", a1);
  // printf("%02X\n", a3);
  return 0;
}
