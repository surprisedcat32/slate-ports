#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://github.com/c-ares/c-ares/releases/download/v1.34.9/c-ares-1.34.9.tar.gz
tar -xf c-ares-1.34.9.tar.gz
cd "$(tar -tf c-ares-1.34.9.tar.gz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

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
