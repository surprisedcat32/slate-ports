#!/bin/sh
set -euo pipefail
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR
curl -LO https://github.com/surprisedcat32/slate/releases/download/0.4/dev.tar.gz
tar -xf dev.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR
DESTDIR=""
cp -a usr "$DESTDIR"/
