#!/bin/bash
cd /usr/ports/utils/farbfeld

curl -LO https://dl.suckless.org/farbfeld/farbfeld-4.tar.gz
tar -xf farbfeld-4.tar.gz
cd farbfeld-4

make -j"$MAKETHREADS"
make PREFIX=/usr DESTDIR="$DESTDIR" install
