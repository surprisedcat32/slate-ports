#!/bin/bash
set -e
cd /usr/ports/lib/libbsd

curl -LO https://libbsd.freedesktop.org/releases/libbsd-0.12.2.tar.xz
tar -xf libbsd-0.12.2.tar.xz
cd libbsd-0.12.2
./configure \
    --prefix=/usr \
    --disable-static

make
make DESTDIR="$DESTDIR" install
echo "#include <bsd/sys/queue.h>" > /usr/include/sys/queue.h
