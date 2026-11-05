#!/bin/bash
set -e

cd /usr/ports/net/iproute2
curl -LO https://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-7.3.0.tar.xz
tar -xf iproute2-7.3.0.tar.xz
cd iproute2-7.3.0

./configure

make
make DESTDIR="$DESTDIR" install
