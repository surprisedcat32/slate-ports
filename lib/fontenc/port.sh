#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://mirror.csclub.uwaterloo.ca/x.org/individual/lib/libfontenc-1.1.7.tar.xz
tar -xf libfontenc-1.1.7.tar.xz
cd "$(tar -tf libfontenc-1.1.7.tar.xz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
./configure --prefix=/usr
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
