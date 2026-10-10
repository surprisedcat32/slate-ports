#!/bin/sh
cd /usr/ports/x11/st
git clone https://git.suckless.org/st
cp config.mk st/
cd st
make
make install
