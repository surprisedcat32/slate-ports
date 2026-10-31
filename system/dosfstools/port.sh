#!/bin/bash
slate install dev/dev

cd /usr/ports/system/dosfstools

curl -LO https://github.com/dosfstools/dosfstools/releases/download/v4.2/dosfstools-4.2.tar.gz

tar -xf dosfstools-4.2.tar.gz

cd dosfstools-4.2
./configure --prefix=/usr --sbindir=/usr/sbin
make -j"$(nproc)"
make DESTDIR="$DESTDIR" install

