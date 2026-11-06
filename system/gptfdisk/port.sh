#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://downloads.sourceforge.net/project/gptfdisk/gptfdisk/1.0.10/gptfdisk-1.0.10.tar.gz
tar -xf gptfdisk-1.0.10.tar.gz
cd "$(tar -tf gptfdisk-1.0.10.tar.gz | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
make -j"$MAKETHREADS"
make PREFIX=/usr DESTDIR="$DESTDIR" install
