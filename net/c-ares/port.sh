#!/bin/sh
set -e

cd "${PORT_DIR:-/usr/ports}/net/c-ares"

curl -LO https://github.com/c-ares/c-ares/releases/download/v1.34.9/c-ares-1.34.9.tar.gz
tar -xf c-ares-1.34.9.tar.gz
cd c-ares-1.34.9

cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCARES_SHARED=ON \
    -DCARES_STATIC=OFF \
    -DCARES_INSTALL=ON \
    -DCARES_BUILD_TESTS=OFF \
    -DCARES_BUILD_TOOLS=OFF

cmake --build build -j$(nproc)
DESTDIR="$DESTDIR" cmake --install build
