#!/bin/bash
set -e
cd /usr/ports/dev/which
curl -LO https://ftp.gnu.org/gnu/which/which-2.25.tar.gz
tar -xf which-2.25.tar.gz
cd which-2.25
./configure --prefix=/usr
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
