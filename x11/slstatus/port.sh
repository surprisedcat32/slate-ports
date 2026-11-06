#!/bin/sh
cd "${PORT_DIR:-/usr/ports}/x11/slstatus"

curl -LO https://dl.suckless.org/tools/slstatus-1.1.tar.gz
tar -xf slstatus-1.1.tar.gz
cd slstatus-1.1

make -j"$MAKETHREADS"
make PREFIX=/usr DESTDIR="$DESTDIR" install
