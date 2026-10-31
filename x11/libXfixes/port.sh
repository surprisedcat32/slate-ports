#!/bin/bash

cd /usr/ports/x11/libXfixes

git clone --depth 1 https://gitlab.freedesktop.org/xorg/lib/libXfixes.git

cd libXfixes

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make DESTDIR="$DESTDIR" install
