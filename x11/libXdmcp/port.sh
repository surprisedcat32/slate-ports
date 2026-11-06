#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/x11/libXdmcp"

curl -LO https://www.x.org/pub/individual/lib/libXdmcp-1.1.5.tar.xz 
tar -xf libXdmcp-1.1.5.tar.xz

cd libXdmcp-1.1.5
./autogen.sh --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
