#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

curl -LO https://www.openssl.org/source/openssl-3.5.4.tar.gz

tar -xf openssl-3.5.4.tar.gz

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR
./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib shared
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

