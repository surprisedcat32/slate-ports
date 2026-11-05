#!/bin/bash
set -e
cd /usr/ports/lib/sqlite
curl -LO https://www.sqlite.org/2025/sqlite-autoconf-3500400.tar.gz
tar -xf sqlite-autoconf-3500400.tar.gz
cd sqlite-autoconf-3500400
./configure --prefix=/usr --enable-shared --disable-static
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
