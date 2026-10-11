#!/bin/sh
cd /usr/ports/x11/st
git clone https://git.suckless.org/st
cp config.mk st/
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
cd st
make
make install
