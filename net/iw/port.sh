#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://www.kernel.org/pub/software/network/iw/iw-6.17.tar.xz
tar -xf iw-6.17.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
make -j"$MAKETHREADS"
make PREFIX=/usr DESTDIR="$DESTDIR" install
