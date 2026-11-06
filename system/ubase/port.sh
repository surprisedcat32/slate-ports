#!/bin/sh
cd "${PORT_DIR:-/usr/ports}/system/ubase

curl -LO https://dl.suckless.org/tools/ubase-0.1.tar.gz
tar -xf ubase-0.1.tar.gz
cd ubase-0.1

make -j"$MAKETHREADS"
make PREFIX=/usr DESTDIR="$DESTDIR" install
