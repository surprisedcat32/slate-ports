#!/bin/bash

cd /usr/ports/x11/libXpm

curl -LO https://xorg.freedesktop.org/releases/individual/lib/libXpm-3.5.20.tar.xz
tar -xf libXpm-3.5.20.tar.xz
cd libXpm-3.5.20.tar.xz

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make DESTDIR="$DESTDIR" install
