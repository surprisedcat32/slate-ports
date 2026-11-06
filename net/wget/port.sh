#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

git clone --depth=1 https://git.savannah.gnu.org/git/wget.git

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

./bootstrap

./configure \
    --prefix=/usr \
    --with-ssl=openssl

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
