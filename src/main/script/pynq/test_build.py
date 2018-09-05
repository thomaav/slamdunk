from cffi import FFI
ffibuilder = FFI()

# string that lists all C types, functions and globals that will be
# accessed/needed within Python
ffibuilder.cdef("""
void *init_platform();
void deinit_platform(void *platform);

void *dalloc(void *platform, size_t size);
void dfree(void *platform, void *ptr);
void dmeminit(void *platform, void *dst, unsigned char *src, size_t num);
void dmemread(void *platform, unsigned char *dst, void *src, size_t num);

void run(void *platform);
void run_memory_test(void *platform);
""")

ffibuilder.set_source("_test",
"""
#include "EchoNumber.hpp"
#include "run.hpp"
#include "platform.h"
""",

sources=['platform-xlnk.cpp', 'run.cpp'],
libraries=['sds_lib'],
extra_compile_args=['-std=c++11'],
source_extension='.cpp')

if __name__ == '__main__':
    ffibuilder.compile(verbose=True)
