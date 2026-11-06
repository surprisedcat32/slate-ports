#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://libbsd.freedesktop.org/releases/libbsd-0.12.2.tar.xz
tar -xf libbsd-0.12.2.tar.xz
cd "$(tar -tf libbsd-0.12.2.tar.xz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
./configure \
    --prefix=/usr \
    --disable-static

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
echo "#include <bsd/sys/queue.h>" > /usr/include/sys/queue.h
