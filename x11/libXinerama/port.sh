#!/bin/bash

cd /usr/ports/x11/libXinerama

git clone https://gitlab.freedesktop.org/xorg/lib/libXinerama.git

cd libXinerama

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
