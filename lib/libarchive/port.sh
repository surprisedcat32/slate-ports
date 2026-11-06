#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://www.libarchive.org/downloads/libarchive-3.8.1.tar.xz
tar -xf libarchive-3.8.1.tar.xz
cd "$(tar -tf libarchive-3.8.1.tar.xz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

cmake -S . -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_TEST=OFF

cmake --build build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" cmake --install build
