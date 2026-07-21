# =========================================================
# STRICT CROSS BUILD USING HOST GCC + FULL SYSROOT ISOLATION
# =========================================================

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR x86_64)

# -------------------------
# SYSROOT
# -------------------------
set(CMAKE_SYSROOT /opt/pico-sysroot)

# IMPORTANT: force all searches into sysroot only
set(CMAKE_FIND_ROOT_PATH /opt/pico-sysroot)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# -------------------------
# COMPILER (KEEP HOST GCC BUT CONTROL IT HARD)
# -------------------------
set(CMAKE_C_COMPILER /usr/bin/x86_64-linux-gnu-gcc)
set(CMAKE_CXX_COMPILER /usr/bin/x86_64-linux-gnu-g++)

# IMPORTANT: force GCC to NOT use native paths
set(CMAKE_C_FLAGS_INIT "--sysroot=/opt/pico-sysroot -nostdinc -nostdlibinc -isystem /opt/pico-sysroot/usr/include -isystem /opt/pico-sysroot/usr/include/x86_64-linux-gnu")

set(CMAKE_CXX_FLAGS_INIT "--sysroot=/opt/pico-sysroot -nostdinc++ -nostdlibinc -isystem /opt/pico-sysroot/usr/include -isystem /opt/pico-sysroot/usr/include/x86_64-linux-gnu")

# -------------------------
# LINKER HARD CONTROL
# -------------------------
set(CMAKE_EXE_LINKER_FLAGS_INIT "--sysroot=/opt/pico-sysroot -Wl,--disable-new-dtags")

set(CMAKE_SHARED_LINKER_FLAGS_INIT "--sysroot=/opt/pico-sysroot -Wl,--disable-new-dtags")

# -------------------------
# THREADS
# -------------------------
set(THREADS_PREFER_PTHREAD_FLAG ON)

# -------------------------
# SEARCH PATHS
# -------------------------
set(CMAKE_PREFIX_PATH /opt/pico-sysroot /opt/mujoco)
set(CMAKE_LIBRARY_PATH /opt/pico-sysroot/usr/lib /opt/pico-sysroot/lib)
set(CMAKE_INCLUDE_PATH /opt/pico-sysroot/usr/include)
