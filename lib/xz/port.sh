#!/bin/bash

cd /usr/ports/lib/xz

curl -LO https://tukaani.org/xz/xz-5.8.1.tar.gz

tar -xf xz-5.8.1.tar.gz

cd xz-5.8.1
./configure --prefix=/usr --disable-static
make -j"$(nproc)"
make DESTDIR="$DESTDIR" install

