#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include <cstdlib>
#include <ctime>  // clock 函數所需之標頭檔
#include <iostream>
#include <sstream>
#include <vector>

using namespace std;

int main() {
  // uint8_t x = 1;
  // std::string y = to_string(x);
  // printf("X = %s\n", y.c_str());
  uint64_t my_int = 999999999999999999;
  printf("%ld\n", my_int);
  return 0;
}

// int main()
// {
//     vector<int> v1 = {5, 6};
//     // int x = v1.size();
//     // cout << x << endl;
//     char *y = "";
//     string x = x.assign(y);
//     printf("x = %s\n", x.c_str());
//     // v1.resize(5);
//     // for(int i = 0; i < v1.size() ; i++)
//     // {
//         // cout << v1[i] << endl;
//     // }
//     return 0;
// }

// int main ()
// {
//     char szNumbers[] = "2001 60c0c0 -1101110100110100100000 0x6fffff";
//     char * pEnd;
//     long int li1, li2, li3, li4;
//     li1 = strtol (szNumb，ers,&pEnd,10);
//     li2 = strtol (pEnd,&pEnd,16);
//     li3 = strtol (pEnd,&pEnd,2);
//     li4 = strtol (pEnd,NULL,0);
//     printf ("转换成10进制: %ld、%ld、%ld、%ld\n", li1, li2, li3, li4);
//     system("pause");
//     return 0;
// }

// double pi(int n)
// {
//     srand(5);
//     int count = 0;
//     for (int i = 0; i < n; ++i)
//     {
//         double x = (double) rand() / RAND_MAX;
//         double y = (double) rand() / RAND_MAX;
//         if (x * x + y * y <= 1)
//         {
//             ++count;
//         }
//     }
//     return (double) count / n * 4;
// }
// int main()
// {

//     clock_t start, end; // 儲存時間用的變數
//     start = clock(); // 計算開始時間
//     // 這邊放主要計算
//     ///////////////////
//     double result = pi(1e7);
//     ///////////////////
//     end = clock(); // 計算結束時間
//     double cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC; //
//     計算實際花費時間

//     cout << "pi的估計值為:" << result <<endl;
//     cout << "程式執行時間:" << cpu_time_used <<endl;
// }
