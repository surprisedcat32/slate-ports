#!/bin/bash

cd /usr/ports/x11/openbox

curl -LO https://openbox.org/dist/openbox/openbox-3.6.1.tar.xz
tar -xf openbox-3.6.1.tar.xz
cd openbox-3.6.1
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
./bootstrap

./configure     --prefix=/usr     --sysconfdir=/etc     --disable-nls

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
