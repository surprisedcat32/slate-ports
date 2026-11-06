#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://skarnet.org/software/mdevd/mdevd-0.1.5.0.tar.gz
tar -xf mdevd-0.1.5.0.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

./configure \
    --prefix=/usr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
