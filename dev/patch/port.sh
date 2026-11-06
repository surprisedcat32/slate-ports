#!/bin/sh
set -e

cd "${PORT_DIR:-/usr/ports}/dev/patch"

curl -LO https://ftp.gnu.org/gnu/patch/patch-2.8.tar.xz
tar -xf patch-2.8.tar.xz
cd patch-2.8

./configure \
    --prefix=/usr \
    --disable-nls

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
