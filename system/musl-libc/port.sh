#!/bin/bash
slate install dev/dev
cd /usr/ports/system/musl-libc
curl -LO https://musl.libc.org/releases/musl-1.2.6.tar.gz
tar -xf musl-1.2.6.tar.gz
cd musl-1.2.6
./configure
make -j$(nproc)
make DESTDIR="$DESTDIR" install


