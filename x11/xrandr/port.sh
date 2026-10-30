#!/bin/bash

cd /usr/ports/x11/xrandr

git clone --depth 1 https://gitlab.freedesktop.org/xorg/app/xrandr.git

cd xrandr

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
