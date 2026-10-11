#!/bin/bash

cd /usr/ports/x11/openbox

git clone https://github.com/Mikachu/openbox.git

cd openbox

./bootstrap

./configure     --prefix=/usr     --sysconfdir=/etc     --disable-nls

make -j"$(nproc)"

make install
