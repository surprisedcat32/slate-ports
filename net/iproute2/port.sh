#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-7.3.0.tar.xz
tar -xf iproute2-7.3.0.tar.xz
cd "$(tar -tf iproute2-7.3.0.tar.xz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
