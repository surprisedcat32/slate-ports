#!/bin/bash
set -e
cd /usr/ports/utils/alsa-utils

curl -LO https://www.alsa-project.org/files/pub/utils/alsa-utils-1.2.16.tar.bz2
tar -xf alsa-utils-1.2.16.tar.bz2
cd alsa-utils-1.2.16

./configure \
    --prefix=/usr \
    --disable-alsaconf \
    --disable-xmlto \
    --with-curses=ncursesw

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install -j"$MAKETHREADS"
