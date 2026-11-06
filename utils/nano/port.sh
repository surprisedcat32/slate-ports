#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://ftp.gnu.org/gnu/nano/nano-9.3.tar.xz
tar -xf nano-9.3.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
./configure --prefix=/usr --disable-nls
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
