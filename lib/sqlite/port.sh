#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://www.sqlite.org/2025/sqlite-autoconf-3500400.tar.gz
tar -xf sqlite-autoconf-3500400.tar.gz
cd "$(tar -tf sqlite-autoconf-3500400.tar.gz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
./configure --prefix=/usr --enable-shared --disable-static
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
