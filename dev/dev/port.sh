#!/bin/sh
cd /tmp/
wget https://github.com/surprisedcat32/slate/releases/download/0.4/dev.tar.gz
tar -xf dev.tar.gz -C "${DESTDIR:-/}" --strip-components=1
