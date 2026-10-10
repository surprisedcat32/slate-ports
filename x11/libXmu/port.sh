#!/bin/bash

cd /usr/ports/x11/libXmu

git clone https://gitlab.freedesktop.org/xorg/lib/libXmu.git

cd libXmu

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
