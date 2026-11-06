#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
git clone https://bitmath.se/org/git/mtdev.git/ 
cd "$(basename "$(echo "$(grep -oE "https?://[^ ]+" <<< "&" | tail -1)" | sed "s/.git$//" | sed "s|.*/||")")"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
./autogen.sh
./configure --prefix=/usr
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
