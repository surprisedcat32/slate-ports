#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://ftp.gnu.org/gnu/readline/readline-8.3.tar.gz
tar -xf readline-8.3.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

CFLAGS="-fPIC" ./configure --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
