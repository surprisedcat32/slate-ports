#!/bin/bash

cd /usr/ports/x11/libXau

git clone https://gitlab.freedesktop.org/xorg/lib/libxau.git

cd libxau

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
