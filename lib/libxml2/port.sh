#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.4.tar.xz
tar -xf libxml2-2.15.4.tar.xz
cd "$(tar -tf libxml2-2.15.4.tar.xz | head -1 | cut -d/ -f1)"

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
