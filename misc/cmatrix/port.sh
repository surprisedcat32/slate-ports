#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR
curl -LO https://github.com/abishekvashok/cmatrix/archive/refs/tags/v2.0.tar.gz
tar -xf v2.0.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

./autogen.sh
./configure --prefix=/usr

make -j"$MAKETHREADS"
DESTDIR="$DESTDIR" make install
