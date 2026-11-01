#!/bin/sh
cd /usr/ports/x11/dmenu
curl -LO https://dl.suckless.org/tools/dmenu-5.4.tar.gz
tar -xf dmenu-5.4.tar.gz
cd dmenu-5.4
make
make DESTDIR="$DESTDIR" install
