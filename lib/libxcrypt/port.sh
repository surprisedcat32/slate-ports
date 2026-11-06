#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

curl -LO https://github.com/besser82/libxcrypt/releases/download/v4.4.38/libxcrypt-4.4.38.tar.xz
tar -xf libxcrypt-4.4.38.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

./configure \
    --prefix=/usr \
    --enable-hashes=strong,glibc \
    --enable-obsolete-api=glibc \
    --disable-static

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
