#!/bin/bash
set -e
cd /usr/ports/system/parted
curl -LO https://ftp.gnu.org/gnu/parted/parted-3.8.tar.xz
tar -xf parted-3.8.tar.xz
cd parted-3.8
./configure --prefix=/usr --disable-nls --disable-readline
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install -j"$MAKETHREADS"
