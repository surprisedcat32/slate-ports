#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://www.openssl.org/source/openssl-3.5.4.tar.gz

tar -xf openssl-3.5.4.tar.gz
cd "$(tar -tf openssl-3.5.4.tar.gz | head -1 | cut -d/ -f1)"

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib shared
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

