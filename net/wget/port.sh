#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/net/wget

git clone --depth=1 https://git.savannah.gnu.org/git/wget.git

cd wget

./bootstrap

./configure \
    --prefix=/usr \
    --with-ssl=openssl

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
