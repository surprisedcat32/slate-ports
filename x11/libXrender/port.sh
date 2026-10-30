#!/bin/bash

cd /usr/ports/x11/libXrender

git clone --depth 1 https://gitlab.freedesktop.org/xorg/lib/libXrender.git

cd libXrender

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
