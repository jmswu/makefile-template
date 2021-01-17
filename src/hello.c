#include <stdio.h>
#include "hello.h"
#include "return_a_num.h"

void say_hello(void)
{
    printf("Say hello! %d\n", return_a_number());
}