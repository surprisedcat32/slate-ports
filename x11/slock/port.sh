#!/bin/sh
cd "${PORT_DIR:-/usr/ports}/x11/slock"

curl -LO https://dl.suckless.org/tools/slock-1.5.tar.gz
tar -xf slock-1.5.tar.gz
cd slock-1.5

make -j"$MAKETHREADS"
make PREFIX=/usr DESTDIR="$DESTDIR" install
