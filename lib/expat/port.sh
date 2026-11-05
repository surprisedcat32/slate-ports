#!/bin/bash
set -e

cd /usr/ports/lib/expat
curl -LO https://github.com/libexpat/libexpat/releases/download/R_2_9_0/expat-2.9.0.tar.xz
tar -xf expat-2.9.0.tar.xz
cd expat-2.9.0

./configure \
    --prefix=/usr \
    --disable-static \
    --enable-shared

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install -j"$MAKETHREADS"
