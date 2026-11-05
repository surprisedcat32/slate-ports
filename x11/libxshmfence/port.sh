#!/bin/bash
set -e

cd /usr/ports/x11/libxshmfence
curl -LO https://xorg.freedesktop.org/releases/individual/lib/libxshmfence-1.3.tar.gz
tar -xf libxshmfence-1.3.tar.gz
cd libxshmfence-1.3
./configure --prefix=/usr
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install -j"$MAKETHREADS"
