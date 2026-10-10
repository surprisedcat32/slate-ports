#!/bin/bash

cd /usr/ports/x11/libXft

git clone https://gitlab.freedesktop.org/xorg/lib/libXft.git

cd libXft

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
