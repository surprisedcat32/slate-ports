#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

git clone --depth=1 https://gitlab.com/OldManProgrammer/unix-tree.git

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
