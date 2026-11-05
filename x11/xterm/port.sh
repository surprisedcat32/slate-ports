#!/bin/bash
cd /usr/ports/x11/xterm
curl -LO https://invisible-mirror.net/archives/xterm/xterm-412.tgz
tar -xf xterm-412.tgz
cd xterm-412
./configure --prefix=/usr --enable-256-color --enable-load-vt-fonts --disable-imake 
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
