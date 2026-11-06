#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://www.kernel.org/pub/software/utils/pciutils/pciutils-3.15.0.tar.xz
tar -xf pciutils-3.15.0.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

make PREFIX=/usr SHARED=yes ZLIB=no DNS=no LIBKMOD=no HWDB=no -j"$MAKETHREADS"
make PREFIX=/usr SHARED=yes ZLIB=no DNS=no LIBKMOD=no HWDB=no \ -j"$MAKETHREADS"
    DESTDIR="$DESTDIR" install install-lib
