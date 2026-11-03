#!/bin/bash
set -e

cd /usr/ports/lib/yajl

curl -LO https://github.com/lloyd/yajl/archive/refs/tags/2.1.0.tar.gz
tar -xf 2.1.0.tar.gz
cd yajl-2.1.0

patch -p1 < /usr/ports/lib/yajl/patches/0001-cmake4-compatibility.patch

cmake -B build -S . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release

cmake --build build
DESTDIR="$DESTDIR" cmake --install build
