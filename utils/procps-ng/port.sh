#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/utils/procps-ng"

curl -LO https://sourceforge.net/projects/procps-ng/files/Production/procps-ng-4.0.4.tar.xz/download -o procps-ng-4.0.4.tar.xz

tar -xf procps-ng-4.0.4.tar.xz

cd procps-ng-4.0.4
./configure --prefix=/usr
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

