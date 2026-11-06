#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
git clone --depth=1 https://github.com/htop-dev/htop.git
cd htop
cd "$(basename "$(echo "$(grep -oE "https?://[^ ]+" <<< "&" | tail -1)" | sed "s/.git$//" | sed "s|.*/||")")"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
./autogen.sh
make clean -j"$MAKETHREADS"
./configure --disable-unicode
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
