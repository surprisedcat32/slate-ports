#!/bin/bash

cd /usr/ports/lib/zlib

curl -LO https://www.zlib.net/zlib-1.3.2.tar.xz
tar -xf zlib-1.3.2.tar.xz
cd zlib-1.3.2

./configure --prefix=/usr

make -j"$(nproc)"

make DESTDIR="$DESTDIR" install
