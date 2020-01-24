/**
 * This program can be compiled in two different scenarios:
   1. explicit include 'stdio.h' header
   2. use external function declaration

Note: On MacOS the compilation succeeds without any of the above required, however
   compiler stips out a warning.

   Later this example is used to benchmark compilation of these two approaches.

                                         - Vasiliy Zavyalov, 24-01-2020
 */

#if defined DO_INCLUDES
    #include <stdio.h>
    static const char* Name = "INCLUDES ";
#else
    extern int printf(const char * __restrict, ...);
    static const char* Name = "DECLATION";
#endif

int main() {

    printf("Hi Sailor! %s\n", Name);
    return 0;
}

