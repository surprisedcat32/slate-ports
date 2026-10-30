#!/bin/bash
slate install dev/dev

cd /usr/ports/utilities/less

curl -LO https://www.greenwoodsoftware.com/less/less-668.tar.gz

tar -xf less-668.tar.gz

cd less-668
./configure --prefix=/usr
make -j"$(nproc)"
make install

