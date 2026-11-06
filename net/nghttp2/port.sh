#!/bin/sh
set -e

cd "${PORT_DIR:-/usr/ports}/net/nghttp2"

curl -LO https://github.com/nghttp2/nghttp2/releases/download/v1.71.0/nghttp2-1.71.0.tar.gz
tar -xf nghttp2-1.71.0.tar.gz
cd nghttp2-1.71.0

./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --enable-lib-only

make -j$(nproc)
make DESTDIR="$DESTDIR" install
