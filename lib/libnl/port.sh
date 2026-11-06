#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://github.com/thom311/libnl/releases/download/libnl3_11_0/libnl-3.11.0.tar.gz
tar -xf libnl-3.11.0.tar.gz
cd "$(tar -tf libnl-3.11.0.tar.gz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure 
    --prefix=/usr 
    --sysconfdir=/etc 
    --disable-static 
    --disable-cli

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
