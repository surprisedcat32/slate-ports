#!/bin/bash

cd /usr/ports/x11/feh

git clone --depth 1 https://github.com/derf/feh.git

cd feh

make clean -j"$MAKETHREADS"

make PREFIX=/usr -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install PREFIX=/usr -j"$MAKETHREADS"
