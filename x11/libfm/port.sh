#!/bin/bash
set -e
cd /usr/ports/x11/libfm

curl -LO https://downloads.sourceforge.net/pcmanfm/libfm-1.3.2.tar.xz
tar -xf libfm-1.3.2.tar.xz
cd libfm-1.3.2

./configure --prefix=/usr --sysconfdir=/etc --with-gtk=3 --disable-static

make
make DESTDIR="$DESTDIR" install
