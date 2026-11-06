#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://distfiles.dereferenced.org/pkgconf/pkgconf-2.5.1.tar.xz

tar -xf pkgconf-2.5.1.tar.xz
cd "$(tar -tf pkgconf-2.5.1.tar.xz | head -1 | cut -d/ -f1)"

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
./configure --prefix=/usr --disable-static
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

