#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://ftp.gnu.org/gnu/patch/patch-2.8.tar.xz
tar -xf patch-2.8.tar.xz
cd "$(tar -tf patch-2.8.tar.xz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure \
    --prefix=/usr \
    --disable-nls

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
