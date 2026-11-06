#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://libbsd.freedesktop.org/releases/libmd-1.1.0.tar.xz
tar -xf libmd-1.1.0.tar.xz
cd "$(tar -tf libmd-1.1.0.tar.xz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure \
    --prefix=/usr \
    --disable-static

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
