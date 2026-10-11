#!/bin/bash

cd /usr/ports/x11/libXext

git clone https://gitlab.freedesktop.org/xorg/lib/libXext.git

cd libXext

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
