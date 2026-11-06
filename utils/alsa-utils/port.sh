#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://www.alsa-project.org/files/pub/utils/alsa-utils-1.2.16.tar.bz2
tar -xf alsa-utils-1.2.16.tar.bz2
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

./configure \
    --prefix=/usr \
    --disable-alsaconf \
    --disable-xmlto \
    --with-curses=ncursesw

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
