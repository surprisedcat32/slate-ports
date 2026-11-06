#!/bin/sh
set -e

cd "${PORT_DIR:-/usr/ports}/x11/bdftopcf"
curl -LO https://xorg.freedesktop.org/releases/individual/util/bdftopcf-1.1.2.tar.xz
tar -xf bdftopcf-1.1.2.tar.xz
cd bdftopcf-1.1.2

./configure --prefix=/usr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
