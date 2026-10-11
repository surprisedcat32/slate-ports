#!/bin/bash

cd /usr/ports/x11/twm

git clone https://gitlab.freedesktop.org/xorg/app/twm.git

cd twm

./autogen.sh

./configure --prefix=/usr

make -j"$(nproc)"

make install
