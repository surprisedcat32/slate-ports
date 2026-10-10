#!/bin/bash

cd /usr/ports/x11/libX11

git clone https://gitlab.freedesktop.org/xorg/lib/libX11.git

cd libX11

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
