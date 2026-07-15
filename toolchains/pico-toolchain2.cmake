set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR x86_64)

set(CMAKE_SYSROOT /opt/pico-sysroot)
set(CMAKE_FIND_ROOT_PATH /opt/pico-sysroot)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(CMAKE_C_COMPILER /usr/bin/x86_64-linux-gnu-gcc)
set(CMAKE_CXX_COMPILER /usr/bin/x86_64-linux-gnu-g++)

set(THREADS_PREFER_PTHREAD_FLAG ON)

set(CMAKE_C_FLAGS_INIT "--sysroot=/opt/pico-sysroot -pthread")
set(CMAKE_CXX_FLAGS_INIT "--sysroot=/opt/pico-sysroot -pthread")
set(CMAKE_EXE_LINKER_FLAGS_INIT "--sysroot=/opt/pico-sysroot -pthread -Wl,-rpath,/opt/pico-sysroot/lib")
set(CMAKE_SHARED_LINKER_FLAGS_INIT "--sysroot=/opt/pico-sysroot -pthread -Wl,--enable-new-dtags")
set(CMAKE_MODULE_LINKER_FLAGS_INIT "--sysroot=/opt/pico-sysroot -pthread")

set(CMAKE_IGNORE_PATH /usr /usr/lib /usr/include /usr/local)
set(CMAKE_IGNORE_PREFIX_PATH /usr /usr/local)

set(CMAKE_PREFIX_PATH /opt/pico-sysroot)
set(CMAKE_LIBRARY_PATH /opt/pico-sysroot/lib /opt/pico-sysroot/usr/lib)
set(CMAKE_INCLUDE_PATH /opt/pico-sysroot/usr/include)
