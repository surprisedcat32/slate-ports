#!/bin/bash
set -e
cd /usr/ports/x11/pcmanfm

curl -LO https://downloads.sourceforge.net/pcmanfm/pcmanfm-1.3.2.tar.xz
tar -xf pcmanfm-1.3.2.tar.xz
cd pcmanfm-1.3.2

./configure --prefix=/usr --sysconfdir=/etc --with-gtk=3

make
make DESTDIR="$DESTDIR" install
