#!/bin/bash
set -e

cd /usr/ports/x11/xclip

curl -LO https://github.com/astrand/xclip/archive/0.13.tar.gz
tar -xf 0.13.tar.gz
cd xclip-0.13

autoreconf -fi
./configure --prefix=/usr

make
make DESTDIR="$DESTDIR" install install.man
