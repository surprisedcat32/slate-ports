#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://downloads.sourceforge.net/project/libtirpc/libtirpc/1.3.8/libtirpc-1.3.8.tar.bz2
tar -xf libtirpc-1.3.8.tar.bz2
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
sed -i 's|#include <sys/queue.h>|#include <bsd/sys/queue.h>|' $(grep -rl '#include <sys/queue.h>' .)
./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-gssapi \
    --disable-authdes

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
