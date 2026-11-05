#!/bin/bash
set -e
cd /usr/ports/system/gptfdisk
curl -LO https://downloads.sourceforge.net/project/gptfdisk/gptfdisk/1.0.10/gptfdisk-1.0.10.tar.gz
tar -xf gptfdisk-1.0.10.tar.gz
cd gptfdisk-1.0.10
make -j"$MAKETHREADS"
make PREFIX=/usr DESTDIR="$DESTDIR" install -j"$MAKETHREADS"
