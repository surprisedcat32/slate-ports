#!/bin/bash
slate install dev/dev

cd /usr/ports/utilities/procps-ng

curl -LO https://sourceforge.net/projects/procps-ng/files/Production/procps-ng-4.0.4.tar.xz/download -o procps-ng-4.0.4.tar.xz

tar -xf procps-ng-4.0.4.tar.xz

cd procps-ng-4.0.4
./configure --prefix=/usr
make -j"$(nproc)"
make DESTDIR="$DESTDIR" install

