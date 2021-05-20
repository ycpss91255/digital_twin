#ifndef SERIAL_H
#define SERIAL_H

#include <errno.h> /* Error number definitions */
#include <fcntl.h> /* File control definitions */
#include <stdio.h> /* Standard input/output definitions */
#include <stdlib.h>
#include <string.h>  /* String function definitions */
#include <termios.h> /* POSIX terminal control definitions */
#include <unistd.h>  /* UNIX standard function definitions */

#include <string>

using namespace std;

class Serial {
  // functions
 public:
  Serial(std::string, unsigned int);
  //   Serial();
  // ~Serial();

  void init();

  //  private:
  // variables
  //  public:
 private:
  const char* port = nullptr;
  int fd;
  termios opt;
};

#endif  // SERIAL_H
