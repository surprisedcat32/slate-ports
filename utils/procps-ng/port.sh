#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://sourceforge.net/projects/procps-ng/files/Production/procps-ng-4.0.4.tar.xz/download -o procps-ng-4.0.4.tar.xz

tar -xf procps-ng-4.0.4.tar.xz
cd "$(tar -tf procps-ng-4.0.4.tar.xz | head -1 | cut -d/ -f1)"

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
./configure --prefix=/usr
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

