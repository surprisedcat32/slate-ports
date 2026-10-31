#!/bin/bash
set -e

cd /usr/ports/x11/xauth
curl -LO https://xorg.freedesktop.org/releases/individual/app/xauth-1.1.tar.gz
tar -xf xauth-1.1.tar.gz
cd xauth-1.1

./autogen.sh --prefix=/usr
make -j"$(nproc)"
make DESTDIR="$DESTDIR" install
