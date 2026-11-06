#!/bin/sh
set -e

cd "${PORT_DIR:-/usr/ports}/lib/libev"

curl -LO https://dist.schmorp.de/libev/Attic/libev-4.33.tar.gz
tar -xf libev-4.33.tar.gz
cd libev-4.33

./configure --prefix=/usr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
