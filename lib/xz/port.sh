#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://tukaani.org/xz/xz-5.8.1.tar.gz

tar -xf xz-5.8.1.tar.gz
cd "$(tar -tf xz-5.8.1.tar.gz | head -1 | cut -d/ -f1)"

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
./configure --prefix=/usr --disable-static
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

