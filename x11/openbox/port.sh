#!/bin/bash

cd /usr/ports/x11/openbox

git clone https://github.com/Mikachu/openbox.git

cd openbox
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
./bootstrap

./configure     --prefix=/usr     --sysconfdir=/etc     --disable-nls

make -j"$(nproc)"

make install
