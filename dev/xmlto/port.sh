#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://anduin.linuxfromscratch.org/BLFS/xmlto/xmlto-0.0.29.tar.gz

tar -xf xmlto-0.0.29.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

autoreconf -fiv

./configure \
    --prefix=/usr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

