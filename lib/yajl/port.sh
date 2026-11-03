#!/bin/bash
set -e

cd /usr/ports/lib/yajl

curl -LO https://github.com/lloyd/yajl/archive/refs/tags/2.1.0.tar.gz
tar -xf 2.1.0.tar.gz
cd yajl-2.1.0

cmake -B build -S . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_C_FLAGS="$CFLAGS"

cmake --build build
DESTDIR="$DESTDIR" cmake --install build
