#!/bin/bash
set -e
cd /usr/ports/lib/libtasn1
curl -LO https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.21.0.tar.gz
tar -xf libtasn1-4.21.0.tar.gz
cd libtasn1-4.21.0
./configure --prefix=/usr --disable-static --disable-doc
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
