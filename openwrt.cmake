set(CMAKE_SYSTEM_NAME Linux)

set(tools $ENV{OPENWRT_TOOLCHAIN_DIR})
set(CMAKE_C_COMPILER ${tools}/bin/mipsel-openwrt-linux-musl-gcc)
set(CMAKE_CXX_COMPILER ${tools}/bin/mipsel-openwrt-linux-musl-g++)
# set(CMAKE_C_FLAGS "-ffreestanding  -fno-stack-protector")
# set(CMAKE_CXX_FLAGS "-ffreestanding  -fno-stack-protector")

set(CMAKE_FIND_ROOT_PATH $ENV{OPENWRT_TOOLCHAIN_DIR})
# set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
