#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://dl.suckless.org/tools/ubase-0.1.tar.gz
tar -xf ubase-0.1.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

make -j"$MAKETHREADS"
make PREFIX=/usr DESTDIR="$DESTDIR" install
