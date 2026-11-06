#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://github.com/nghttp2/nghttp2/releases/download/v1.71.0/nghttp2-1.71.0.tar.gz
tar -xf nghttp2-1.71.0.tar.gz
cd "$(tar -tf nghttp2-1.71.0.tar.gz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --enable-lib-only

make -j$(nproc)
make DESTDIR="$DESTDIR" install
