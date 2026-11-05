#!/bin/bash
set -e
cd /usr/ports/lib/icu
curl -LO https://github.com/unicode-org/icu/releases/download/release-79-1/icu4c-79_1-src.tgz
tar -xf icu4c-79_1-src.tgz
cd icu/source
./runConfigureICU Linux --prefix=/usr
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
