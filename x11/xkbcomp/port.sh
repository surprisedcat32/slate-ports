#!/bin/bash

cd /usr/ports/x11/xkbcomp

git clone https://gitlab.freedesktop.org/xorg/app/xkbcomp.git

cd xkbcomp

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
