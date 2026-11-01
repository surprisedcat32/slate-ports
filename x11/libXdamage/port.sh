#!/bin/bash
set -e
cd /usr/ports/x11/libXdamage

curl -LO https://xorg.freedesktop.org/releases/individual/lib/libXdamage-1.2.1.tar.xz
tar -xf libXdamage-1.2.1.tar.xz
cd libXdamage-1.2.1

./configure --prefix=/usr

make
make DESTDIR="$DESTDIR" install
