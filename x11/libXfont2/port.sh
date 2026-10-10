#!/bin/bash

cd /usr/ports/x11/libXfont2

git clone https://gitlab.freedesktop.org/xorg/lib/libXfont2.git

cd libXfont2

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
