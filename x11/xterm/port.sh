#!/bin/bash
cd /usr/ports/x11/xterm
curl -LO https://invisible-island.net/archives/xterm/xterm-411.tgz
tar -xf xterm-411.tgz
cd xterm-411
./configure --prefix=/usr --enable-256-color --enable-load-vt-fonts --disable-imake
make -j"$(nproc)"
make install
