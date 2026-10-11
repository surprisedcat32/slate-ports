#!/bin/bash

cd /usr/ports/xorg-clocks

git clone https://gitlab.freedesktop.org/xorg/app/xclock.git

cd xclock

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
