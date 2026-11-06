#!/bin/bash
cd /usr/ports/utils/sent

curl -LO https://dl.suckless.org/tools/sent-1.3.tar.gz
tar -xf sent-1.3.tar.gz
cd sent-1.3

make -j"$MAKETHREADS"
make PREFIX=/usr DESTDIR="$DESTDIR" install
