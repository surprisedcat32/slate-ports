#!/bin/bash
set -e
cd /usr/ports/x11/menu-cache

curl -LO https://downloads.sourceforge.net/lxde/menu-cache-1.1.0.tar.xz
tar -xf menu-cache-1.1.0.tar.xz
cd menu-cache-1.1.0

./configure --prefix=/usr --disable-static

make
make DESTDIR="$DESTDIR" install
