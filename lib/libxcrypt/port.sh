#!/bin/bash
set -e

cd /usr/ports/lib/libxcrypt

curl -LO https://github.com/besser82/libxcrypt/releases/download/v4.4.38/libxcrypt-4.4.38.tar.xz
tar -xf libxcrypt-4.4.38.tar.xz
cd libxcrypt-4.4.38

./configure \
    --prefix=/usr \
    --enable-hashes=strong,glibc \
    --enable-obsolete-api=glibc \
    --disable-static

make
make DESTDIR="$DESTDIR" install
