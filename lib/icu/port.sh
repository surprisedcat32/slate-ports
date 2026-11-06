#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://github.com/unicode-org/icu/releases/download/release-79-1/icu4c-79_1-src.tgz
tar -xf icu4c-79_1-src.tgz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
./runConfigureICU Linux --prefix=/usr
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
