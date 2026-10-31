#!/bin/bash
slate install dev/dev

cd /usr/ports/lib/openssl

curl -LO https://www.openssl.org/source/openssl-3.5.4.tar.gz

tar -xf openssl-3.5.4.tar.gz

cd openssl-3.5.4
./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib shared
make -j"$(nproc)"
make DESTDIR="$DESTDIR" install

