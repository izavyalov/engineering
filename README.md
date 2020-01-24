# software engineering

## Program compilation times

The program compilation time is important aspect of software engineer daily routine. The compilation time affects an efficiency of development process.
Here in particular, C/C++ compilation times have been looked at. The interfaces are defined in header files (usually .h, .hpp) and the implementation resides in source files (.c, .cpp). For clarity, the interface is a set of functions, types or/and objects.

```c
#include <stdio.h>        // Most books on programmng would require this include here!
int main() {
  printf("Hi Sailor!\n");
  return 0;
}
```

However, the following option is valid too:
```c
// command to build: gcc -O2 ./main.c

extern int printf(const char * __restrict, ...); // (1)

int main() {
  printf("Hi Sailor!\n");
  return 0;
}
```
*Note* in this simple example, the line (1) can be omitted and the compiler will still resolve symbols and successfully build.
With third party libraries external declarations should be specified or otherwise compiler/linker will **fail** to resolve symbols.

The **question** is which program would compile faster —
- the first one with explicit include *OR*
- the second version with extern declaration?

### Benchmarking tool
   * hyperfine - benchmarking tool: https://github.com/sharkdp/hyperfine/releases/tag/v1.9.0

### Execution

```bash
  ./run-bench-1.sh
```

### Results

* Setup without include files runs **faster**, see image or execute given command above locally to confirm.
* Explanation could be that compiler / preprocessor has one less file to read from hard-disk that is likely located far from source directory (at least standard library headers are).
* It is likely to be a hard task to develop with **no** includes approach, in particular for programs written in C++ language.
  * Try using Boost library functions or types without adding include instruction to your implementation.
  * Likely, IDEs fall short on supporting this model and that complicates an adoption of it.


<img style="border:1px solid yellow" src="https://github.com/izavyalov/engineering/blob/master/bench_pic1.png" alt="Sample of results on MacBookPro" width="800" />


  - Vasiliy ZAVYALOV, 24-01-2020


