#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://cache.ruby-lang.org/pub/ruby/4.0/ruby-4.0.9.tar.xz
tar -xf ruby-4.0.9.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
./configure --prefix=/usr --disable-install-doc --enable-shared
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
