#!/bin/bash
set -e

cd /usr/ports/lib/yajl

curl -LO https://github.com/lloyd/yajl/archive/refs/tags/2.1.0.tar.gz
tar -xf 2.1.0.tar.gz
cd yajl-2.1.0
# Fix minimum CMake version
sed -i 's/CMAKE_MINIMUM_REQUIRED(VERSION 2.6)/CMAKE_MINIMUM_REQUIRED(VERSION 3.5)/' CMakeLists.txt
sed -i 's/GET_TARGET_PROPERTY(\([^ ]*\) \([^ ]*\) LOCATION)/GET_TARGET_PROPERTY(\1 \2 LOCATION)/' /dev/null
cmake -B build -S . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_C_FLAGS="$CFLAGS"

cmake --build build
DESTDIR="$DESTDIR" cmake --install build
