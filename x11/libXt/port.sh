#!/bin/bash

cd /usr/ports/x11/libXt

git clone https://gitlab.freedesktop.org/xorg/lib/libXt.git

cd libXt

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
