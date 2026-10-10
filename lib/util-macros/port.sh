#!/bin/bash

cd /usr/ports/lib/util-macros

wget https://xorg.freedesktop.org/archive/individual/util/util-macros-1.20.2.tar.xz

tar -xf util-macros-1.20.2.tar.xz

cd util-macros-1.20.2

./configure --prefix=/usr

make install
