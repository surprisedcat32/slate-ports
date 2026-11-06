#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.21.0.tar.gz
tar -xf libtasn1-4.21.0.tar.gz
cd "$(tar -tf libtasn1-4.21.0.tar.gz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
./configure --prefix=/usr --disable-static --disable-doc
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
