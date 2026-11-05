#!/bin/bash
set -e
cd /usr/ports/lib/libwebp
curl -LO https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.6.0.tar.gz
tar -xf libwebp-1.6.0.tar.gz
cd libwebp-1.6.0
cmake -S . -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON \
    -DWEBP_BUILD_ANIM_UTILS=OFF \
    -DWEBP_BUILD_CWEBP=OFF \
    -DWEBP_BUILD_DWEBP=OFF \
    -DWEBP_BUILD_EXTRAS=OFF
ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
