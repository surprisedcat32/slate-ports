#!/bin/bash
set -e

cd /usr/ports/x11/scrot

curl -LO https://github.com/resurrecting-open-source-projects/scrot/releases/download/2.0.0/scrot-2.0.0.tar.gz
tar -xf scrot-2.0.0.tar.gz
cd scrot-2.0.0

./configure --prefix=/usr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
