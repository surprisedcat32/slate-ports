#!/bin/bash
if [ ! -f "/usr/ports/installed/devel" ]; then
    slate install dev/dev
fi
if [ ! -f "/usr/ports/installed/zlib" ]; then
    slate install lib/zlib
fi

cd /usr/ports/utilities/zip

curl -LO https://downloads.sourceforge.net/infozip/unzip60.tgz
curl -LO https://downloads.sourceforge.net/infozip/zip30.tar.gz

tar -xf unzip60.tgz
tar -xf zip30.tar.gz

cd unzip60
make -f unix/Makefile generic
make -f unix/Makefile prefix=/usr install
cd ..

cd zip30
make -f unix/Makefile generic
make -f unix/Makefile prefix=/usr install

touch /usr/ports/installed/unzip
touch /usr/ports/installed/zip
