#!/bin/bash

cd /usr/ports/x11/libXfont2

curl -LO https://mirror.csclub.uwaterloo.ca/x.org/individual/lib/libXfont2-2.0.6.tar.xz
tar -xf libXfont2-2.0.6.tar.xz
cd libXfont2-2.0.6

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
