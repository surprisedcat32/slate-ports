#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.21.0.tar.gz
tar -xf libtasn1-4.21.0.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
./configure --prefix=/usr --disable-static --disable-doc
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
