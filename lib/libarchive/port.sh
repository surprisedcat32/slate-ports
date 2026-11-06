#!/bin/sh
cd "${PORT_DIR:-/usr/ports}/lib/libarchive"

curl -LO https://www.libarchive.org/downloads/libarchive-3.8.1.tar.xz
tar -xf libarchive-3.8.1.tar.xz
cd libarchive-3.8.1

cmake -S . -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_TEST=OFF

cmake --build build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" cmake --install build
