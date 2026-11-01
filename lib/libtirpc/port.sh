#!/bin/bash
cd /usr/ports/lib/libtirpc

curl -LO https://downloads.sourceforge.net/project/libtirpc/libtirpc/1.3.8/libtirpc-1.3.8.tar.bz2
tar -xf libtirpc-1.3.8.tar.bz2
cd libtirpc-1.3.8

./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-gssapi \
    --disable-authdes

make
make DESTDIR="$DESTDIR" install
