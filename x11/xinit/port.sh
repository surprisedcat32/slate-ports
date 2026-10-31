#!/bin/bash

cd /usr/ports/x11/xinit

curl -LO https://xorg.freedesktop.org/releases/individual/app/xinit-1.4.4.tar.xz
tar -xf xinit-1.4.4.tar.xz
cd xinit-1.4.4

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make DESTDIR="$DESTDIR" install
