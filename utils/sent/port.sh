#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://dl.suckless.org/tools/sent-1.3.tar.gz
tar -xf sent-1.3.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

make -j"$MAKETHREADS"
make PREFIX=/usr DESTDIR="$DESTDIR" install
