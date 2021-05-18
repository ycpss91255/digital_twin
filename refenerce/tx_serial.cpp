#include <errno.h>   /* Error number definitions */
#include <fcntl.h>   /* File control definitions */
#include <stdio.h>   /* Standard input/output definitions */
#include <string.h>  /* String function definitions */
#include <termios.h> /* POSIX terminal control definitions */
#include <unistd.h>  /* UNIX standard function definitions */
// # include <stdlib.h> /* General purpose standard library */

#include <iostream>

using namespace std;

int fd;

int open_port(void) {
  fd = open("/dev/ttyUSB0", O_RDWR | O_NOCTTY | O_NDELAY);
  if (fd == -1) {
    perror("open_port: Unable to open /dev/ttyUSB0 - ");
  }
  return (fd);
}

int main(int argc, char **argv) {
  open_port();
  int i = 0;
  while (1) {
    char buf[128] = "hello world ";

    char num_buf[16];
    sprintf(num_buf, "%d", i);
    strcat(buf, num_buf);

    int buf_len = sizeof(buf) / sizeof(char);

    int n = write(fd, &buf, buf_len);
    printf("%s\n", buf);
    if (n < 0) {
      printf("write() of %d bytes failed!\n", buf_len);
    }
    sleep(1);
    i++;
  }

  close(fd);
  return 0;
}

// #include <algorithm>
// #include <iostream>
// #include <vector>
// #include <string>

// int main() {
//     std::vector<std::string> symbols = {"IF1209", "IF1210"};
//     std::vector<const char *> chars(symbols.size());

//     std::for_each(symbols.begin(), symbols.end(), [](std::string& s) {
//         std::cout << s << std::endl;
//     });

//     std::transform(symbols.begin(), symbols.end(), chars.begin(),
//     std::mem_fun_ref(&std::string::c_str));

//     std::for_each(chars.begin(), chars.end(), [](const char *s) {
//         std::cout << s << std::endl;
//     });

//     return 0;
// }
