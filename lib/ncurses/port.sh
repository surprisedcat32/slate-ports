#!/bin/bash

cd /usr/ports/lib/ncurses

curl -LO https://ftp.gnu.org/gnu/ncurses/ncurses-6.5.tar.gz

tar -xf ncurses-6.5.tar.gz

cd ncurses-6.5
./configure --prefix=/usr --with-shared --enable-widec --with-termlib --enable-pc-files --with-pkg-config-libdir=/usr/lib/pkgconfig
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install -j"$MAKETHREADS"

