#!/bin/bash

cd /usr/ports/x11

git clone https://gitlab.freedesktop.org/xorg/util/macros.git xorg-macros

cd xorg-macros

./autogen.sh --prefix=/usr

make -j"$(nproc)"

make install
