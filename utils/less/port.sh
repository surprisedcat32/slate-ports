#!/bin/bash
cd /usr/ports/utils/less

curl -LO https://www.greenwoodsoftware.com/less/less-668.tar.gz

tar -xf less-668.tar.gz

cd less-668
./configure --prefix=/usr
make
make DESTDIR="$DESTDIR" install

