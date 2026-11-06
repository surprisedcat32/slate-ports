#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://github.com/libexpat/libexpat/releases/download/R_2_9_0/expat-2.9.0.tar.xz
tar -xf expat-2.9.0.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure \
    --prefix=/usr \
    --disable-static \
    --enable-shared

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
