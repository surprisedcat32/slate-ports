#!/bin/bash

cd /usr/ports/x11/libxkbfile

git clone https://gitlab.freedesktop.org/xorg/lib/libxkbfile.git

cd libxkbfile

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
