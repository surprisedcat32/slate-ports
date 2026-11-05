#!/bin/bash

cd /usr/ports/lib/readline

curl -LO https://ftp.gnu.org/gnu/readline/readline-8.3.tar.gz
tar -xf readline-8.3.tar.gz
cd readline-8.3

CFLAGS="-fPIC" ./configure --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install -j"$MAKETHREADS"
