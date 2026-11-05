#!/bin/bash
set -e
cd /usr/ports/lib/openjpeg
curl -LO https://github.com/uclouvain/openjpeg/archive/refs/tags/v2.5.4.tar.gz
tar -xf v2.5.4.tar.gz
cd openjpeg-2.5.4
cmake -S . -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_CODEC=OFF \
    -DBUILD_TESTING=OFF
ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
