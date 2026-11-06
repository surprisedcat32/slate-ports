#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://dl.suckless.org/farbfeld/farbfeld-4.tar.gz
tar -xf farbfeld-4.tar.gz
cd "$(tar -tf farbfeld-4.tar.gz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

make -j"$MAKETHREADS"
make PREFIX=/usr DESTDIR="$DESTDIR" install
