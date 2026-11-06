#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://github.com/lloyd/yajl/archive/refs/tags/2.1.0.tar.gz
tar -xf 2.1.0.tar.gz
cd "$(tar -tf 2.1.0.tar.gz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

patch -p1 < /usr/ports/lib/yajl/patches/0001-cmake4-compatibility.patch

cmake -B build -S . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release

cmake --build build
DESTDIR="$DESTDIR" cmake --install build
