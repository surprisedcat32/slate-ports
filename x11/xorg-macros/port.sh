#!/bin/bash

cd /usr/ports/x11/xorg-macros

git clone --depth 1 https://gitlab.freedesktop.org/xorg/util/macros.git xorg-macros

cd xorg-macros

./autogen.sh --prefix=/usr

make -j"$(nproc)"

make DESTDIR="$DESTDIR" install
