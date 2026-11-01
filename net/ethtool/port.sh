#!/bin/bash
set -e
cd /usr/ports/net/ethtool
curl -LO https://kernel.org/pub/software/network/ethtool/ethtool-7.2.tar.xz
tar -xf ethtool-7.2.tar.xz
cd ethtool-7.2
./configure --prefix=/usr
make
make DESTDIR="$DESTDIR" install
