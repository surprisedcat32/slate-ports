#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://ftp.gnu.org/gnu/ncurses/ncurses-6.5.tar.gz

tar -xf ncurses-6.5.tar.gz
cd "$(tar -tf ncurses-6.5.tar.gz | head -1 | cut -d/ -f1)"

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
./configure --prefix=/usr --with-shared --enable-widec --with-termlib --enable-pc-files --with-pkg-config-libdir=/usr/lib/pkgconfig
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

