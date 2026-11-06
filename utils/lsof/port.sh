#!/bin/sh
set -e
cd "${PORT_DIR:-/usr/ports}/utils/lsof"
curl -LO https://github.com/lsof-org/lsof/releases/download/4.99.5/lsof-4.99.5.tar.gz
tar -xf lsof-4.99.5.tar.gz
cd lsof-4.99.5
./configure --prefix=/usr --disable-static
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
