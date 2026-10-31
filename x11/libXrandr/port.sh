#!/bin/bash

cd /usr/ports/x11/libXrandr

git clone --depth 1 https://gitlab.freedesktop.org/xorg/lib/libXrandr.git

cd libXrandr

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make DESTDIR="$DESTDIR" install
