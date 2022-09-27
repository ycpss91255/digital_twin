/*
 * motordriver.h
 *
 *-------------------------------------------
 *    date    |   author    |  ver. | comment
 *  2021.5.6  | Shih-An Li  |  0.1  | initial
 *  2021.5.20 | Shih-An Li  |  2.0  | 有加入Fifo的硬體及軟體判斷
 *-------------------------------------------
 */

#ifndef MOTORDRIVER_H_
#define MOTORDRIVER_H_
/* nios2 system library */
#include <system.h>
#include <stdio.h>
#include <io.h>
#include <unistd.h>
/* motor parameter file */
#include "..\motor.h"

#define TRIGGER 1<<31 /* give trigger */


#endif /* MOTORDRIVER_H_ */
