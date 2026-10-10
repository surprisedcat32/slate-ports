#!/bin/sh
cd /usr/ports/x11/st
git clone https://git.suckless.org/st
cd st
make
make install
