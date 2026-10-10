#!/bin/sh
cd /usr/ports/x11/dmenu
git clone https://git.suckless.org/dmenu
cd dmenu
make
make install
