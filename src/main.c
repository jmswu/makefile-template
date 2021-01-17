#include <stdio.h>
#include "hello.h"
#include "sayhi.h"

int main(int argc, char **argv)
{
    // dummy code to get rid of warnings
    argc++;
    argv++;

    say_hello();
    say_hi();
    return 0;
}

