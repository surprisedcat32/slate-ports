#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/utils/neofetch

git clone --depth=1 https://github.com/dylanaraps/neofetch.git

cd neofetch

make DESTDIR="$DESTDIR" install
