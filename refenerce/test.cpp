// #include <cstdlib>
// #include <iostream>
// #include <sstream>
// // #define exe
// int main() {
//   double x = 0.2222;
//   int y = 1;
//   if (x >= y) {
//     printf("X = %d\n", x);
//   }
//   return 0;
// }

#include <iostream>
#include <vector>

using namespace std;

int main()
{
    vector<int> v1 = {5, 6};
    v1.resize(5);
    for(int i = 0; i < v1.size() ; i++)
    {
        cout << v1[i] << endl;
    }
    return 0;
}

// #include <iostream>
// #include <ctime> // clock 函數所需之標頭檔
// using namespace std;

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
