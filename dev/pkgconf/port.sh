#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://distfiles.ariadne.space/pkgconf/pkgconf-3.0.10.tar.xz
tar -xf pkgconf-3.0.10.tar.xz
cd "$(tar -tf pkgconf-3.0.10.tar.xz | head -1 | cut -d/ -f1)"

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

CC=cross-musl-gcc \
./configure \
    --build="$(./config.guess)" \
    --host=x86_64-linux-musl \
    --prefix=/usr \
    --with-sysroot=/ \
    --with-system-libdir=/usr/lib \
    --with-system-includedir=/usr/include \
    --with-pkg-config-dir=/usr/lib/pkgconfig:/usr/share/pkgconfig

make  -j"$MAKETHREADS"
make install DESTDIR="${DESTDIR:-}"

