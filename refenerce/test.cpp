#include <errno.h>   /* Error number definitions */
#include <fcntl.h>   /* File control definitions */
#include <stdio.h>   /* Standard input/output definitions */
#include <string.h>  /* String function definitions */
#include <termios.h> /* POSIX terminal control definitions */
#include <unistd.h>  /* UNIX standard function definitions */
// # include <stdlib.h> /* General purpose standard library */

#include <iostream>

using namespace std;

int main(int argc, char **argv) {
  int x = 0xEE;
  int y = 0xFD;

  unsigned char test;
  sprintf(test, "%x", x);
  printf("0x%x\n", test);

  return 0;
}
