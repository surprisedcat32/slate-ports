#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://github.com/ninja-build/ninja/archive/refs/tags/v1.13.2.tar.gz
tar -xf v1.13.2.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

python3 configure.py --bootstrap

install -Dm755 ninja ${DESTDIR:-}/usr/bin/ninja
