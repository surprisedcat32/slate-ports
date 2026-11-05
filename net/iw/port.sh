#!/bin/bash
set -e
cd /usr/ports/net/iw
curl -LO https://www.kernel.org/pub/software/network/iw/iw-6.17.tar.xz
tar -xf iw-6.17.tar.xz
cd iw-6.17
make -j"$MAKETHREADS"
make PREFIX=/usr DESTDIR="$DESTDIR" install
