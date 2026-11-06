#!/bin/sh
cd "${PORT_DIR:-/usr/ports}/lib/pcre2"
curl -LO https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.44/pcre2-10.44.tar.bz2
tar -xjf pcre2-10.44.tar.bz2
cd pcre2-10.44
./configure --prefix=/usr
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
