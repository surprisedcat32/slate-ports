#!/bin/bash
cd /usr/ports/system/mtdev
git clone https://bitmath.se/org/git/mtdev.git/ 
cd mtdev
./autogen.sh
./configure --prefix=/usr
make -j"$(nproc)"
make DESTDIR="$DESTDIR" install
