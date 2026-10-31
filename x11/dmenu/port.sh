#!/bin/sh
cd /usr/ports/x11/dmenu
git clone --depth 1 https://git.suckless.org/dmenu
cd dmenu
make
make DESTDIR="$DESTDIR" install
