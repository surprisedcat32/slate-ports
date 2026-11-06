#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://xorg.freedesktop.org/archive/individual/util/util-macros-1.20.2.tar.xz

tar -xf util-macros-1.20.2.tar.xz

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure --prefix=/usr

make DESTDIR="$DESTDIR" install
