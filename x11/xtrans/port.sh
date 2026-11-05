#!/bin/bash
cd /usr/ports/x11/xtrans
git clone --depth 1 https://gitlab.freedesktop.org/xorg/lib/libxtrans.git
cd libxtrans
./autogen.sh
./configure --prefix=/usr
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install -j"$MAKETHREADS"
