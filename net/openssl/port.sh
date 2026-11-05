#!/bin/bash

cd /usr/ports/net/openssl

curl -LO https://www.openssl.org/source/openssl-3.5.4.tar.gz

tar -xf openssl-3.5.4.tar.gz

cd openssl-3.5.4
./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib shared
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install -j"$MAKETHREADS"

