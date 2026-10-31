#!/bin/bash
cd /usr/ports/utilities/zip

curl -LO https://downloads.sourceforge.net/infozip/unzip60.tgz
curl -LO https://downloads.sourceforge.net/infozip/zip30.tar.gz

tar -xf unzip60.tgz
tar -xf zip30.tar.gz

cd unzip60
make -f unix/Makefile generic
make DESTDIR="$DESTDIR" -f unix/Makefile prefix=/usr install
cd ..

cd zip30
make -f unix/Makefile generic
make DESTDIR="$DESTDIR" -f unix/Makefile prefix=/usr install

