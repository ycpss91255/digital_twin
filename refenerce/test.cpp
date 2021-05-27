#include <errno.h>   /* Error number definitions */
#include <fcntl.h>   /* File control definitions */
#include <stdio.h>   /* Standard input/output definitions */
#include <string.h>  /* String function definitions */
#include <termios.h> /* POSIX terminal control definitions */
#include <unistd.h>  /* UNIX standard function definitions */
// # include <stdlib.h> /* General purpose standard library */
#include <iostream>
#include <vector>

using namespace std;
void prrr(vector<float> &speed) {
  for (int i = 0, j = 0; i < speed.size(); i++) {
    printf("bingo%f\n", speed.at(i));
  }
}


int main(int argc, char **argv) {
  vector<float> speed(3,1);
  // speed.resize(3);
  speed.at(1) = -1;
  prrr(speed);
  return 0;
}

