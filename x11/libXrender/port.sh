#!/bin/bash

cd /usr/ports/x11/libXrender

git clone https://gitlab.freedesktop.org/xorg/lib/libXrender.git

cd libXrender

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
