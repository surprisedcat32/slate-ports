#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://www.kernel.org/pub/linux/utils/kbd/kbd-2.10.0.tar.xz
tar -xf kbd-2.10.0.tar.xz
cd "$(tar -tf kbd-2.10.0.tar.xz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
./configure --prefix=/usr
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
