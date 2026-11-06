#!/bin/sh
set -euo pipefail
cd /tmp
curl -LO https://github.com/surprisedcat32/slate/releases/download/0.4/dev.tar.gz
tar -xf dev.tar.gz
cd devs
DESTDIR=""
cp -a usr "$DESTDIR"/
