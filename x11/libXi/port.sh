#!/bin/bash

cd /usr/ports/x11/libXi

git clone --depth 1 https://gitlab.freedesktop.org/xorg/lib/libXi.git

cd libXi

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
