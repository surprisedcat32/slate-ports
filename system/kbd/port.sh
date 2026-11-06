#!/bin/sh
set -e
cd "${PORT_DIR:-/usr/ports}/system/kbd"
curl -LO https://www.kernel.org/pub/linux/utils/kbd/kbd-2.10.0.tar.xz
tar -xf kbd-2.10.0.tar.xz
cd kbd-2.10.0
./configure --prefix=/usr
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
