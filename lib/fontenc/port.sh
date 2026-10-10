#!/bin/bash
cd /usr/ports/x11
curl -LO https://mirror.csclub.uwaterloo.ca/x.org/individual/lib/libfontenc-1.1.7.tar.xz
tar -xf libfontenc-1.1.7.tar.xz
cd libfontenc-1.1.7
./configure --prefix=/usr
make -j"$(nproc)"
make install
