#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://github.com/abishekvashok/cmatrix/archive/refs/tags/v2.0.tar.gz
tar -xf v2.0.tar.gz
cd "$(tar -tf v2.0.tar.gz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./autogen.sh
./configure --prefix=/usr

make -j"$MAKETHREADS"
DESTDIR="$DESTDIR" make install
