#!/bin/bash
if [ ! -f "/usr/ports/installed/devel" ]; then
    slate install dev/dev
fi
cd /usr/ports/system/musl-libc
curl -LO https://musl.libc.org/releases/musl-1.2.6.tar.gz
tar -xf musl-1.2.6.tar.gz
cd musl-1.2.6
./configure
make -j$(nrpoc)
make install
touch /usr/ports/installed/musl
touch /usr/ports/installed/musl-libc


