#!/bin/sh
set -e

cd "${PORT_DIR:-/usr/ports}/lib/libxml2"

curl -LO https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.4.tar.xz
tar -xf libxml2-2.15.4.tar.xz
cd libxml2-2.15.4

./configure \
    --prefix=/usr \
    --disable-static \
    --without-python \
    --without-readline \
    --without-zlib \
    --without-lzma \
    --without-icu \
    --without-modules \
    --without-docs

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
