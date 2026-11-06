#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://github.com/dosfstools/dosfstools/releases/download/v4.2/dosfstools-4.2.tar.gz

tar -xf dosfstools-4.2.tar.gz

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
./configure --prefix=/usr --sbindir=/usr/sbin
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

