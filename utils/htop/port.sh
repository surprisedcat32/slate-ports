#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
git clone --depth=1 https://github.com/htop-dev/htop.git
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
./autogen.sh
make clean -j"$MAKETHREADS"
./configure --disable-unicode
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
