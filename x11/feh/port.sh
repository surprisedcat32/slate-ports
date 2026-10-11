#!/bin/bash

cd /usr/ports/x11/feh

git clone https://github.com/derf/feh.git

cd feh

make clean

make -j"$(nproc)" PREFIX=/usr

make install PREFIX=/usr
