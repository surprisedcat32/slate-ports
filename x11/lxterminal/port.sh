#!/bin/bash
set -e

cd /usr/ports/x11/lxterminal

curl -LO https://downloads.sourceforge.net/lxde/lxterminal-0.4.1.tar.xz
tar -xf lxterminal-0.4.1.tar.xz
cd lxterminal-0.4.1

./configure --prefix=/usr --sysconfdir=/etc --disable-static

make
make DESTDIR="$DESTDIR" install
