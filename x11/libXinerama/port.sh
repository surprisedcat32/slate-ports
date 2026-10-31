#!/bin/bash

cd /usr/ports/x11/libXinerama

curl -LO https://xorg.freedesktop.org/releases/individual/lib/libXinerama-1.1.tar.gz
tar -xf libXinerama-1.1.tar.gz
cd libXinerama-1.1

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make DESTDIR="$DESTDIR" install
