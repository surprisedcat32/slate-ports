#!/bin/sh
set -e
cd "${PORT_DIR:-/usr/ports}/lib/alsa-lib

curl -LO https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.16.1.tar.bz2
tar -xf alsa-lib-1.2.16.1.tar.bz2
cd alsa-lib-1.2.16.1

./configure \
    --prefix=/usr \
    --disable-static

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
