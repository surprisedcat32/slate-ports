#!/bin/bash
cd /usr/ports/misc/cmatrix
curl -LO https://github.com/abishekvashok/cmatrix/archive/refs/tags/v2.0.tar.gz
tar -xf v2.0.tar.gz
cd cmatrix-2.0

./autogen.sh
./configure --prefix=/usr

make -j"$MAKETHREADS"
DESTDIR="$DESTDIR" make install
