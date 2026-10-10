#!/bin/bash

cd /usr/ports/x11/libXfixes

git clone https://gitlab.freedesktop.org/xorg/lib/libXfixes.git

cd libXfixes

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
