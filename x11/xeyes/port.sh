#!/bin/bash
set -e

cd /usr/ports/x11/xeyes

curl -LO https://www.x.org/releases/individual/app/xeyes-1.3.0.tar.xz
tar -xf xeyes-1.3.0.tar.xz
cd xeyes-1.3.0

./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install -j"$MAKETHREADS"
